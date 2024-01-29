
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    String id = request.getParameter("user_id");
    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host,user,pass);
    String sql = "INSERT INTO friend_requests(sender_id, receiver_id, status, created_at) VALUES (?, ?, 'pending', NOW())";
    try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
    String senderId =(String) session.getAttribute("id");
    String receiverId =request.getParameter("user_id");
    preparedStatement.setString(1,senderId);
    preparedStatement.setString(2,receiverId);
    int result = preparedStatement.executeUpdate();
    if(result > 0){
    response.sendRedirect("friends.jsp");
    }
    else{
    out.print("failed");
    }
    }
    catch(SQLException e){
    out.print("SQL Exception "+e.getMessage());
    }

%>