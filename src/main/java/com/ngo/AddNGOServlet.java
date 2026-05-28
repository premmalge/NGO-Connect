package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddNGOServlet")
public class AddNGOServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String ngo_name = request.getParameter("ngo_name");
        String category = request.getParameter("category");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "INSERT INTO ngos(ngo_name, category, location, description) VALUES(?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(query);

            ps.setString(1, ngo_name);
            ps.setString(2, category);
            ps.setString(3, location);
            ps.setString(4, description);

            int row = ps.executeUpdate();

            if(row > 0){

                response.sendRedirect("ngo.jsp");

            }else{

                response.getWriter().println("NGO Add Failed");

            }

        } catch(Exception e){

            e.printStackTrace();

        }

    }
}