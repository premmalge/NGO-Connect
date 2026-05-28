<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NGO Registration</title>

<style>

body{
    margin:0;
    font-family:Segoe UI;
    background:#0f172a;
    color:white;
}

.container{
    width:450px;
    margin:60px auto;
    background:#1e293b;
    padding:40px;
    border-radius:20px;
    box-shadow:0 8px 25px rgba(0,0,0,0.4);
}

h1{
    text-align:center;
    margin-bottom:30px;
    color:#22d3ee;
}

input, textarea, select{
    width:100%;
    padding:14px;
    margin-bottom:20px;
    border:none;
    border-radius:10px;
    background:#334155;
    color:white;
    font-size:15px;
}

textarea{
    resize:none;
    height:100px;
}

button{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#22d3ee;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#06b6d4;
}

</style>

</head>

<body>

<div class="container">

<h1>NGO Registration Request</h1>

<form action="NGORegisterServlet" method="post">

<input type="text" name="ngo_name"
placeholder="NGO Name" required>

<input type="email" name="email"
placeholder="Email" required>

<input type="password" name="password"
placeholder="Password" required>

<select name="category" required>

<option value="">Select Category</option>

<option>Education</option>

<option>Healthcare</option>

<option>Environment</option>

<option>Food Donation</option>

<option>Women Empowerment</option>

</select>

<input type="text" name="location"
placeholder="Location" required>

<textarea name="description"
placeholder="NGO Description"></textarea>

<button type="submit">

Send Request To Admin

</button>

</form>

</div>

</body>
</html>