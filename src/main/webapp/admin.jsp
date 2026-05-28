<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#08142c,#0f2f6b,#122c73);
    color:white;
}

/* ===== NAVBAR ===== */

.navbar{
    width:100%;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 60px;
}

.logo{
    font-size:28px;
    font-weight:bold;
    color:#39e6ff;
}

.logout-btn{
    background:#ff4d6d;
    color:white;
    padding:12px 24px;
    border-radius:12px;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}

.logout-btn:hover{
    background:#ff2d55;
    transform:scale(1.05);
}

/* ===== HEADING ===== */

.heading{
    text-align:center;
    font-size:42px;
    margin-top:40px;
    margin-bottom:60px;
}

/* ===== DASHBOARD ===== */

.dashboard{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:35px;
    flex-wrap:wrap;
    padding:20px;
}

/* ===== CARDS ===== */

.admin-card{
    width:230px;
    padding:30px 20px;
    border-radius:22px;
    text-align:center;

    background:linear-gradient(145deg,#1d4ed8,#2563eb);

    box-shadow:0 10px 30px rgba(0,0,0,0.4);

    transition:0.3s;
}

.admin-card:hover{
    transform:translateY(-10px);
}

.admin-card h2{
    font-size:24px;
    margin-bottom:30px;
}

/* ===== BUTTON ===== */

.admin-btn{
    display:inline-block;

    background:#39e6ff;
    color:#08142c;

    padding:10px 22px;

    border-radius:12px;

    text-decoration:none;
    font-size:14px;
    font-weight:bold;

    transition:0.3s;
}

.admin-btn:hover{
    background:white;
    transform:scale(1.05);
}

/* ===== STATS ===== */

.stats{
    display:flex;
    justify-content:center;
    gap:30px;
    flex-wrap:wrap;

    margin-top:70px;
    padding-bottom:50px;
}

.stat-box{
    width:180px;

    padding:30px;

    border-radius:18px;

    background:rgba(255,255,255,0.08);

    text-align:center;

    backdrop-filter:blur(10px);

    box-shadow:0 8px 20px rgba(0,0,0,0.25);
}

.stat-box h1{
    font-size:36px;
    color:#39ff14;

    margin-bottom:10px;
}

.stat-box p{
    font-size:15px;
    color:white;
}

/* ===== RESPONSIVE ===== */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:20px;
    }

    .heading{
        font-size:42px;
    }

    .dashboard{
        flex-direction:column;
    }
}

</style>

</head>

<body>

<!-- ===== NAVBAR ===== -->

<div class="navbar">

    <div class="logo">
        NGO Connect Admin
    </div>

    <a href="LogoutServlet" class="logout-btn">
        Logout
    </a>

</div>

<!-- ===== HEADING ===== -->

<h1 class="heading">
    Admin Dashboard
</h1>

<!-- ===== DASHBOARD ===== -->

<div class="dashboard">

    <!-- ADD NGO -->

    <div class="admin-card">

        <h2>Add NGO</h2>

        <a href="addngo.jsp" class="admin-btn">
            Add
        </a>

    </div>

    <!-- VIEW NGO -->

    <div class="admin-card">

        <h2>View NGOs</h2>

        <a href="viewngos.jsp" class="admin-btn">
            View
        </a>

    </div>

    <!-- REQUESTS -->

    <div class="admin-card">

        <h2>Volunteer Requests</h2>

        <a href="viewrequests.jsp" class="admin-btn">
            Open
        </a>

    </div>
    
    <!-- NGO REQUESTS -->

<div class="admin-card">

    <h2>NGO Requests</h2>

    <a href="viewngorequests.jsp" class="admin-btn">

        Verify

    </a>

</div>

</div>




<!-- ===== STATS ===== -->
<%@ page import="java.sql.*" %>
<%@ page import="com.ngo.DBConnection" %>

<%
Connection con = DBConnection.getConnection();

int ngoCount = 0;
int volunteerCount = 0;
int pendingCount = 0;

Statement st = con.createStatement();

/* TOTAL NGOs */
ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM ngos");
if(rs1.next()){
    ngoCount = rs1.getInt(1);
}

/* VOLUNTEER REQUESTS */
ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM volunteer_requests");
if(rs2.next()){
    volunteerCount = rs2.getInt(1);
}

/* PENDING NGO REQUESTS */
ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM ngos WHERE status='Pending'");
if(rs3.next()){
    pendingCount = rs3.getInt(1);
}
%>

<!-- ===== STATS ===== -->

<div class="stats">

    <div class="stat-box">
        <h1><%= ngoCount %>+</h1>
        <p>Total NGOs</p>
    </div>

    <div class="stat-box">
        <h1><%= volunteerCount %>+</h1>
        <p>Volunteer Requests</p>
    </div>

    <div class="stat-box">
        <h1><%= pendingCount %>+</h1>
        <p>Pending NGO Applications</p>
    </div>

</div>

</body>
</html>