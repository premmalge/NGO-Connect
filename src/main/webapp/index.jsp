<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NGO Connect</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Segoe UI;
}

body {
	background: #0f172a;
	color: white;
}

/* NAVBAR */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 8%;
	background: #111827;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.logo {
	display: flex;
	align-items: center;
	gap: 12px;
	font-size: 28px;
	font-weight: bold;
	color: #22d3ee;
}

.logo img {
	width: 55px;
	height: 55px;
	object-fit: contain;
}

.nav-links a {
	text-decoration: none;
	color: white;
	margin-left: 25px;
	transition: 0.3s;
	font-size: 16px;
}

.nav-links a:hover {
	color: #22d3ee;
}
.dropdown{
    position:relative;
    display:inline-block;
    margin-left:25px;
}

.dropbtn{
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.dropbtn:hover{
    color:#22d3ee;
}

.dropdown-content{
    display:none;
    position:absolute;
    top:100%;
    left:-20px;
    background:#1b2a4a;
    min-width:170px;
    border-radius:10px;
    overflow:hidden;
    text-align:center;
    box-shadow:0 4 12px rgba(0,0,0,0.35);
    z-index:999;
   
}

.dropdown-content a{
display:block;
padding:12px 18px;
color:white;
text_decoration: none;

    font-size:16px;
    font-weight:600;
    white_space: nowrap;
    transition:0.03s;
}

.dropdown-content a:hover{
    background:#23395d;
    color:#39e6ff;
}

.dropdown:hover .dropdown-content{
    display:block;
}


/* HERO SECTION */
.hero {
	min-height: 55vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 60px 8%;
}

.hero-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 60px;
	flex-wrap: wrap;
}

.hero-text {
	flex: 1;
	min-width: 300px;
}

.hero-text h1 {
	font-size: 60px;
	line-height: 1.2;
	margin-bottom: 25px;
	color: #22d3ee;
}

.hero-text p {
	font-size: 20px;
	color: #cbd5e1;
	line-height: 1.8;
	margin-bottom: 35px;
}

.hero-buttons a {
	text-decoration: none;
	padding: 14px 28px;
	border-radius: 12px;
	margin-right: 15px;
	font-weight: bold;
	transition: 0.3s;
}

.btn1 {
	background: #22d3ee;
	color: white;
}

.btn1:hover {
	background: #06b6d4;
}

.btn2 {
	border: 2px solid #22d3ee;
	color: #22d3ee;
}

.btn2:hover {
	background: #22d3ee;
	color: white;
}

.hero-image {
	flex: 1;
	min-width: 300px;
	text-align: center;
}

.hero-image img {
	width: 100%;
	max-width: 500px;
}

/* NGO PARTNER SECTION */

.partner-section{
    padding:80px 8%;
}

.partner-container{
    background:#1e293b;
    border-radius:25px;
    padding:50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    gap:40px;
    flex-wrap:wrap;
    box-shadow:0 10px 30px rgba(0,0,0,0.35);
}

.partner-text{
    flex:1;
    min-width:300px;
}

.partner-text h2{
    font-size:42px;
    margin-bottom:20px;
    color:#22d3ee;
}

.partner-text p{
    color:#cbd5e1;
    font-size:18px;
    line-height:1.8;
    margin-bottom:30px;
}

.partner-btn{
    display:inline-block;
    padding:15px 30px;
    background:#22d3ee;
    color:white;
    text-decoration:none;
    border-radius:12px;
    font-weight:bold;
    transition:0.3s;
}

.partner-btn:hover{
    background:#06b6d4;
    transform:translateY(-3px);
}


/* FEATURES */
.features {
	padding: 80px 8%;
}

.section-title {
	text-align: center;
	font-size: 42px;
	margin-bottom: 50px;
	color: white;
}

.feature-container {
	display: flex;
	gap: 30px;
	justify-content: center;
	flex-wrap: wrap;
}

.feature-card {
	width: 320px;
	background: #1e293b;
	padding: 35px;
	border-radius: 22px;
	transition: 0.3s;
}

.feature-card:hover {
	transform: translateY(-8px);
}

.feature-card h3 {
	color: #22d3ee;
	margin-bottom: 20px;
	font-size: 24px;
}

.feature-card p {
	color: #cbd5e1;
	line-height: 1.8;
}

/* NGO SECTION */
.ngo-preview {
	padding: 80px 8%;
}

.ngo-container {
	display: flex;
	gap: 30px;
	justify-content: center;
	flex-wrap: wrap;
}

.ngo-card {
	width: 300px;
	background: #1e293b;
	padding: 30px;
	border-radius: 20px;
	transition: 0.3s;
}

.ngo-card:hover {
	transform: translateY(-8px);
}

.ngo-card h3 {
	color: #22d3ee;
	margin-bottom: 15px;
	font-size: 24px;
}

.ngo-card p {
	color: #d1d5db;
	line-height: 1.8;
}

