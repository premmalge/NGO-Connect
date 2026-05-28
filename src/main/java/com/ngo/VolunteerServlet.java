package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VolunteerServlet")
public class VolunteerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

            Integer user_id =
                    (Integer) session.getAttribute("user_id");

            if(user_id == null){

                response.sendRedirect("login.jsp");

                return;
            }

            int ngo_id =
                    Integer.parseInt(
                    request.getParameter("ngo_id"));

            Connection con =
                    DBConnection.getConnection();

            String query =
            "INSERT INTO volunteer_requests(user_id, ngo_id) VALUES(?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, user_id);

            ps.setInt(2, ngo_id);

            int row = ps.executeUpdate();

            if(row > 0){

                response.sendRedirect(
                "ngo.jsp?success=1&applied=true&ngo=" + ngo_id);

            }else{

                response.sendRedirect("ngo.jsp?error=1");
            }

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}