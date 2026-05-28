<%@ page import="java.sql.*" %>
<%@ page import="com.ngo.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NGO Requests</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#0f172a;
    color:white;
}

.container{
    width:90%;
    margin:auto;
    padding:40px;
}

h1{
    text-align:center;
    margin-bottom:40px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#1e293b;
}

th, td{
    padding:15px;
    border:1px solid #334155;
    text-align:center;
}

th{
    background:#22d3ee;
    color:black;
}

.approve-btn{
    background:#22c55e;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    text-decoration:none;
}

.reject-btn{
    background:#ef4444;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h1>NGO Registration Requests</h1>

<table>

<tr>

<th>ID</th>
<th>NGO Name</th>
<th>Email</th>
<th>Category</th>
<th>Location</th>
<th>Status</th>
<th>Action</th>

</tr>

<%

try{

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM ngos";

PreparedStatement pst =
con.prepareStatement(query);

ResultSet rs =
pst.executeQuery();

while(rs.next()){

%>

<tr>

<td>
<%= rs.getInt("id") %>
</td>

<td>
<%= rs.getString("ngo_name") %>
</td>

<td>
<%= rs.getString("email") %>
</td>

<td>
<%= rs.getString("category") %>
</td>

<td>
<%= rs.getString("location") %>
</td>

<td>
<%= rs.getString("status") %>
</td>

<td>

<a href="ApproveNGOServlet?id=<%= rs.getInt("id") %>"
class="approve-btn">

Approve

</a>

<a href="RejectNGOServlet?id=<%= rs.getInt("id") %>"
class="reject-btn">

Reject

</a>

</td>

</tr>

<%
}

}catch(Exception e){

e.printStackTrace();
}

%>

</table>

</div>

</body>
</html>