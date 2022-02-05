package com.findhome.model;

import java.util.Objects;

public class Visita {
	private Long id;
	private Long idAcquirente;
	private Long idVenditore;
	private Long idAnnuncio;
	
	private boolean effettuata;
	public Visita() {
		// TODO Auto-generated constructor stub
	}
	public Visita(Long id, Long idAcquirente, Long idVenditore, Long idAnnuncio, boolean effettuata) {
		super();
		this.id = id;
		this.idAcquirente = idAcquirente;
		this.idVenditore = idVenditore;
		this.idAnnuncio = idAnnuncio;
		this.effettuata = effettuata;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdAcquirente() {
		return idAcquirente;
	}

	public void setIdAcquirente(Long idAcquirente) {
		this.idAcquirente = idAcquirente;
	}

	public Long getIdVenditore() {
		return idVenditore;
	}

	public void setIdVenditore(Long idVenditore) {
		this.idVenditore = idVenditore;
	}

	public Long getIdAnnuncio() {
		return idAnnuncio;
	}

	public void setIdAnnuncio(Long idAnnuncio) {
		this.idAnnuncio = idAnnuncio;
	}

	public boolean isEffettuata() {
		return effettuata;
	}

	public void setEffettuata(boolean effettuata) {
		this.effettuata = effettuata;
	}

	@Override
	public int hashCode() {
		return Objects.hash(effettuata, id, idAcquirente, idAnnuncio, idVenditore);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Visita other = (Visita) obj;
		return effettuata == other.effettuata && Objects.equals(id, other.id)
				&& Objects.equals(idAcquirente, other.idAcquirente) && Objects.equals(idAnnuncio, other.idAnnuncio)
				&& Objects.equals(idVenditore, other.idVenditore);
	}

	
}
