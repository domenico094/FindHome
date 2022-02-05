package com.findhome.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.findhome.persistence.DBManager;

@Controller
public class LoginController {

		
		@GetMapping("/faiLogout")
		public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("/");
		}
		
		@PostMapping("/loginServices")
		public String faiLogin(HttpServletRequest req, HttpServletResponse resp, String username, String pass) throws IOException {
			String sql = "select * from utente where username = '" + username + "' and password ='"+pass+"'" ;
			
			
			
			HttpSession session = req.getSession(true);
			
			try {
				DBManager.getInstance();
				Connection con = DBManager.getDataSource().getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				if (rs.next()) {
					if(rs.getBoolean("bannato") == true) {
						session.invalidate();
						return "ban";
					} else {
					session.setAttribute("username", rs.getString("username"));
					session.setAttribute("id", rs.getLong("id"));
					session.setAttribute("nome", rs.getString("nome"));
					session.setAttribute("cognome", rs.getString("cognome"));
					session.setAttribute("accesso", rs.getString("accesso"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("img", rs.getString("img"));
					session.setAttribute("bannato",rs.getBoolean("bannato"));
					resp.sendRedirect("/");
					}
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "index";
		}
}

