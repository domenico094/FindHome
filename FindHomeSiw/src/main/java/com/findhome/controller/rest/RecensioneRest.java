package com.findhome.controller.rest;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Recensione;
import com.findhome.persistence.DBManager;



@RestController
public class RecensioneRest {
	
	@PostMapping("/addRecensione")
	public void addRecensione(@RequestBody Recensione recensione) {
		System.out.println(recensione);

		DBManager.getInstance().recensioneDaoJdbc().save(recensione);
	}
	
	@PostMapping("/deleteRecensione")
	public void removeRecensione(@RequestBody Recensione recensione) {
		DBManager.getInstance().recensioneDaoJdbc().delete(recensione);
	}

	@GetMapping("/dammiRecensioni")
	public List<Recensione> addRecensione() {
		return DBManager.getInstance().recensioneDaoJdbc().findAll();

	}
}