/* FOOTER */
.footer {
	background: #111827;
	margin-top: 60px;
	padding: 50px 8% 20px;
}

.footer-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
	gap: 40px;
}

.footer-box h3 {
	margin-bottom: 20px;
	color: #22d3ee;
}

.footer-box p, .footer-box a {
	display: block;
	color: #cbd5e1;
	margin-bottom: 12px;
	text-decoration: none;
	line-height: 1.7;
}

.footer-box a:hover {
	color: #22d3ee;
}

.footer-bottom {
	text-align: center;
	margin-top: 40px;
	padding-top: 20px;
	border-top: 1px solid #334155;
	color: #94a3b8;
}

/* RESPONSIVE */
@media ( max-width :900px) {
	.hero-container {
		flex-direction: column;
		text-align: center;
	}
	.hero-text h1 {
		font-size: 42px;
	}
	.hero-text p {
		font-size: 17px;
	}
	.navbar {
		flex-direction: column;
		gap: 15px;
	}
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<div class="navbar">

		<div class="logo">

			<img src="images/logo-image.png"> <span>NGO Connect</span>

		</div>

		<div class="nav-links">

			<a href="index.jsp">Home</a>

<a href="ngo.jsp">NGOs</a>

<div class="dropdown">

<span class="dropbtn">
Login
</span>

<div class="dropdown-content">

<a href="login.jsp">
User Login
</a>

<a href="adminlogin.jsp">
Admin Login
</a>

</div>

</div>

<a href="register.jsp">Register</a>
		</div>

	</div>

	<!-- HERO SECTION -->

	<div class="hero">

		<div class="hero-container">

			<div class="hero-text">

				<h1>Connecting People With NGOs</h1>

				<p>Discover NGOs, volunteer for meaningful causes, and create
					positive impact in communities through NGO Connect.</p>

				<div class="hero-buttons">

					<a href="ngo.jsp" class="btn1"> Explore NGOs </a> <a
						href="register.jsp" class="btn2"> Get Started </a>

				</div>

			</div>

			<div class="hero-image">

				<img src="images/logo-image.png">

			</div>

		</div>

	</div>
	
	<!-- NGO PARTNER SECTION -->

<div class="partner-section">

    <div class="partner-container">

        <div class="partner-text">

            <h2>Are You An NGO?</h2>

            <p>
                Join NGO Connect and reach passionate volunteers,
                manage requests, and grow your social impact.
            </p>

            <a href="ngoregister.jsp" class="partner-btn">
                Become A Partner NGO
            </a>

        </div>

       

    </div>

</div>

	<!-- FEATURES -->

	<div class="features">

		<div class="section-title">What We Offer</div>

		<div class="feature-container">

			<div class="feature-card">

				<h3>Volunteer</h3>

				<p>Apply for volunteering opportunities and support NGOs working
					for social causes.</p>

			</div>

			<div class="feature-card">

				<h3>Discover NGOs</h3>

				<p>Explore organizations working in education, healthcare,
					environment and food donation.</p>

			</div>

			<div class="feature-card">

				<h3>Community Impact</h3>

				<p>Build connections with NGOs and help communities through
					volunteering activities.</p>

			</div>

		</div>

	</div>

	<!-- NGO PREVIEW -->

	<div class="ngo-preview">

		<div class="section-title">Popular NGOs</div>

		<div class="ngo-container">

			<div class="ngo-card">

				<h3>HopeBridge Foundation</h3>

				<p>Supporting quality education and learning opportunities for
					underprivileged children.</p>

			</div>

			<div class="ngo-card">

				<h3>GreenFuture Trust</h3>

				<p>Promoting environmental awareness, sustainability and tree
					plantation programs.</p>

			</div>

			<div class="ngo-card">

				<h3>FoodShare Mission</h3>

				<p>Providing food support and essentials to homeless and needy
					communities.</p>

			</div>

		</div>

	</div>

	<!-- FOOTER -->

	<div class="footer">

		<div class="footer-grid">

			<div class="footer-box">

				<h3>NGO Connect</h3>

				<p>NGO Connect helps people discover NGOs, volunteer for causes
					and support communities.</p>

			</div>

			<div class="footer-box">

				<h3>Quick Links</h3>

				<a href="index.jsp">Home</a> <a href="ngo.jsp">NGOs</a> <a
					href="login.jsp">Login</a> <a href="register.jsp">Register</a>

			</div>

			<div class="footer-box">

				<h3>Contact Info</h3>

				<p>Email: support@ngoconnect.com</p>
				<p>Phone: +91 9876543210</p>
				<p>Location: Bangalore, India</p>

			</div>

			<div class="footer-box">

				<h3>Follow Us</h3>

				<p>Instagram</p>
				<p>LinkedIn</p>
				<p>Twitter</p>

			</div>

		</div>

		<div class="footer-bottom">© 2026 NGO Connect | All Rights
			Reserved</div>

	</div>

</body>
</html>