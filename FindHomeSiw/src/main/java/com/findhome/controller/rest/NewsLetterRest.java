package com.findhome.controller.rest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.persistence.DBManager;

@RestController
public class NewsLetterRest {
	
	@PostMapping("/addNeswLetter")
	public void aggiungiNewsLeter(@RequestBody String email) {
		DBManager.getInstance().newsLetterDaoJdbc().save(email);
	}
}
