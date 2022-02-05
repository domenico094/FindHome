package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.Recensione;
import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.RecensioneDao;

public class RecensioneDaoJdbc implements RecensioneDao{
	DBSource dbSource;

	public RecensioneDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(Recensione recensione) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into recensione values(?,?,?,?,?,?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, recensione.getId());
			st.setLong(2, recensione.getIdAcquirente());
			st.setLong(3, recensione.getIdAnnuncio());
			st.setString(4, recensione.getTitolo());
			st.setString(5, recensione.getAutore());

			st.setString(6, recensione.getMessaggio());
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}

	@Override
	public List<Recensione> findAll() {
		List<Recensione> list = new ArrayList<Recensione>();
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from recensione";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Recensione recensione = new Recensione();
				recensione.setId(rs.getLong("id"));
				recensione.setIdAcquirente(rs.getLong("idacquirente"));
				recensione.setIdAnnuncio(rs.getLong("idannuncio"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setAutore(rs.getString("autore"));


				recensione.setMessaggio(rs.getString("messaggio"));

				list.add(recensione);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
	}

	@Override
	public void delete(Recensione recensione) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "delete from recensione where id=?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, recensione.getId());
			
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
