package com.findhome.model;

import java.util.Objects;

public class Ordine {
	
	private Long id;
	private Long idUtente;
	private Long idAnnuncio;


	public Ordine() {
		
	}


	

	public Ordine(Long id, Long idUtente, Long idAnnuncio) {
		super();
		this.id = id;
		this.idUtente = idUtente;
		this.idAnnuncio = idAnnuncio;
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


	public Long getIdAnnuncio() {
		return idAnnuncio;
	}


	public void setIdAnnuncio(Long idAnnuncio) {
		this.idAnnuncio = idAnnuncio;
	}




	@Override
	public int hashCode() {
		return Objects.hash(id, idAnnuncio, idUtente);
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ordine other = (Ordine) obj;
		return Objects.equals(id, other.id) && Objects.equals(idAnnuncio, other.idAnnuncio)
				&& Objects.equals(idUtente, other.idUtente);
	}
	
	
	

}

