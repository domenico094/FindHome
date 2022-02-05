package com.findhome.model.util;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.findhome.model.Annuncio;
import com.findhome.model.Utente;




public class Ordina {
	
	public void ordinaNomeCrescente(List<Utente> utente) {
		 
		 Collections.sort(utente, new Comparator<Utente>() {

				@Override
				public int compare(Utente o1, Utente o2) {
					return o1.getNome().compareTo(o2.getNome());
				}
			});
			
	 }
	
	public void ordinaNomeDecrescente(List<Utente> utente) {
		 
		 Collections.sort(utente, new Comparator<Utente>() {

				@Override
				public int compare(Utente o1, Utente o2) {
					return o2.getNome().compareTo(o1.getNome());
				}
			});
			
	 }
	
	public void ordinaCognomeCrescente(List<Utente> utente) {
		 
		 Collections.sort(utente, new Comparator<Utente>() {

				@Override
				public int compare(Utente o1, Utente o2) {
					return o1.getCognome().compareTo(o2.getCognome());
				}
			});
			
	 }
	
	public void ordinaCognomeDecrescente(List<Utente> utente) {
		 
		 Collections.sort(utente, new Comparator<Utente>() {

				@Override
				public int compare(Utente o1, Utente o2) {
					return o2.getCognome().compareTo(o1.getCognome());
				}
			});
			
	 }

	public void ordinaUsernameCrescente(List<Utente> utente) {
		Collections.sort(utente, new Comparator<Utente>() {

			@Override
			public int compare(Utente o1, Utente o2) {
				return o1.getUsername().compareTo(o2.getUsername());
			}
		});
		
		
	}

	public void ordinaUsernameDecrescente(List<Utente> utente) {
		Collections.sort(utente, new Comparator<Utente>() {

			@Override
			public int compare(Utente o1, Utente o2) {
				return o2.getUsername().compareTo(o1.getUsername());
			}
		});
		
		
	}

	public void ordinaidCrescente(List<Utente> utente) {
		Collections.sort(utente, new Comparator<Utente>() {

			@Override
			public int compare(Utente o1, Utente o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});	
		
	}

	public void ordinaidDecrescente(List<Utente> utente) {
		Collections.sort(utente, new Comparator<Utente>() {

			@Override
			public int compare(Utente o1, Utente o2) {
				return o2.getId().compareTo(o1.getId());
			}
		});		
	}

	
	
	public void ordinaidAnnuncioCrescente(List<Annuncio> annuncio) {
		Collections.sort(annuncio, new Comparator<Annuncio>() {

			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});	
		
	}

	public void ordinaidAnnuncioDecrescente(List<Annuncio> annuncio) {
		Collections.sort(annuncio, new Comparator<Annuncio>() {

			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				return o2.getId().compareTo(o1.getId());
			}
		});		
	}
	
	public void ordinaMqAnnuncioCrescente(List<Annuncio> annuncio) {
		
		Collections.sort(annuncio, new Comparator<Annuncio>() {

			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				Integer a = o1.getMetriQuadri();
				Integer b = o2.getMetriQuadri();
				return a.compareTo(b);
			}
		});	
		
	}

	public void ordinaMqAnnuncioDecrescente(List<Annuncio> annuncio) {
		Collections.sort(annuncio, new Comparator<Annuncio>() {
			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				Integer a = o1.getMetriQuadri();
				Integer b = o2.getMetriQuadri();
				return b.compareTo(a);
			}
		});		
	}
	
	public void ordinaPrezzoAnnuncioCrescente(List<Annuncio> annuncio) {
		Collections.sort(annuncio, new Comparator<Annuncio>() {

			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				Double a = o1.getPrezzo();
				Double b = o2.getPrezzo();
				return a.compareTo(b);
			}
		});	
	}
	
	public void ordinaPrezzoAnnuncioDecrescente(List<Annuncio> annuncio) {
		Collections.sort(annuncio, new Comparator<Annuncio>() {

			@Override
			public int compare(Annuncio o1, Annuncio o2) {
				Double a = o1.getPrezzo();
				Double b = o2.getPrezzo();
				return b.compareTo(a);
			}
		});	
	}
	
	
	
	
	
	
	
}
