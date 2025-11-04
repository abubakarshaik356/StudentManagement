package com.sms.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchStudent")
public class SearchStudentServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            
            if (id!=0) {
                res.sendRedirect("searchstudent.jsp?id="+id);
            } else {
            	res.sendRedirect("searchstudent.jsp?id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
