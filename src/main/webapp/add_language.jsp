<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    String lng1 = request.getParameter("add_1_language");
    String lng2 = request.getParameter("add_2_language");
    String lng3 = request.getParameter("add_3_language");
    String lng4 = request.getParameter("add_4_language");

    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);

    String sql = "INSERT INTO language(user__id,language1,language2,language3,language4) VALUES (?,?,?,?,?)";
    try {
        String id = (String) session.getAttribute("user_id");
        if (id != null) {
            try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
                preparedStatement.setString(1, id);
                preparedStatement.setString(2, lng1);
                preparedStatement.setString(3, lng2);
                preparedStatement.setString(4, lng3);
                preparedStatement.setString(5, lng4);

                int result = preparedStatement.executeUpdate();

                if (result > 0) {
//                    out.println("success");
                     response.sendRedirect("profile.jsp");
                } else {
                    // Handle failure
                }
            }
        } else {
            // Handle case where 'id' is null
        }
    } catch (SQLException e) {
        out.println("SQLException: " + e.getMessage());
    }


%>