package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.Visita;

public interface VisitaDao {
	public void save(Visita visita);
	public void delete(Visita visita);
	public void abilita(Visita visita);
	public List<Visita> findAll();
}
