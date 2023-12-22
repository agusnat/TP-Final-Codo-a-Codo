package cac.conexion.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
	private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/conferencias";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "";

	static {
		try {
			Class.forName(DB_DRIVER);
			System.out.println("Driver loaded");
		} catch (ClassNotFoundException e) {
			System.err.println("Driver failed");
			e.printStackTrace();
		}
	}

	public Connection connect() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("Connection established.");
		} catch (SQLException e) {
			System.out.println("The SQL connection could not be established.");
			e.printStackTrace();
		}

		return conn;
	}

}