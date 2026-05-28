<%@ page import="java.sql.*" %>
<%@ page import="com.ngo.DBConnection" %>

<%

if(session.getAttribute("user_id")==null){

response.sendRedirect("login.jsp");
return;

}

int userId =
(Integer)session.getAttribute("user_id");

String username =
(String)session.getAttribute("user_name");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifications</title>

<style>

body{
margin:0;
font-family:Arial;
background:#08142c;
color:white;
}

/* NAVBAR */

.navbar{
display:flex;
justify-content:space-between;
align-items:center;
padding:20px 40px;
background:#111827;
}

.logo{
font-size:30px;
font-weight:bold;
color:#39e6ff;
}

.back-btn{
background:#39e6ff;
padding:10px 18px;
border-radius:8px;
text-decoration:none;
font-weight:bold;
color:black;
}

/* MAIN */

.container{
width:80%;
margin:auto;
padding-top:40px;
}

h1{
text-align:center;
font-size:50px;
margin-bottom:40px;
}

/* NOTIFICATION CARDS */

.notification{
background:#1c2c4d;
padding:20px;
border-radius:15px;
margin-bottom:20px;
font-size:18px;
box-shadow:0 0 10px rgba(0,0,0,0.4);
line-height:30px;
}

.approved{
border-left:8px solid #00ff88;
}

.rejected{
border-left:8px solid red;
}

.pending{
border-left:8px solid orange;
}

.empty{
text-align:center;
font-size:22px;
color:#aaa;
margin-top:100px;
}

.time{
margin-top:10px;
font-size:14px;
color:#bbb;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

<div class="logo">
NGO Connect
</div>

<a href="ngo.jsp"
class="back-btn">

Back

</a>

</div>

<!-- MAIN -->

<div class="container">

<h1>
Your Notifications
</h1>

<%

try{

Connection con =
DBConnection.getConnection();

String query =

"SELECT vr.status, vr.id, n.ngo_name " +

"FROM volunteer_requests vr " +

"JOIN ngos n ON vr.ngo_id=n.id " +

"WHERE vr.user_id=? " +

"ORDER BY vr.id DESC";

PreparedStatement ps =
con.prepareStatement(query);

ps.setInt(1, userId);

ResultSet rs =
ps.executeQuery();

boolean found = false;

while(rs.next()){

found = true;

String status =
rs.getString("status");

String ngoName =
rs.getString("ngo_name");

%>

<div class="notification <%= status.toLowerCase() %>">

<%

if(status.equals("Approved")){
%>

&#9989 Your volunteer request for

<b><%= ngoName %></b>

has been approved by admin.

<%
}
else if(status.equals("Rejected")){
%>

&#10060 Your volunteer request for

<b><%= ngoName %></b>

was rejected by admin.

<%
}
else{
%>

&#9203 Your volunteer request for

<b><%= ngoName %></b>

is still pending approval.

<%
}
%>

<div class="time">

Request ID:
<%= rs.getInt("id") %>

</div>

</div>

<%
}

if(!found){
%>

<div class="empty">

No notifications available.

</div>

<%
}

}catch(Exception e){

e.printStackTrace();

}

%>

</div>

</body>
</html>