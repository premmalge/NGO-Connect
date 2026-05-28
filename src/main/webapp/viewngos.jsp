<%@ page import="java.sql.*" %>
<%@ page import="com.ngo.DBConnection" %>

<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("adminlogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View NGOs</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#07172a;
    color:white;
}

.container{
    width:90%;
    margin:auto;
    padding-top:40px;
}

h1{
    text-align:center;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#10293f;
}

th{
    background:#7CFC00;
    color:black;
    padding:15px;
}

td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid rgba(255,255,255,0.1);
}

.delete-btn{
    background:red;
    color:white;
    padding:8px 15px;
    border-radius:6px;
    text-decoration:none;
}

.delete-btn:hover{
    background:darkred;
}

.back-btn{
    display:inline-block;
    margin-bottom:20px;
    background:#00d9ff;
    color:black;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<a href="admin.jsp" class="back-btn">Back</a>

<h1>All NGOs</h1>

<table>

<tr>
<th>ID</th>
<th>NGO Name</th>
<th>Category</th>
<th>Location</th>
<th>Action</th>
</tr>

<%

try{

Connection con = DBConnection.getConnection();

String query = "SELECT * FROM ngos";

PreparedStatement ps = con.prepareStatement(query);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("ngo_name") %></td>

<td><%= rs.getString("category") %></td>

<td><%= rs.getString("location") %></td>

<td>

<a class="delete-btn"
href="DeleteNGOServlet?id=<%= rs.getInt("id") %>">

Delete

</a>

</td>

</tr>

<%
}

}catch(Exception e){
    out.println(e);
}

%>

</table>

</div>

</body>
</html>