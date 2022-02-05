package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.model.Annuncio;
import com.findhome.persistence.dao.AnnuncioDAO;
import com.findhome.persistence.DBSource;

public class AnnuncioDaoJdbc implements AnnuncioDAO {

	DBSource dbSource;

	public AnnuncioDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(Annuncio annuncio) {
		Connection connection =null;
		try {
			connection = this.dbSource.getConnection();
			String query = "insert into annuncio values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
			PreparedStatement st = connection.prepareStatement(query);
			st.setLong(1, annuncio.getId());
			st.setLong(2, annuncio.getIdVenditore());
			st.setString(3, annuncio.getDescrizione());
			st.setBoolean(4, annuncio.isVendita());
			st.setDouble(5, annuncio.getPrezzo());
			
			st.setInt(6, annuncio.getMetriQuadri());
			st.setString(7, annuncio.getTipologia());

			st.setString(8, annuncio.getLuogo());
			st.setString(9, annuncio.getPosizione());
			st.setString(10, annuncio.getImg0());
			st.setString(11, annuncio.getImg1());
			st.setString(12, annuncio.getImg2());
			st.setString(13, annuncio.getImg3());
			st.setString(14, annuncio.getImg4());
			st.setString(15, annuncio.getImg5());
			st.setFloat(16, annuncio.getLatitudine());
			st.setFloat(17, annuncio.getLongitudine());
			st.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Annuncio annuncio) {
		Connection connection = null;

		try {
			connection = this.dbSource.getConnection();
			String query = "delete from annuncio where id = ? ";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, annuncio.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Annuncio> findALL() {
		List<Annuncio> list = new ArrayList<Annuncio>();

		try {
			Connection conn = this.dbSource.getConnection();
			String query = "select * from annuncio";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Long id = rs.getLong("id");
				Long idVenditore = rs.getLong("idvenditore");
				String descrizione = rs.getString("descrizione");

				boolean vendita = rs.getBoolean("vendita");
				double prezzo = rs.getDouble("prezzo");
				int mq = rs.getInt("metri_quadri");
				String tipologia = rs.getString("tipologia");
				String luogo = rs.getString("luogo");
				String posizione = rs.getString("posizione");
			
				String img0 = rs.getString("img0");
				String img1 = rs.getString("img1");
				String img2 = rs.getString("img2");
				String img3 = rs.getString("img3");
				String img4 = rs.getString("img4");
				String img5 = rs.getString("img5");
				float lat = rs.getFloat("latitudine");
				float lon = rs.getFloat("longitudine");

				

				Annuncio annuncio = new Annuncio(id, idVenditore, descrizione, vendita, prezzo, mq,
						tipologia, luogo, posizione,  img0, img1, img2, img3, img4, img5,lat,lon);
				list.add(annuncio);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Annuncio> findByIdVenditore(Long id) {
		List<Annuncio> list = new ArrayList<Annuncio>();

		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			PreparedStatement st;
			String query = "select * from annuncio where idvenditore = '"+id+"'";
			st = connection.prepareStatement(query);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Long id1 = rs.getLong("id");
				Long idVenditore = rs.getLong("idvenditore");
				String descrizione = rs.getString("descrizione");

				boolean vendita = rs.getBoolean("vendita");
				double prezzo = rs.getDouble("prezzo");
				int mq = rs.getInt("metri_quadri");
				String tipologia = rs.getString("tipologia");
				String luogo = rs.getString("luogo");
				String posizione = rs.getString("posizione");
			
				String img0 = rs.getString("img0");
				String img1 = rs.getString("img1");
				String img2 = rs.getString("img2");
				String img3 = rs.getString("img3");
				String img4 = rs.getString("img4");
				String img5 = rs.getString("img5");
				
				float lat = rs.getFloat("latitudine");
				float lon = rs.getFloat("longitudine");

				
				Annuncio annuncio = new Annuncio(id1, idVenditore, descrizione, vendita, prezzo, mq,
						tipologia, luogo, posizione,  img0, img1, img2, img3, img4, img5,lat,lon);
				list.add(annuncio);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());

		}
		return list;
	}

	@Override
	public Annuncio findByKey(Long id) {
		Annuncio annuncio = new Annuncio();
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			
			String query = "select * from annuncio where id = '" + id + "'";
			PreparedStatement st;
			st = connection.prepareStatement(query);
			
		
			ResultSet rs = st.executeQuery();
			
			while (rs.next()) {
				Long idA = rs.getLong("id");
				Long idVenditore = rs.getLong("idvenditore");
				String descrizione = rs.getString("descrizione");

				boolean vendita = rs.getBoolean("vendita");
				double prezzo = rs.getDouble("prezzo");
				int mq = rs.getInt("metri_quadri");
				String tipologia = rs.getString("tipologia");
				String luogo = rs.getString("luogo");
				String posizione = rs.getString("posizione");
				String img0 = rs.getString("img0");
				String img1 = rs.getString("img1");
				String img2 = rs.getString("img2");
				String img3 = rs.getString("img3");
				String img4 = rs.getString("img4");
				String img5 = rs.getString("img5");
				float lat = rs.getFloat("latitudine");
				float lon = rs.getFloat("longitudine");

				annuncio = new Annuncio(idA, idVenditore, descrizione, vendita, prezzo, mq, tipologia,
						luogo, posizione,  img0, img1, img2, img3, img4, img5,lat,lon);

			}
		} catch (SQLException e) {

		}
		return annuncio;
	}

	@Override
	public void update(Annuncio annuncio) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update annuncio SET idvenditore = ?, descrizione = ?, vendita = ?,prezzo = ?, metri_quadri = ?, tipologia = ?, luogo = ? ,  posizione = ?,  img0 = ?,  img1 = ?,  img2 = ?,  img3 = ?,  img4 = ?,  img5 = ? ,  latitudine = ?,  longitudine = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setLong(1, annuncio.getIdVenditore());
			statement.setString(2, annuncio.getDescrizione());
			statement.setBoolean(3, annuncio.isVendita());
			statement.setDouble(4, annuncio.getPrezzo());
			statement.setInt(5, annuncio.getMetriQuadri());
			statement.setString(6, annuncio.getTipologia());
			statement.setString(7, annuncio.getLuogo());
			statement.setString(8, annuncio.getPosizione());
			statement.setString(9, annuncio.getImg0());
			statement.setString(10, annuncio.getImg1());

			statement.setString(11, annuncio.getImg2());

			statement.setString(12, annuncio.getImg3());

			statement.setString(13, annuncio.getImg4());
			statement.setString(14, annuncio.getImg5());
			statement.setFloat(15, annuncio.getLatitudine());
			statement.setFloat(16, annuncio.getLongitudine());
			statement.setLong(17, annuncio.getId());
			

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
	public List<Annuncio> findAnnunciByKey(Long id) {
		List<Annuncio> list = new ArrayList<Annuncio>();
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			PreparedStatement st;
			String query = "select * from annuncio where id = '"+id+"' ";
			st = connection.prepareStatement(query);
			st.setLong(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Long idA = rs.getLong("id");
				Long idVenditore = rs.getLong("idvenditore");
				String descrizione = rs.getString("descrizione");

				boolean vendita = rs.getBoolean("vendita");
				double prezzo = rs.getDouble("prezzo");
				int mq = rs.getInt("metri_quadri");
				String tipologia = rs.getString("tipologia");
				String luogo = rs.getString("luogo");
				String posizione = rs.getString("posizione");
				String img0 = rs.getString("img0");
				String img1 = rs.getString("img1");
				String img2 = rs.getString("img2");
				String img3 = rs.getString("img3");
				String img4 = rs.getString("img4");
				String img5 = rs.getString("img5");
				float lat = rs.getFloat("latitudine");
				float lon = rs.getFloat("longitudine");

				Annuncio annuncio = new Annuncio(idA, idVenditore, descrizione, vendita, prezzo,  mq, tipologia,
						luogo, posizione,  img0, img1, img2, img3, img4, img5,lat,lon);
				list.add(annuncio);
			}
		} catch (SQLException e) {

		}
		return list;
	}
	
	

}
