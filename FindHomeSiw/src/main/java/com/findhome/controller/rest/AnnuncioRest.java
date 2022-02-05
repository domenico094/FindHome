package com.findhome.controller.rest;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Annuncio;
import com.findhome.model.util.Ordina;
import com.findhome.persistence.DBManager;


@RestController
public class AnnuncioRest {
	
	@PostMapping("/aggiornaAnnuncio")
	public void aggiornaAnnuncioa(@RequestBody Annuncio annuncio) {
		DBManager.getInstance().annuncioDaoJdbc().update(annuncio);
	}
	
	
	@PostMapping("/addAnnuncio")
	public void aggiungiAnnuncio(@RequestBody Annuncio annuncio) {
		

		DBManager.getInstance().annuncioDaoJdbc().save(annuncio);
	}
	
	@PostMapping("/deleteAnnuncio")
	public void rimuoviAnnuncio(@RequestBody Annuncio annuncio) {
		DBManager.getInstance().annuncioDaoJdbc().delete(annuncio);
	}
	
	@PostMapping("/dammiAnnuncioById")
	public List<Annuncio> getById(@RequestBody Long id) {
		return DBManager.getInstance().annuncioDaoJdbc().findAnnunciByKey(id);
	}
	@PostMapping("dammiAnnuncio")
	public Annuncio dammiAnnuncio(@RequestBody Long id) {
		return DBManager.getInstance().annuncioDaoJdbc().findByKey(id);

	}
	
	@GetMapping("/dammiAnnunci")
	public List<Annuncio> dammiTuttiGliAnnunci() {
		List<Annuncio> annunci = DBManager.getInstance().annuncioDaoJdbc().findALL();
		return annunci;
	}
	
	@PostMapping("/dammiAnnunciVenditore")
	public List<Annuncio> dammiTuttiGliAnnunciDelVenditore(@RequestBody Long id) {
		
		List<Annuncio> annunci = DBManager.getInstance().annuncioDaoJdbc().findByIdVenditore(id);
	
		return annunci;
	}
	
	@GetMapping("/idCrescenteAnnuncio")
	public List<Annuncio> ordinaidCrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaidAnnuncioCrescente(annuncio);
		return annuncio;
	}
	
	@GetMapping("/idDecrescenteAnnuncio")
	public List<Annuncio> ordinaidDecrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaidAnnuncioDecrescente(annuncio);
		
		return annuncio;
	}
	
	@GetMapping("/mqCrescente")
	public List<Annuncio> ordinamqCrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaMqAnnuncioCrescente(annuncio);
		
		return annuncio;
	}
	
	@GetMapping("/mqDecrescente")
	public List<Annuncio> ordinamqDecrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaMqAnnuncioDecrescente(annuncio);
		
		return annuncio;
	}
	
	@GetMapping("/prezzoCrescente")
	public List<Annuncio> ordinaPrezzoCrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaPrezzoAnnuncioCrescente(annuncio);
		
		return annuncio;
	}
	
	@GetMapping("/prezzoDecrescente")
	public List<Annuncio> ordinaPrezzoDecrescente() {
		List<Annuncio> annuncio =  DBManager.getInstance().annuncioDaoJdbc().findALL();
		Ordina o = new Ordina();  o.ordinaPrezzoAnnuncioDecrescente(annuncio);
		
		return annuncio;
	}

	
}
