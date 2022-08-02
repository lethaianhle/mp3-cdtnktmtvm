package com.tlcn.thebeats.repository;

import com.tlcn.thebeats.models.ArtistInvoice;
import com.tlcn.thebeats.models.ArtistInvoiceItem;
import com.tlcn.thebeats.models.Song;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ArtistInvoiceRepositoryTest {

    @Autowired
    SongRepository songRepository;

    @Autowired
    ArtistInvoiceRepository artistInvoiceRepository;

    @Autowired
    ArtistInvoiceItemRepository artistInvoiceItemRepository;

    @Test
    void addData() {
        Song song = songRepository.findById(9L).orElse(null);

        ArtistInvoiceItem artistInvoiceItem = new ArtistInvoiceItem();
        artistInvoiceItem.setSongName(song.getTitle());
        artistInvoiceItem.setCheckoutTimes(12);
        artistInvoiceItem.setTotal(60);
        artistInvoiceItem.setPrice(30);
        ArtistInvoiceItem artistInvoiceItem1 = artistInvoiceItemRepository.save(artistInvoiceItem);
        System.out.println(artistInvoiceItem1.toString());

        List<ArtistInvoiceItem> list = new ArrayList<>();
        list.add(artistInvoiceItem1);

        ArtistInvoice artistInvoice = new ArtistInvoice();
        artistInvoice.setId(1);
        artistInvoice.setArtistId(2);
        artistInvoice.setDate("1657219271789");
        artistInvoice.setTotal(30);
        artistInvoice.setPayee("444");
        artistInvoice.setPayer("4444");
        artistInvoice.setItems(list);
        ArtistInvoice invoice = artistInvoiceRepository.save(artistInvoice);
        System.out.println(invoice.toString());
    }

}