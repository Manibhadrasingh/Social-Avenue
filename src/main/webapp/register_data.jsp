<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobile = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String city = request.getParameter("city");
    String address = request.getParameter("address");
    String state = request.getParameter("state");
    String bio = request.getParameter("bio");

    if (!isValidPassword(password)) {
        out.print("Invalid password. Please use a strong password.");
        return;
    }

    try {
        // Use a prepared statement to avoid SQL injection
        String query = "INSERT INTO registration (name, email, password, mobile, dob, gender, city, state, address, bio) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, mobile);
            pst.setString(5, dob);
            pst.setString(6, gender);
            pst.setString(7, city);
            pst.setString(8, state);
            pst.setString(9, address);
            pst.setString(10, bio);

            int result = pst.executeUpdate();

            if (result > 0) {
                response.sendRedirect("login.jsp");
            } else {
                out.print("Insert failed");
            }
        }
    } catch (Exception e) {
        out.print("Error :" + e.getMessage());
    }
%>

<%! 
    boolean isValidPassword(String password) {
        String regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).+$";
        return password.matches(regex);
    }
%>
