package com.findhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.findhome.model.Annuncio;
import com.findhome.persistence.DBManager;

@Controller
public class AnnuncioController {
	@GetMapping("/annuncioElenco")
	public String dammiElencoVenditori() {
		return "elenco_annunci";
	}

	@GetMapping("/annuncioPage/{a}")
	public String getAnnuncioSingolo(@PathVariable("a") Long id, Model model) {

		Annuncio annuncio = DBManager.getInstance().annuncioDaoJdbc().findByKey(id);

		model.addAttribute("annuncio", annuncio);
		return "annuncio";
	}

	@GetMapping("/elencoAnnunci")
	public String getAnnunci() {

		return "elenco_annunci";
	}
}
