package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.Utente;
import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.UtenteDao;

public class UtenteDaoJdbc implements UtenteDao {
	DBSource dbSource;

	public UtenteDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(Utente utente) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into utente values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, utente.getId());
			st.setString(2, utente.getEmail());
			st.setString(3, utente.getUsername());
			st.setString(4, utente.getPassword());
			st.setString(5, utente.getNome());
			st.setString(6, utente.getCognome());
			st.setString(7, utente.getAccesso());
			st.setString(8, utente.getImg());
			st.setBoolean(9, utente.isBannato());
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	
	
	@Override
	public void update(Utente utente) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update utente SET email = ?, username = ?,password = ?, nome = ?,  cognome = ?, accesso = ?, img = ? ,  bannato = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, utente.getEmail());
			statement.setString(2, utente.getUsername());
			statement.setString(3, utente.getPassword());
			statement.setString(4, utente.getNome());
			statement.setString(5, utente.getCognome());
			statement.setString(6, utente.getAccesso());
			statement.setString(7, utente.getImg());
			statement.setBoolean(8, utente.isBannato());
			statement.setLong(9, utente.getId());

			statement.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	@Override
	public void delete(Utente utente) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "delete from utente where id=?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, utente.getId());

			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}



	@Override
	public List<Utente> findAll() {
		List<Utente> list = new ArrayList<Utente>();
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from utente";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Utente utente = new Utente();
				utente.setId(rs.getLong("id"));
				utente.setEmail(rs.getString("email"));
				utente.setUsername(rs.getString("username"));
				utente.setPassword(rs.getString("password"));
				utente.setNome(rs.getString("nome"));
				utente.setCognome(rs.getString("cognome"));
				utente.setAccesso(rs.getString("accesso"));
				utente.setBannato(rs.getBoolean("bannato"));
				utente.setImg(rs.getString("img"));
				list.add(utente);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Utente findByKey(Long id) {
		Connection connection = null;
		Utente utente = new Utente();
		try {
			String query = "select * from utente where id = '" + id + "'";
			connection = dbSource.getConnection();
			PreparedStatement st;
			st = connection.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				utente.setId(rs.getLong("id"));
				utente.setEmail(rs.getString("email"));
				utente.setUsername(rs.getString("username"));
				utente.setPassword(rs.getString("password"));
				utente.setNome(rs.getString("nome"));
				utente.setCognome(rs.getString("cognome"));
				utente.setAccesso(rs.getString("accesso"));

				utente.setImg(rs.getString("img"));
				utente.setBannato(rs.getBoolean("bannato"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utente;
	}


}
