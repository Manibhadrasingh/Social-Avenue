<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%
    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    
    Connection conn = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(host, user, pass);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
