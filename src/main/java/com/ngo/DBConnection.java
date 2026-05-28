package com.ngo;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
            	    "jdbc:mysql://127.0.0.1:3306/ngo_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            	    "root",
            	    "Prem@1234"
            	);
            System.out.println("Database connected successfully");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error: "+e.getMessage());
        }

        return con;
    }
}
