<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>
<%    
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Statement st = conn.createStatement();
    String sql = "select * from registration where email='" + email + "'and password='" + password + "'";
    ResultSet rs = st.executeQuery(sql);
    if (rs.next()) {
        session.setAttribute("user_id", rs.getString("id"));
        session.setAttribute("user_Id", rs.getString("id"));
        session.setAttribute("id", rs.getString("id"));
        session.setAttribute("email",email);
        response.sendRedirect("index.jsp");
    } else {
        out.print("email or password is wrong");
    }
%>