package com.tlcn.thebeats.payment;

import java.util.Date;
import java.util.List;

import com.tlcn.thebeats.models.*;
import com.tlcn.thebeats.repository.ArtistRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.tlcn.thebeats.payload.response.ReviewResponse;
import com.tlcn.thebeats.payload.response.URLResponse;
import com.tlcn.thebeats.repository.BoughtSongRepository;
import com.tlcn.thebeats.repository.CartItemRepository;
import com.tlcn.thebeats.repository.UserRepository;

@RestController
@CrossOrigin("*")
public class PaypalController {

	private Logger logger = LoggerFactory.getLogger(PaypalController.class);

	@Autowired
	PaypalService service;

	@Autowired
	private CartItemRepository cartItemRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BoughtSongRepository boughtSongRepository;

	@Autowired
	private ArtistRepository artistRepository;

	public static final String SUCCESS_URL = "pay/success";

	public static final String CANCEL_URL = "pay/cancel";

	@GetMapping("/")
	public String home() {
		return "home";
	}

	@GetMapping("/review")
	public ReviewResponse getReviewPayment(@RequestParam("paymentId") String paymentId) {
		Payment payment;
		try {
			payment = service.getPaymentDetails(paymentId);
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			ReviewResponse reviewResponse = new ReviewResponse(payerInfo, transaction, shippingAddress);
			return reviewResponse;
		} catch (PayPalRESTException e) {
			logger.info("----------", e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		throw new RuntimeException("Not found PaymentID");

	}
	
	@PostMapping("/pay")
	public URLResponse payment(@RequestBody Order order) {
		try {
			Payment payment = service.createPayment(order.getEmailPaypal(), order.getItems(), order.getTotal(), order.getCurrency(),
					order.getMethod(), order.getIntent(), order.getDescription(), "http://localhost:4200/",
					order.getSuccessUrl());
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return new URLResponse(link.getHref());
				}
			}

		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}
		return new URLResponse("/");
	}
	

	@GetMapping(value = CANCEL_URL)
	public String cancelPay() {
		return "cancel";
	}

	@GetMapping(value = SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId,
							 @RequestParam("PayerID") String payerId,
							 @RequestParam int userId) {
		logger.info("====pay/success: paymentId:" + paymentId);
		logger.info("====pay/success: payerId:" + payerId);
		logger.info("====pay/success: userId:" + userId);
		try {
			Payment payment = service.executePayment(paymentId, payerId);
			logger.info("===payment: " + payment.toString());
			if (payment.getState().equals("approved")) {
				List<CartItem> items = cartItemRepository.findByUserId(userId);

				User user = userRepository.findById((long) userId)
						.orElseThrow(() -> new RuntimeException("User not found to add song"));

				items.stream().forEach(item -> {
					logger.info("===item: " + item.toString());
					BoughtSong boughtSong = new BoughtSong();
					boughtSong.setBuyerId(userId);
					boughtSong.setArtistId(item.getArtistId());
					boughtSong.setSongId(item.getSongId());
					boughtSong.setDate(new Date().getTime());
					boughtSong.setPrice(item.getPrice());
					logger.info("===bought song: " + boughtSong.toString());

					Artist artist = artistRepository.findById(item.getArtistId())
									.orElseThrow(() -> new RuntimeException("artist not found in item!"));
					artist.setPayslip(artist.getPayslip() + item.getPrice());
					artistRepository.save(artist);

					userRepository.saveSong(userId, item.getSongId());
					boughtSongRepository.save(boughtSong);
				});
				cartItemRepository.deleteAllByUserId(userId);
				return "";
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
	
	
	@GetMapping("/artist/pay/success")
	public String artistSuccessPay(@RequestParam("paymentId") String paymentId,
								   @RequestParam("PayerID") String payerId,
								   @RequestParam int userId) {
		logger.info("====/artist/pay/success: paymentId:" + paymentId);
		logger.info("====/artist/pay/success: payerId:" + payerId);
		logger.info("====/artist/pay/success: userId:" + userId);
		try {
			Payment payment = service.executePayment(paymentId, payerId);
			logger.info("====/artist/pay/success: " + payment.toString());
			if (payment.getState().equals("approved")) {
				boughtSongRepository.updatePayslip(userId);	
				boughtSongRepository.upadteBoughtSong(userId);
				return "";
			}
		} catch (PayPalRESTException e) {
			logger.error("====/artist/pay/success: ", e.getMessage());
		}
		return "redirect:/";
	}

}
