package com.findhome.controller.rest;


import java.util.List;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Utente;
import com.findhome.model.util.Ordina;
import com.findhome.persistence.DBManager;

@RestController
public class UtenteRest {
	

	@PostMapping("/aggiornaUtente")
	public void aggiornaUtente(@RequestBody Utente utente) {
		DBManager.getInstance().utenteDaoJdbc().update(utente);
	}
	
	
	
	@PostMapping("/addUtente")
	public void aggiungiUtente(@RequestBody Utente venditore) {
		DBManager.getInstance().utenteDaoJdbc().save(venditore);
	}
	@PostMapping("/deleteUtente")
	public void eliminaUtente(@RequestBody Utente venditore) {
		DBManager.getInstance().utenteDaoJdbc().delete(venditore);
	}
	
	@PostMapping("/findByKeyUtente")
	public Utente getUtente(@RequestBody Long id) {
		
		return DBManager.getInstance().utenteDaoJdbc().findByKey(id);
	}
	
	
	@GetMapping("/findAllUtenti")
	public List<Utente> getAllUtentii() {
		return DBManager.getInstance().utenteDaoJdbc().findAll();
	}
	
	

	@GetMapping("/nomeCrescente")
	public List<Utente> ordinaNomeCrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaNomeCrescente(utente);
		return utente;
	}
	
	@GetMapping("/nomeDecrescente")
	public List<Utente> ordinaNomeDecrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaNomeDecrescente(utente);
		return utente;
	}
	
	@GetMapping("/cognomeCrescente")
	public List<Utente> ordinaCognomeCrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaCognomeCrescente(utente);
		return utente;
	}
	
	@GetMapping("/cognomeDecrescente")
	public List<Utente> ordinaCognomeDecrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaCognomeDecrescente(utente);
		return utente;
	}
	
	@GetMapping("/usernameCrescente")
	public List<Utente> ordinaUsernameCrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaUsernameCrescente(utente);
		return utente;
	}
	
	@GetMapping("/usernameDecrescente")
	public List<Utente> ordinaUsernameDecrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaUsernameDecrescente(utente);
		return utente;
	}
	

	@GetMapping("/idCrescente")
	public List<Utente> ordinaidCrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaidCrescente(utente);
		return utente;
	}
	
	@GetMapping("/idDecrescente")
	public List<Utente> ordinaidDecrescente() {
		List<Utente> utente =  DBManager.getInstance().utenteDaoJdbc().findAll();
		Ordina o = new Ordina();  o.ordinaidDecrescente(utente);
		return utente;
	}
}
