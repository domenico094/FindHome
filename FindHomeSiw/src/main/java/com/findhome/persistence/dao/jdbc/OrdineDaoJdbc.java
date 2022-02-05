package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.Ordine;
import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.OrdineDao;

public class OrdineDaoJdbc implements OrdineDao {
	DBSource dbSource;
	
	public OrdineDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}
	
	@Override
	public void save(Ordine ordine) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into ordine values(?,?,?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, ordine.getId());
			st.setLong(2, ordine.getIdUtente());
			st.setLong(3, ordine.getIdAnnuncio());
			
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void delete(Ordine ordine) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "delete from ordine where id=? ";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, ordine.getId());
			
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Ordine> findOrdiniByIdUtete(Long idUtente) {
		List<Ordine> list = new ArrayList<Ordine>();

		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from ordine where idUtente = '" + idUtente + "' ";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Ordine ordine = new Ordine();
				ordine.setId(rs.getLong("id"));
				ordine.setIdUtente(rs.getLong("idutente"));
				ordine.setIdAnnuncio(rs.getLong("idannuncio"));
			


				list.add(ordine);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	

}
