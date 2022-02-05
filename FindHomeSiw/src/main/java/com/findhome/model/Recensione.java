package com.findhome.model;

import java.util.Objects;

public class Recensione {
	private Long id;
	private Long idAcquirente;
	private Long idAnnuncio;
	private String titolo;
	private String autore;
	private String messaggio;
	
	
	public Recensione() {}
	
	
	

	public Recensione(Long id, Long idAcquirente, Long idAnnuncio, String titolo, String autore, String messaggio) {
		super();
		this.id = id;
		this.idAcquirente = idAcquirente;
		this.idAnnuncio = idAnnuncio;
		this.titolo = titolo;
		this.autore = autore;
		this.messaggio = messaggio;
	}




	public String getTitolo() {
		return titolo;
	}




	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}




	public String getAutore() {
		return autore;
	}




	public void setAutore(String autore) {
		this.autore = autore;
	}




	public Long getId() {
		return id;
	}




	@Override
	public int hashCode() {
		return Objects.hash(autore, id, idAcquirente, idAnnuncio, messaggio, titolo);
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recensione other = (Recensione) obj;
		return Objects.equals(autore, other.autore) && Objects.equals(id, other.id)
				&& Objects.equals(idAcquirente, other.idAcquirente) && Objects.equals(idAnnuncio, other.idAnnuncio)
				&& Objects.equals(messaggio, other.messaggio) && Objects.equals(titolo, other.titolo);
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
	public Long getIdAnnuncio() {
		return idAnnuncio;
	}
	public void setIdAnnuncio(Long idAnnuncio) {
		this.idAnnuncio = idAnnuncio;
	}
	public String getMessaggio() {
		return messaggio;
	}
	public void setMessaggio(String messaggio) {
		this.messaggio = messaggio;
	}

	
	
	
	
}
