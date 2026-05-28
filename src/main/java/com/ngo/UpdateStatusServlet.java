package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String status = request.getParameter("status");

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "UPDATE volunteer_requests SET status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, status);

            ps.setInt(2, id);

            ps.executeUpdate();

            response.sendRedirect("viewrequests.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}