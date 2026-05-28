package com.ngo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RejectNGOServlet")
public class RejectNGOServlet extends HttpServlet{

protected void doGet(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException, IOException{

String id =
request.getParameter("id");

try{

Connection con =
DBConnection.getConnection();

String query =
"UPDATE ngos SET status='Rejected' WHERE id=?";

PreparedStatement pst =
con.prepareStatement(query);

pst.setString(1,id);

pst.executeUpdate();

response.sendRedirect(
"viewngorequests.jsp"
);

}catch(Exception e){

e.printStackTrace();
}

}

}