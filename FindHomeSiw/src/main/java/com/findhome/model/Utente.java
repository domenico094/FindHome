package com.findhome.model;

import java.util.Objects;

public class Utente {
	private Long id;
	private String email;
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String accesso;
	private String img;
	private boolean bannato;

	public Utente() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getAccesso() {
		return accesso;
	}

	public void setAccesso(String accesso) {
		this.accesso = accesso;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public boolean isBannato() {
		return bannato;
	}

	public void setBannato(boolean bannato) {
		this.bannato = bannato;
	}

	public Utente(Long id, String email, String username, String password, String nome, String cognome, String accesso,
			String img, boolean bannato) {
		super();
		this.id = id;
		this.email = email;
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.accesso = accesso;
		this.img = img;
		this.bannato = bannato;
	}

	@Override
	public String toString() {
		return "Utente [id=" + id + ", email=" + email + ", username=" + username + ", password=" + password + ", nome="
				+ nome + ", cognome=" + cognome + ", accesso=" + accesso + ", img=" + img + ", bannato=" + bannato
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(accesso, bannato, cognome, email, id, img, nome, password, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Utente other = (Utente) obj;
		return Objects.equals(accesso, other.accesso) && bannato == other.bannato
				&& Objects.equals(cognome, other.cognome) && Objects.equals(email, other.email)
				&& Objects.equals(id, other.id) && Objects.equals(img, other.img) && Objects.equals(nome, other.nome)
				&& Objects.equals(password, other.password) && Objects.equals(username, other.username);
	}

}
