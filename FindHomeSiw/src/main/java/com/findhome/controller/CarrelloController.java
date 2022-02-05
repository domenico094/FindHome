package com.findhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CarrelloController {
	@GetMapping("/ilMioCarrello/{a}")
	public String getCarrello(@PathVariable("a")  Long id ) {
	
		return "carrello";
				
	}
}
