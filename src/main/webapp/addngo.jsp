<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add NGO</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#0f172a;
}

.form-box{
    width:450px;
    background:#1e293b;
    padding:35px;
    border-radius:20px;
    color:white;
    box-shadow:0 10px 40px rgba(0,0,0,0.5);
}

h2{
    text-align:center;
    margin-bottom:25px;
}

input, textarea{
    width:100%;
    padding:12px;
    margin:12px 0;
    border:none;
    border-radius:10px;
    background:#334155;
    color:white;
}

textarea{
    height:120px;
    resize:none;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#06b6d4;
    color:white;
    font-size:16px;
    cursor:pointer;
    margin-top:15px;
}

button:hover{
    background:#0891b2;
}

</style>

</head>
<body>

<div class="form-box">

    <h2>Add NGO</h2>

    <form action="AddNGOServlet" method="post">

        <input type="text"
        name="ngo_name"
        placeholder="Enter NGO Name"
        required>

        <input type="text"
        name="category"
        placeholder="Enter Category"
        required>

        <input type="text"
        name="location"
        placeholder="Enter Location"
        required>

        <textarea
        name="description"
        placeholder="Enter Description"
        required></textarea>

        <button type="submit">
            Add NGO
        </button>

    </form>

</div>

</body>
</html>