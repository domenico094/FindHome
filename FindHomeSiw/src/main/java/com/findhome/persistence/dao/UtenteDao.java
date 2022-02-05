package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.Utente;

public interface UtenteDao {
	
	public void save(Utente utente);
	public void update(Utente utente);
	public void delete(Utente utente);

	
	public List<Utente> findAll();
	
	public Utente findByKey(Long id);
}
