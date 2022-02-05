package com.findhome.controller.rest;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Visita;
import com.findhome.persistence.DBManager;

@RestController
public class VisitaRest {
	
	@PostMapping("/addVisita")
	public void addVisita(@RequestBody Visita visita) {
		DBManager.getInstance().visitaDaoJdbc().save(visita);
	}
	
	@PostMapping("/deleteVisita")
	public void deleteVisita(@RequestBody Visita visita) {
		DBManager.getInstance().visitaDaoJdbc().delete(visita);
	}
	@PostMapping("/abilitaVisita")
	public void abilitaVisita(@RequestBody Visita visita) {
		DBManager.getInstance().visitaDaoJdbc().abilita(visita);
	}
	
	@GetMapping("/dammiVisite")
	public List<Visita> getVisite() {
		return DBManager.getInstance().visitaDaoJdbc().findAll();
	}
}
