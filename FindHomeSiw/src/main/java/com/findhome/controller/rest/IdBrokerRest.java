package com.findhome.controller.rest;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.findhome.persistence.DBManager;
import com.findhome.persistence.dao.jdbc.IdBroker;



@RestController
public class IdBrokerRest {
	
	@GetMapping("/dammiId")
	public Long getId() throws SQLException {
		Connection connection = null;
		try {
			DBManager.getInstance();
			connection = DBManager.getDataSource().getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return IdBroker.getId(connection);
		
	}

}
