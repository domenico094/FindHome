package com.findhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.findhome.model.Utente;

import com.findhome.persistence.DBManager;


@Controller
public class UtenteController {

	@GetMapping("/elencoVenditori") 
	public String dammiElencoVenditori() {
		return "elenco_venditori";
	}
	
	@GetMapping("/venditorePage/{a}")
	public String getVenditoreSingolo(@PathVariable("a")  Long id , Model model){
	  Utente utente = DBManager.getInstance().utenteDaoJdbc().findByKey(id);
	  model.addAttribute("utente", utente);
	  return "profilo_pubblico";
	}
}
