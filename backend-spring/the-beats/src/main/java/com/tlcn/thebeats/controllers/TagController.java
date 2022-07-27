package com.tlcn.thebeats.controllers;

import java.util.List;

import com.tlcn.thebeats.models.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tlcn.thebeats.models.Tag;
import com.tlcn.thebeats.payload.request.EditTagRequest;
import com.tlcn.thebeats.repository.TagRepository;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/tag")
public class TagController {
	
	@Autowired
	private TagRepository tagRepo;
	
	@PostMapping("/add")
	public Tag addTag(@RequestParam String title )
	{
		return tagRepo.save(new Tag(title));
	}
	
	@GetMapping("/all")
	public List<Tag> getALL()
	{
		return tagRepo.findAll();
	}
	
	@DeleteMapping("/delete/{id}")
	public void deleteTag(@PathVariable int id)
	{
		tagRepo.deleteById(id);
	}
	
	@PostMapping("/edit")
	public Tag editTag(@RequestBody EditTagRequest editTagRequest)
	{
		Tag tag = tagRepo.findById(editTagRequest.getId()).orElseThrow(()-> new RuntimeException("Tag not found"));
		
		tag.setTitle(editTagRequest.getTitle());
		return tagRepo.save(tag);
	}

	@GetMapping("/list-tag")
	public List<Tag> getPageArtist(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "100") int size)
	{
		Pageable paging = PageRequest.of(page, size);
		Page<Tag> pageTag= tagRepo.findAll(paging);
		return pageTag.getContent();
	}

}
