package com.findhome.controller.rest;


import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Ordine;
import com.findhome.persistence.DBManager;

@RestController
public class OrdineRest {

	@PostMapping("/addOrdine")
	public void addOnCart(@RequestBody Ordine ordine) {
		DBManager.getInstance().ordineDaoJdbc().save(ordine);	
	}
	
	@PostMapping("/deleteOrdine")
	public void removeOnCart(@RequestBody Ordine ordine) {
		DBManager.getInstance().ordineDaoJdbc().delete(ordine);	
	}

	@PostMapping("/dammiOrdiniByIdUtente")
	public List<Ordine> getCart(@RequestBody Long idUtente) {
		return DBManager.getInstance().ordineDaoJdbc().findOrdiniByIdUtete(idUtente);	
	}
	
}
