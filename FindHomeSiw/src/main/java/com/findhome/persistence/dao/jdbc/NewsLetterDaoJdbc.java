package com.findhome.persistence.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.findhome.persistence.DBSource;
import com.findhome.persistence.dao.NewsLetterDao;

public class NewsLetterDaoJdbc implements NewsLetterDao {
	DBSource dbSource;

	public NewsLetterDaoJdbc(DBSource dbSource) {
		this.dbSource = dbSource;
	}
	@Override
	public void save(String email) {
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "insert into newsletter values(?)";
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1,email);
			
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}


	}
	
	public List<String> findAll() {
		List<String> list = new ArrayList<String>();
		Connection connection = null;

		try {
			connection = dbSource.getConnection();
			String sql = "select * from newsletter";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				String e = rs.getString("email");
				
				
				

				list.add(e);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
