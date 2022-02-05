package com.findhome.controller.rest;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.model.Utente;
import com.findhome.persistence.DBManager;

@RestController
public class EmailRest {

	@PostMapping("/inviaEmail")
	public static void sendEmail(@RequestBody String messaggio) throws MessagingException {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties properties = System.getProperties();
		System.out.println(messaggio);

		properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.smtp.port", "465");
		properties.setProperty("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.debug", "true");
		properties.put("mail.store.protocol", "pop3");
		properties.put("mail.transport.protocol", "smtp");
		String myAccount = "forspotify759@gmail.com";
		String pass = "Forspotify759?";

		List<String> list = DBManager.getInstance().newsLetterDaoJdbc().findAll();
		for (String i : list) {
			String recepient = i;

			try {

				Session session = Session.getInstance(properties, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(myAccount, pass);
					}
				});

				Message message = new MimeMessage(session);

				message.setFrom(new InternetAddress(myAccount));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recepient, false));
				message.setSubject("NewsLetter");
				System.out.println(messaggio);
				message.setText(messaggio);
				message.setSentDate(new Date());
				Transport.send(message);

				System.out.println("Messaggio inviato.");
			} catch (MessagingException e) {
				System.out.println("ERRORE! " + e);
			}
		}

	}

	@PostMapping("/inviaEmailVenditori")
	public static void sendEmailVenditori(@RequestBody String messaggio) throws MessagingException {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties properties = System.getProperties();
		
		properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.smtp.port", "465");
		properties.setProperty("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.debug", "true");
		properties.put("mail.store.protocol", "pop3");
		properties.put("mail.transport.protocol", "smtp");
		String myAccount = "forspotify759@gmail.com";
		String pass = "Forspotify759?";

		List<Utente> list = DBManager.getInstance().utenteDaoJdbc().findAll();
		for (Utente i : list) {
			
			if (i.getAccesso().equals("Venditore")) {
				String recepient = i.getEmail();
				

				try {

					Session session = Session.getInstance(properties, new Authenticator() {
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(myAccount, pass);
						}
					});

					Message message = new MimeMessage(session);

					message.setFrom(new InternetAddress(myAccount));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recepient, false));
					message.setSubject("NewsLetter");
					System.out.println(messaggio);
					message.setText(messaggio);
					message.setSentDate(new Date());
					Transport.send(message);

					System.out.println("Messaggio inviato.");
				} catch (MessagingException e) {
					System.out.println("ERRORE! " + e);
				}
			}
		}

	}
	
	
	@PostMapping("/inviaEmailUtenti")
	public static void sendEmailUtenti(@RequestBody String messaggio) throws MessagingException {
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties properties = System.getProperties();

		properties.setProperty("mail.smtp.host", "smtp.gmail.com");
		properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.smtp.port", "465");
		properties.setProperty("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.debug", "true");
		properties.put("mail.store.protocol", "pop3");
		properties.put("mail.transport.protocol", "smtp");
		String myAccount = "forspotify759@gmail.com";
		String pass = "Forspotify759?";

		List<Utente> list = DBManager.getInstance().utenteDaoJdbc().findAll();
		for (Utente i : list) {
			
				String recepient = i.getEmail();

				try {

					Session session = Session.getInstance(properties, new Authenticator() {
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(myAccount, pass);
						}
					});

					Message message = new MimeMessage(session);

					message.setFrom(new InternetAddress(myAccount));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recepient, false));
					message.setSubject("NewsLetter");
					System.out.println(messaggio);
					message.setText(messaggio);
					message.setSentDate(new Date());
					Transport.send(message);

					System.out.println("Messaggio inviato.");
				} catch (MessagingException e) {
					System.out.println("ERRORE! " + e);
				}
			
		}

	}

}
