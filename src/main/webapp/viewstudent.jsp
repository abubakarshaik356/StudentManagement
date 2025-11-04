<%@page import="java.util.List"%>
<%@page import="com.sms.model.StudentDAO"%>
<%@page import="com.sms.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
    }

    body {
        background: linear-gradient(135deg, #e8f0fe, #f0f2f5);
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

    h1 {
        margin: 30px 0 15px 0;
        color: #007bff;
        font-size: 32px;
    }

    .container {
        width: 90%;
        margin: 0 auto;
        background: #fff;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background-color: #007bff;
        color: #fff;
        text-align: left;
        padding: 14px;
        font-size: 16px;
        letter-spacing: 0.5px;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #e3f2fd;
        transition: 0.3s ease;
    }

    td a {
        text-decoration: none;
        padding: 6px 12px;
        border-radius: 6px;
        color: #fff;
        font-weight: 500;
        margin: 0 3px;
        transition: background-color 0.3s;
    }

    td a[href*="update"] {
        background-color: #28a745;
    }

    td a[href*="update"]:hover {
        background-color: #218838;
    }

    td a[href*="Delete"] {
        background-color: #dc3545;
    }

    td a[href*="Delete"]:hover {
        background-color: #b71c1c;
    }

    @media screen and (max-width: 768px) {
        .container {
            width: 95%;
            padding: 15px;
        }

        table, th, td {
            font-size: 14px;
        }

        .left {
            font-size: 22px;
        }
    }
</style>
</head>
<body>
    <%
        StudentDAO dao = new StudentDAO();
        List<Student> list = dao.getAllStudents();
        String res = "";
        if (list.size() != 0) {
            for (Student s : list) {
                res += "<tr>"
                    + "<td>" + s.getId() + "</td>"
                    + "<td>" + s.getName() + "</td>"
                    + "<td>" + s.getEmail() + "</td>"
                    + "<td>" + s.getDepartment() + "</td>"
                    + "<td>" + s.getMarks() + "</td>"
                    + "<td>"
                    + "<a href='updatestudent.jsp?id=" + s.getId() + "'>Edit</a>"
                    + "<a href='DeleteStudentServlet?id=" + s.getId() + "'>Delete</a>"
                    + "</td>"
                    + "</tr>";
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

    <center><h1>View Students</h1></center>

    <div class="container">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Marks</th>
                <th>Actions</th>
            </tr>
            <%= res %>
        </table>
    </div>
</body>
</html>
