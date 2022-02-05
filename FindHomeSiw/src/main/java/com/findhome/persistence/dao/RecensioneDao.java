package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.Recensione;

public interface RecensioneDao {
	
	public void save(Recensione recensione);
	public void delete(Recensione recensione);
	public List<Recensione> findAll();
	
}
