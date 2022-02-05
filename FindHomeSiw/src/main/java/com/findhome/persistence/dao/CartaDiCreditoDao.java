package com.findhome.persistence.dao;

import java.util.List;

import com.findhome.model.CartaDiCredito;

public interface CartaDiCreditoDao {
	
	public void save(CartaDiCredito cartaDiCredito);
	public void delete(CartaDiCredito cartaDiCredito);
	
	public List<CartaDiCredito> findCartaById(Long id);
	public void uptate(CartaDiCredito carta);
}
