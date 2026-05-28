<%@ page import="java.sql.*" %>
<%@ page import="com.ngo.DBConnection" %>

<%

if(session.getAttribute("user_id") == null){

    response.sendRedirect("login.jsp");
    return;
}

String username =
(String) session.getAttribute("user_name");

int userId =
(Integer) session.getAttribute("user_id");

/* PAGINATION */

int currentPage = 1;

int ngoPerPage = 4;

if(request.getParameter("page") != null){

currentPage =
Integer.parseInt(request.getParameter("page"));

}

int start =
(currentPage - 1) * ngoPerPage;

/* FILTERS */

String category =
request.getParameter("category");

String search =
request.getParameter("search");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NGO Connect</title>

<style>

body{
    margin:0;
    padding:0;
    background:#08142c;
    font-family:Arial;
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
    font-size:32px;
    font-weight:bold;
    color:#39e6ff;
}

.nav-right{
    display:flex;
    align-items:center;
    gap:20px;
}

.welcome{
    font-size:18px;
    font-weight:bold;
}

.logout-btn{
    background:red;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

.notification-btn{
    background:#123d63;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

/* HERO */

.hero{
    text-align:center;
    padding:60px 20px 30px;
}

.hero-title{
    font-size:65px;
    margin-bottom:20px;
    color:white;
}

.hero-text{
    font-size:22px;
    color:#d0d0d0;
    max-width:800px;
    margin:auto;
    line-height:1.6;
}

/* STATS */

.stats{
    display:flex;
    justify-content:center;
    gap:30px;
    margin:50px 0;
    flex-wrap:wrap;
}

.stat-box{
    background:#10293f;
    padding:30px;
    width:220px;
    text-align:center;
    border-radius:20px;
    box-shadow:0 0 20px rgba(0,0,0,0.3);
}

.stat-box h2{
    font-size:40px;
    color:#00ff88;
    margin-bottom:10px;
}

/* SEARCH */

.search-box{
    text-align:center;
    margin-bottom:30px;
}

.search-box input{
    width:420px;
    padding:15px;
    border:none;
    border-radius:12px;
    font-size:18px;
}

/* FILTER */

.filters{
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;
    margin-bottom:40px;
}

.filter-btn{
    background:#123d63;
    color:white;
    padding:12px 25px;
    border-radius:12px;
    text-decoration:none;
    font-weight:bold;
}

.filter-btn:hover{
    background:#39e6ff;
    color:black;
}

/* NGO SECTION */

.main{
    padding:40px;
}

.heading{
    text-align:center;
    font-size:55px;
    margin-bottom:40px;
}

.card-container{
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    gap:30px;
}

.card{
    width:250px;
    background:#1c2c4d;
    padding:20px;
    border-radius:20px;
    box-shadow:0px 0px 15px rgba(0,0,0,0.5);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-10px);
}

.card h2{
    color:#39e6ff;
}

.category{
    display:inline-block;
    background:#7CFC00;
    color:black;
    padding:6px 15px;
    border-radius:20px;
    font-size:13px;
    margin-bottom:15px;
    font-weight:bold;
}

.location{
    margin-bottom:15px;
    font-weight:bold;
}

.description{
    line-height:25px;
    margin-bottom:20px;
}

/* BUTTONS */

.volunteer-btn{
    background:#42f5ff;
    border:none;
    padding:12px 18px;
    border-radius:10px;
    color:black;
    font-weight:bold;
    cursor:pointer;
    width:100%;
}

.pending-btn{
    background:orange;
    border:none;
    padding:12px 18px;
    border-radius:10px;
    color:white;
    font-weight:bold;
    width:100%;
}

.approved-btn{
    background:#00ff88;
    border:none;
    padding:12px 18px;
    border-radius:10px;
    color:black;
    font-weight:bold;
    width:100%;
}

.reject-btn{
    background:red;
    border:none;
    padding:12px 18px;
    border-radius:10px;
    color:white;
    font-weight:bold;
    width:100%;
}

/* PAGINATION */

.pagination{
    margin-top:50px;
    text-align:center;
}

.pagination a{
    display:inline-block;
    width:45px;
    height:45px;
    line-height:45px;
    text-align:center;
    background:#123d63;
    color:white;
    border-radius:50%;
    text-decoration:none;
    margin:5px;
    font-weight:bold;
    transition:0.3s;
}

.pagination a:hover{
    background:#39e6ff;
    color:black;
    transform:scale(1.1);
}

/* FOOTER */

footer{
    margin-top:60px;
    padding:25px;
    text-align:center;
    background:#04101d;
    color:#aaa;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

<div class="logo">
NGO Connect
</div>

<div class="nav-right">

<div class="welcome">
Welcome, <%= username %>
</div>

<a href="notification.jsp"
class="notification-btn">

Notifications

</a>

<a href="LogoutServlet"
class="logout-btn">

Logout

</a>

</div>

</div>

<!-- HERO -->

<div class="hero">

<h1 class="hero-title">
Make A Difference Today
</h1>

<p class="hero-text">
Join NGOs, support communities, and create positive social impact through volunteering.
</p>

</div>

<!-- STATS -->

<%

int ngoCount = 0;
int volunteerCount = 0;
int cityCount = 0;

try{

Connection statCon = DBConnection.getConnection();

/* NGO COUNT */

PreparedStatement ngoPs =
statCon.prepareStatement(
"SELECT COUNT(*) FROM ngos WHERE status='Approved' ");

ResultSet ngoRs =
ngoPs.executeQuery();

if(ngoRs.next()){
    ngoCount = ngoRs.getInt(1);
}

/* VOLUNTEER COUNT */

PreparedStatement volPs =
statCon.prepareStatement(
"SELECT COUNT(*) FROM volunteer_requests");

ResultSet volRs =
volPs.executeQuery();

if(volRs.next()){
    volunteerCount = volRs.getInt(1);
}

/* CITY COUNT */

PreparedStatement cityPs =
statCon.prepareStatement(
"SELECT COUNT(DISTINCT location) FROM ngos");

ResultSet cityRs =
cityPs.executeQuery();

if(cityRs.next()){
    cityCount = cityRs.getInt(1);
}

}catch(Exception e){
e.printStackTrace();
}

%>

<div class="stats">

    <div class="stat-box">
        <h2><%= ngoCount %></h2>
        <p>NGOs</p>
    </div>

    <div class="stat-box">
        <h2><%= volunteerCount %></h2>
        <p>Volunteers</p>
    </div>

    <div class="stat-box">
        <h2><%= cityCount %></h2>
        <p>Cities</p>
    </div>

</div>

<!-- SEARCH -->

<div class="search-box">

<form method="get" action="ngo.jsp">

<input type="text"
name="search"
placeholder="Search NGO..."
value="<%= search != null ? search : "" %>">

</form>

</div>

<!-- FILTERS -->

<div class="filters">

<a href="ngo.jsp"
class="filter-btn">
All
</a>

<a href="ngo.jsp?category=Education"
class="filter-btn">
Education
</a>

<a href="ngo.jsp?category=Healthcare"
class="filter-btn">
Healthcare
</a>

<a href="ngo.jsp?category=Environment"
class="filter-btn">
Environment
</a>

<a href="ngo.jsp?category=Food Donation"
class="filter-btn">
Food Donation
</a>

</div>

<!-- NGO SECTION -->

<div class="main">

<h1 class="heading">
Explore NGOs
</h1>

<div class="card-container">

<%

try{

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM ngos WHERE status='Approved' ";

if(category != null){

query +=
"AND category=? ";
}

if(search != null &&
!search.trim().equals("")){

query +=
"AND ngo_name LIKE ? ";
}

query +=
"LIMIT ?, ?";

PreparedStatement ps =
con.prepareStatement(query);

int i = 1;

if(category != null){

ps.setString(i++, category);
}

if(search != null &&
!search.trim().equals("")){

ps.setString(i++,
"%" + search + "%");
}

ps.setInt(i++, start);

ps.setInt(i++, ngoPerPage);

ResultSet rs =
ps.executeQuery();

while(rs.next()){
	

%>

<div class="card">

<h2>
<%= rs.getString("ngo_name") %>
</h2>

<div class="category">
<%= rs.getString("category") %>
</div>

<div class="location">
&#128205 <%= rs.getString("location") %>
</div>

<div class="description">
<%= rs.getString("description") %>
</div>

<%

Connection con2 =
DBConnection.getConnection();

String q2 =
"SELECT * FROM volunteer_requests WHERE user_id=? AND ngo_id=?";

PreparedStatement ps2 =
con2.prepareStatement(q2);

ps2.setInt(1, userId);

ps2.setInt(2, rs.getInt("id"));

ResultSet rs2 =
ps2.executeQuery();

if(rs2.next()){

String status =
rs2.getString("status");

if(status.equals("Pending")){
%>

<button class="pending-btn">
Pending
</button>

<%
}
else if(status.equals("Approved")){
%>

<button class="approved-btn">
Approved
</button>

<%
}
else{
%>

<button class="reject-btn">
Rejected
</button>

<%
}

}else{
%>

<form action="VolunteerServlet"
method="post">

<input type="hidden"
name="ngo_id"
value="<%= rs.getInt("id") %>">

<button type="submit"
class="volunteer-btn">

Volunteer Now

</button>

</form>

<%
}
%>

</div>

<%
}

/* TOTAL NGO COUNT */

String countQuery =
"SELECT COUNT(*) FROM ngos WHERE status='Approved'";

PreparedStatement countPs =
con.prepareStatement(countQuery);

ResultSet countRs =
countPs.executeQuery();

int totalNGOs = 0;

if(countRs.next()){

totalNGOs =
countRs.getInt(1);

}

int totalPages =
(int)Math.ceil((double)totalNGOs / ngoPerPage);

%>

</div>

<!-- PAGINATION -->

<div class="pagination">

<%

for(int p = 1; p <= totalPages; p++){

%>

<a href="ngo.jsp?page=<%= p %>">
<%= p %>
</a>

<%
}
%>

</div>

<%

}catch(Exception e){
e.printStackTrace();
}
%>

</div>

<!-- FOOTER -->

<footer>

<p>
&copy 2026 NGO Connect | Empowering Communities Through Volunteering
</p>

</footer>

</body>
</html>