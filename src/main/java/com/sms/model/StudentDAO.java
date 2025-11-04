package com.sms.model;

import java.sql.*;
import java.util.*;

import com.sms.dbutil.DBConnection;

public class StudentDAO {
	static Connection con=DBConnection.getConnector();
    public boolean addStudent(Student s) {
        String sql = "INSERT INTO student(name, email, department, marks) VALUES(?,?,?,?)";
        try (Connection con = DBConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getDepartment());
            ps.setInt(4, s.getMarks());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnector();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM student")) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setDepartment(rs.getString("department"));
                s.setMarks(rs.getInt("marks"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Student getStudentById(int id) {
        String sql = "SELECT * FROM student WHERE id=?";
        try (Connection con = DBConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setDepartment(rs.getString("department"));
                s.setMarks(rs.getInt("marks"));
                return s;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStudent(Student s) {
        String sql = "UPDATE student SET name=?, email=?, department=?, marks=? WHERE id=?";
        try (Connection con = DBConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getDepartment());
            ps.setInt(4, s.getMarks());
            ps.setInt(5, s.getId());
            int res=ps.executeUpdate();
            System.out.println(s.getId());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM student WHERE id=?";
        try (Connection con = DBConnection.getConnector();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
