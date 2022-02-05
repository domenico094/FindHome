package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.Annuncio;



public interface AnnuncioDAO {
	
	public void save(Annuncio annuncio);
	public void update(Annuncio annuncio);
	public void delete(Annuncio annuncio);

	public List<Annuncio> findALL();
	public Annuncio findByKey(Long id);
	
	public List<Annuncio> findAnnunciByKey(Long id);
	
	public List<Annuncio> findByIdVenditore(Long id);
	
	
	
}