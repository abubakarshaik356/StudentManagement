<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
    }

    body {
        background: linear-gradient(135deg, #e3f2fd, #f0f2f5);
        color: #333;
    }

    header {
        height: 75px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #007bff;
        padding: 0 30px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .left {
        font-size: 28px;
        font-weight: bold;
        color: #fff;
    }

    .right a {
        text-decoration: none;
        color: #fff;
        margin-left: 20px;
        font-weight: 500;
        transition: color 0.3s;
    }

    .right a:hover {
        color: #ffe082;
    }

    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 50px;
    }

    h2 {
        color: #007bff;
        font-size: 30px;
        margin-bottom: 20px;
    }

    form {
        width: 400px;
        background: #fff;
        padding: 35px;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        gap: 15px;
        transition: transform 0.3s ease;
    }

    form:hover {
        transform: translateY(-5px);
    }

    label {
        font-weight: 600;
        color: #333;
        text-align: left;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        outline: none;
        font-size: 15px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    input:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
    }

    button {
        padding: 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        transition: all 0.3s ease;
        cursor: pointer;
        box-shadow: 0 2px 6px rgba(0, 123, 255, 0.3);
    }

    button:hover {
        background: #0056b3;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0, 123, 255, 0.4);
    }

    .msg p {
        color: red;
        margin-bottom: 10px;
        font-weight: bold;
    }

    @media screen and (max-width: 600px) {
        form {
            width: 90%;
            padding: 25px;
        }

        h2 {
            font-size: 26px;
        }

        .left {
            font-size: 22px;
        }
    }
</style>
</head>
<body>
    <%
        String msg = request.getParameter("msg");
        if (msg == null) {
            msg = " ";
        }
    %>
    <header>
        <div class="left">Student Management System</div>
        <div class="right">
            <a href="addstudent.jsp">Add Student</a>
            <a href="viewstudent.jsp">View Students</a>
            <a href="searchstudent.jsp">Search Student</a>
        </div>
    </header>

    <div class="container">
        <div class="msg"><p><%= msg %></p></div>
        <h2>Add Student</h2>
        <form action="AddStudent" method="post">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="dept">Department</label>
            <input type="text" id="dept" name="dept" required>

            <label for="marks">Marks</label>
            <input type="number" id="marks" name="marks" required>

            <button type="submit">Add Student</button>
        </form>
    </div>
</body>
</html>
