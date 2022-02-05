package com.findhome.controller.rest;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.CartaDiCredito;
import com.findhome.persistence.DBManager;

@RestController
public class CartaDiCreditoRest {
	
	@PostMapping("/addCarta")
	public void aggiungiCarta(@RequestBody CartaDiCredito carta) {
		DBManager.getInstance().cartaDiCreditoDaoJdbc().save(carta);
	}
	@PostMapping("/deleteCarta")
	public void rimuoviCarta(@RequestBody CartaDiCredito carta) {
		DBManager.getInstance().cartaDiCreditoDaoJdbc().delete(carta);
	}
	
	@PostMapping("/findCartaById")
	public List<CartaDiCredito> getCartePerId(@RequestBody Long idUtente) {
	return 	DBManager.getInstance().cartaDiCreditoDaoJdbc().findCartaById(idUtente);
	}
	
	@PostMapping("/updateCarta") 
	public void updateCarta (@RequestBody CartaDiCredito carta) {
		DBManager.getInstance().cartaDiCreditoDaoJdbc().uptate(carta);
	}
	
}
