package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.Ordine;

public interface OrdineDao {
	public void save(Ordine ordine);
	public void delete(Ordine ordine);
	public List<Ordine> findOrdiniByIdUtete(Long id);
}
