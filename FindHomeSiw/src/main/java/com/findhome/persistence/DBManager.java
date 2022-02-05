package com.findhome.persistence;

import com.findhome.persistence.dao.jdbc.AnnuncioDaoJdbc;
import com.findhome.persistence.dao.jdbc.OrdineDaoJdbc;
import com.findhome.persistence.dao.jdbc.CartaDiCreditoDaoJdbc;
import com.findhome.persistence.dao.jdbc.NewsLetterDaoJdbc;
import com.findhome.persistence.dao.jdbc.RecensioneDaoJdbc;
import com.findhome.persistence.dao.jdbc.UtenteDaoJdbc;
import com.findhome.persistence.dao.jdbc.VisitaDaoJdbc;

public class DBManager {
	
	private static DBManager instance = null; 
	static DBSource dataSource;
	
	
	private DBManager() {
	}
			
	static {
		try {
			Class.forName("org.postgresql.Driver");
			//questi vanno messi in file di configurazione!!!	
			dataSource=new DBSource("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
		} 
		catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}
	}
	
	public static DBManager getInstance() {
		if(instance == null) {
			instance = new DBManager();
		}
		return instance;
	}
	
	public static DBSource getDataSource() {
		return dataSource;
	}
	
	public UtenteDaoJdbc utenteDaoJdbc() {
		return new UtenteDaoJdbc(dataSource);
	}
	

	
	public AnnuncioDaoJdbc annuncioDaoJdbc() {
		return new AnnuncioDaoJdbc(dataSource);
	}
	public VisitaDaoJdbc visitaDaoJdbc() {
		return new VisitaDaoJdbc(dataSource);
	}
	public RecensioneDaoJdbc recensioneDaoJdbc() {
		return new RecensioneDaoJdbc(dataSource);
	}
	public OrdineDaoJdbc carrelloDaoJdbc() {
		return new OrdineDaoJdbc(dataSource);
	}
	
	public NewsLetterDaoJdbc newsLetterDaoJdbc() {
		return new NewsLetterDaoJdbc(dataSource);
	}
	
	public CartaDiCreditoDaoJdbc cartaDiCreditoDaoJdbc() {
		return new CartaDiCreditoDaoJdbc(dataSource);
	}
	public OrdineDaoJdbc ordineDaoJdbc() {
		return new OrdineDaoJdbc(dataSource);
	}
	

}
