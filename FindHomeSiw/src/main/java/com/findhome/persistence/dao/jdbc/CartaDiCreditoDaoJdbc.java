package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.CartaDiCredito;
import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.CartaDiCreditoDao;

public class CartaDiCreditoDaoJdbc implements CartaDiCreditoDao {

	DBSource dbSource;
	public CartaDiCreditoDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}
	
	@Override
	public void save(CartaDiCredito cartaDiCredito) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into cartadicredito values(?,?,?,?,?,?,?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, cartaDiCredito.getId());
			st.setLong(2, cartaDiCredito.getIdUtente());
			st.setString(3, cartaDiCredito.getNumeroSeriale());
			st.setString(4, cartaDiCredito.getMeseScadenza());
			st.setString(5, cartaDiCredito.getAnnoScadenza());
			st.setString(6, cartaDiCredito.getCvv());
			st.setDouble(7, cartaDiCredito.getCredito());
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}


	}

	@Override
	public void delete(CartaDiCredito cartaDiCredito) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "delete from cartadicredito where id=?";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setLong(1, cartaDiCredito.getId());
			
			st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<CartaDiCredito> findCartaById(Long idUtente) {
		List<CartaDiCredito> list = new ArrayList<CartaDiCredito>();
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from cartadicredito where idUtente = '" + idUtente + "' ";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CartaDiCredito carta = new CartaDiCredito();
				carta.setId(rs.getLong("id"));
				carta.setIdUtente(rs.getLong("idutente"));
				carta.setNumeroSeriale(rs.getString("numero"));
				carta.setMeseScadenza(rs.getString("mese"));
				carta.setAnnoScadenza(rs.getString("anno"));
				carta.setCvv(rs.getString("cvv"));
				carta.setCredito(rs.getDouble("credito"));


				list.add(carta);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void uptate(CartaDiCredito carta) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update cartadicredito SET idutente = ?, numero = ?, mese = ?,  anno = ?, cvv = ?, credito = ?   WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setLong(1, carta.getIdUtente());
			statement.setString(2, carta.getNumeroSeriale());
			statement.setString(3, carta.getMeseScadenza());
			
			statement.setString(4, carta.getAnnoScadenza());
			statement.setString(5, carta.getCvv());
			statement.setDouble(6, carta.getCredito());		
			statement.setLong(7, carta.getId());

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

}
