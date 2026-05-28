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
<title>Volunteer Requests</title>

<style>

body{
    margin:0;
    padding:0;
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
    margin-bottom:40px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#10293f;
    border-radius:10px;
    overflow:hidden;
}

th{
    background:#7CFC00;
    color:black;
    padding:15px;
    font-size:18px;
}

td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid rgba(255,255,255,0.1);
}

tr:hover{
    background:#173b5a;
}

.back-btn{
    display:inline-block;
    margin-bottom:20px;
    text-decoration:none;
    background:#00d9ff;
    color:black;
    padding:10px 20px;
    border-radius:8px;
    font-weight:bold;
}

.back-btn:hover{
    background:#00b8d4;
}

.approve-btn{
    background:green;
    color:white;
    padding:8px 12px;
    text-decoration:none;
    border-radius:5px;
    margin-right:5px;
}

.reject-btn{
    background:red;
    color:white;
    padding:8px 12px;
    text-decoration:none;
    border-radius:5px;
}

.approve-btn:hover{
    background:darkgreen;
}

.reject-btn:hover{
    background:darkred;
}

</style>

</head>

<body>

<div class="container">

<a href="admin.jsp" class="back-btn">Back</a>

<h1>Volunteer Requests</h1>

<table>

<tr>
    <th>Request ID</th>
    <th>User Name</th>
    <th>NGO Name</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%

try{

Connection con = DBConnection.getConnection();

String query =
"SELECT vr.id, u.name AS user_name, n.ngo_name, vr.status " +
"FROM volunteer_requests vr " +
"JOIN users u ON vr.user_id = u.id " +
"JOIN ngos n ON vr.ngo_id = n.id";

PreparedStatement ps = con.prepareStatement(query);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><%= rs.getString("user_name") %></td>

<td><%= rs.getString("ngo_name") %></td>

<td><%= rs.getString("status") %></td>

<td>

<a class="approve-btn"
href="UpdateStatusServlet?id=<%= rs.getInt("id") %>&status=Approved">

Approve

</a>

<a class="reject-btn"
href="UpdateStatusServlet?id=<%= rs.getInt("id") %>&status=Rejected">

Reject

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