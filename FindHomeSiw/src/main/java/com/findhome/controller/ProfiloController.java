package com.findhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfiloController {
	
	@GetMapping("/profiloUtente")
	public String getProfilo() {
		return "profilo_privato";
	}

}
