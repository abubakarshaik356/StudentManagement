package com.sms.controller;

import java.io.IOException;

import com.sms.model.Student;
import com.sms.model.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddStudent")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String dept = req.getParameter("dept");
            int marks = Integer.parseInt(req.getParameter("marks"));

            if (!email.contains("@") || !email.contains(".")) {
            	res.sendRedirect("addstudent.jsp?msg=Enter correct email");
            }
            if (marks < 0 || marks > 100) {
            	res.sendRedirect("addstudent.jsp?msg=Invalid Marks");
            }

            Student s = new Student();
            s.setName(name);
            s.setEmail(email);
            s.setDepartment(dept);
            s.setMarks(marks);
            StudentDAO dao = new StudentDAO();
            if (dao.addStudent(s))
                res.sendRedirect("viewstudent.jsp");
            else
            	res.sendRedirect("addstudent.jsp?msg=Somthing went wrong. Record not added");
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }
}
