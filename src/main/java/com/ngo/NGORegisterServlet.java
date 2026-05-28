package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NGORegisterServlet")
public class NGORegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String ngo_name = request.getParameter("ngo_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String category = request.getParameter("category");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "INSERT INTO ngos " +
            "(ngo_name,email,password,category,location,description,status) " +
            "VALUES(?,?,?,?,?,?,?)";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setString(1, ngo_name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, category);
            pst.setString(5, location);
            pst.setString(6, description);
            pst.setString(7, "Pending");

            pst.executeUpdate();

            response.getWriter().println(

            		"<script>" +

            		"alert('NGO Request Sent Successfully To Admin');" +

            		"window.location='index.jsp';" +

            		"</script>"

            		);

        } catch(Exception e) {

            e.printStackTrace();

        }

    }

}