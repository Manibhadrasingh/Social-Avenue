

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<%
    String skill1 = request.getParameter("add_1_skill");
    String skill2 = request.getParameter("add_2_skill");
    String skill3 = request.getParameter("add_3_skill");
    String skill4 = request.getParameter("add_4_skill");
    String skill5 = request.getParameter("add_5_skill");
    String skill6 = request.getParameter("add_6_skill");

    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);

    String sql = "INSERT INTO skill (userr_id,skill1,skill2,skill3,skill4,skill5,skill6) VALUES (?,?,?,?,?,?,?)";
    try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
        try {
            String id1 = (String) session.getAttribute("user_id");
            if (id1 != null) {
                preparedStatement.setString(1, id1);
            } else {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        preparedStatement.setString(2, skill1);
        preparedStatement.setString(3, skill2);
        preparedStatement.setString(4, skill3);
        preparedStatement.setString(5, skill4);
        preparedStatement.setString(6, skill5);
        preparedStatement.setString(7, skill6);
        int result = preparedStatement.executeUpdate();

        if (result > 0) {
            response.sendRedirect("profile.jsp");
//            out.print("success");

        } else {
            // Something went wrong
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    }

%>