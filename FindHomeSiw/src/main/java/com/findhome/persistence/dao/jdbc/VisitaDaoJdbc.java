package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.Visita;
import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.VisitaDao;

public class VisitaDaoJdbc implements VisitaDao {
	DBSource dbSource;

	public VisitaDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(Visita visita) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into visita values(?,?,?,?,?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, visita.getId());
			st.setLong(2, visita.getIdAcquirente());
			st.setLong(3, visita.getIdVenditore());
			st.setLong(4, visita.getIdAnnuncio());

			st.setBoolean(5, visita.isEffettuata());
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void delete(Visita visita) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "delete from visita where id=?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, visita.getId());
			
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void abilita(Visita visita) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "update visita set effettuata = true where id = ?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, visita.getId());
			
			
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Visita> findAll() {
		List<Visita> list = new ArrayList<Visita>();
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from visita";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Visita visita = new Visita();
				visita.setId(rs.getLong("id"));
				visita.setIdAcquirente(rs.getLong("idacquirente"));
				visita.setIdVenditore(rs.getLong("idvenditore"));
				visita.setIdAnnuncio(rs.getLong("idannuncio"));

				visita.setEffettuata(rs.getBoolean("effettuata"));

				list.add(visita);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
