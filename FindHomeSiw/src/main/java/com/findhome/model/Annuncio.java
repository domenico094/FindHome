package com.findhome.model;

import java.util.Objects;

public class Annuncio {

	private Long id;
	private Long idVenditore;
	private String descrizione;
	private boolean vendita;
	private double prezzo;
	private int metriQuadri;

	private String tipologia;
	private String luogo;

	// equivale all'indirizzo;
	private String posizione;

	private String img0;
	private String img1;
	private String img2;
	private String img3;

	private String img4;
	private String img5;
	float latitudine;
	float longitudine;

	public Annuncio() {
	}

	public Annuncio(Long id, Long idVenditore, String descrizione, boolean vendita, double prezzo, int metriQuadri,
			String tipologia, String luogo, String posizione, String img0, String img1, String img2, String img3,
			String img4, String img5, float latitudine, float longitudine) {
		super();
		this.id = id;
		this.idVenditore = idVenditore;
		this.descrizione = descrizione;
		this.vendita = vendita;
		this.prezzo = prezzo;
		this.metriQuadri = metriQuadri;
		this.tipologia = tipologia;
		this.luogo = luogo;
		this.posizione = posizione;
		this.img0 = img0;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
		this.latitudine = latitudine;
		this.longitudine = longitudine;
	}

	@Override
	public int hashCode() {
		return Objects.hash(descrizione, id, idVenditore, img0, img1, img2, img3, img4, img5, latitudine, longitudine,
				luogo, metriQuadri, posizione, prezzo, tipologia, vendita);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Annuncio other = (Annuncio) obj;
		return Objects.equals(descrizione, other.descrizione) && Objects.equals(id, other.id)
				&& Objects.equals(idVenditore, other.idVenditore) && Objects.equals(img0, other.img0)
				&& Objects.equals(img1, other.img1) && Objects.equals(img2, other.img2)
				&& Objects.equals(img3, other.img3) && Objects.equals(img4, other.img4)
				&& Objects.equals(img5, other.img5)
				&& Float.floatToIntBits(latitudine) == Float.floatToIntBits(other.latitudine)
				&& Float.floatToIntBits(longitudine) == Float.floatToIntBits(other.longitudine)
				&& Objects.equals(luogo, other.luogo) && metriQuadri == other.metriQuadri
				&& Objects.equals(posizione, other.posizione)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo)
				&& Objects.equals(tipologia, other.tipologia) && vendita == other.vendita;
	}

	public float getLatitudine() {
		return latitudine;
	}

	public void setLatitudine(float latitudine) {
		this.latitudine = latitudine;
	}

	public float getLongitudine() {
		return longitudine;
	}

	public void setLongitudine(float longitudine) {
		this.longitudine = longitudine;
	}

	public boolean isVendita() {
		return vendita;
	}

	public void setVendita(boolean vendita) {
		this.vendita = vendita;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	public String getLuogo() {
		return luogo;
	}

	public void setLuogo(String luogo) {
		this.luogo = luogo;
	}

	public String getPosizione() {
		return posizione;
	}

	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIdVenditore() {
		return idVenditore;
	}

	public void setIdVenditore(Long idVenditore) {
		this.idVenditore = idVenditore;
	}

	public String getImg0() {
		return img0;
	}

	public void setImg0(String img0) {
		this.img0 = img0;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public String getImg5() {
		return img5;
	}

	public void setImg5(String img5) {
		this.img5 = img5;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public int getMetriQuadri() {
		return metriQuadri;
	}

	public void setMetriQuadri(int metriQuadri) {
		this.metriQuadri = metriQuadri;
	}

}
