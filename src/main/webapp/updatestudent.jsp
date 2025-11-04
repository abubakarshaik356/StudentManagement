<%@page import="com.sms.model.Student"%>
<%@page import="com.sms.model.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
    }

    body {
        background: #f0f2f5;
    }

    header {
        height: 70px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: linear-gradient(90deg, #007bff, #0056b3);
        padding: 0 30px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
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
        transition: 0.3s;
    }

    .right a:hover {
        color: #dfe9f3;
        text-decoration: underline;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        margin-top: 40px;
    }

    .form-card {
        background: #fff;
        padding: 30px 40px;
        border-radius: 12px;
        width: 450px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: 0.3s ease;
    }

    .form-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    label {
        text-align: left;
        width: 100%;
        font-weight: bold;
        color: #333;
        margin-bottom: 5px;
        display: block;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.4);
    }

    button {
        padding: 10px;
        background: #007bff;
        color: white;
        width: 100%;
        border-radius: 6px;
        border: none;
        font-size: 16px;
        margin-top: 10px;
        transition: 0.3s;
    }

    button:hover {
        background: #0056b3;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
        cursor: pointer;
    }

    .msg p {
        color: red;
        font-weight: bold;
        margin-bottom: 15px;
    }
</style>
</head>
<body>
<%
    String msg = request.getParameter("msg");
    if(msg == null) msg = " ";
    int id;
    Student s = null;
    if(request.getParameter("id") != null){
        id = Integer.parseInt(request.getParameter("id"));
        StudentDAO dao = new StudentDAO();
        s = dao.getStudentById(id);
        if(s == null){
            msg = "No Student Found";
        }
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
    <div class="form-card">
        <div class="msg"><p><%=msg %></p></div>
        <h2>Update Student</h2>
        <form action="UpdateStudent" method="post">
            <label for="id">Student ID</label>
            <input type="text" id="id" name="id" value="<%=s.getId()%>" readonly>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="<%=s.getName()%>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%=s.getEmail()%>" required>

            <label for="dept">Department</label>
            <input type="text" id="dept" name="dept" value="<%=s.getDepartment()%>" required>

            <label for="marks">Marks</label>
            <input type="number" id="marks" name="marks" value="<%=s.getMarks()%>" required>

            <button type="submit">Update Student</button>
        </form>
    </div>
</div>
</body>
</html>
