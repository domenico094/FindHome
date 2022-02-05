package com.findhome.model;

import java.util.Objects;

public class CartaDiCredito {
	
	Long id;
	Long idUtente;
	
	String numeroSeriale;
	String cvv;
	String annoScadenza;
	String meseScadenza;
	double credito;
	
	
	
	
	public CartaDiCredito() {}

	
	public CartaDiCredito(Long id, Long idUtente, String numeroSeriale, String cvv, String annoScadenza,
			String meseScadenza, double credito) {
		super();
		this.id = id;
		this.idUtente = idUtente;
		this.numeroSeriale = numeroSeriale;
		this.cvv = cvv;
		this.annoScadenza = annoScadenza;
		this.meseScadenza = meseScadenza;
		this.credito = credito;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getIdUtente() {
		return idUtente;
	}


	public void setIdUtente(Long idUtente) {
		this.idUtente = idUtente;
	}


	public String getNumeroSeriale() {
		return numeroSeriale;
	}
	public void setNumeroSeriale(String numeroSeriale) {
		this.numeroSeriale = numeroSeriale;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getAnnoScadenza() {
		return annoScadenza;
	}
	public void setAnnoScadenza(String annoScadenza) {
		this.annoScadenza = annoScadenza;
	}
	public String getMeseScadenza() {
		return meseScadenza;
	}
	public void setMeseScadenza(String meseScadenza) {
		this.meseScadenza = meseScadenza;
	}
	public double getCredito() {
		return credito;
	}
	public void setCredito(double credito) {
		this.credito = credito;
	}


	@Override
	public int hashCode() {
		return Objects.hash(annoScadenza, credito, cvv, id, idUtente, meseScadenza, numeroSeriale);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartaDiCredito other = (CartaDiCredito) obj;
		return Objects.equals(annoScadenza, other.annoScadenza)
				&& Double.doubleToLongBits(credito) == Double.doubleToLongBits(other.credito)
				&& Objects.equals(cvv, other.cvv) && Objects.equals(id, other.id)
				&& Objects.equals(idUtente, other.idUtente) && Objects.equals(meseScadenza, other.meseScadenza)
				&& Objects.equals(numeroSeriale, other.numeroSeriale);
	}
	
	
}

