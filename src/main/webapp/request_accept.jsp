<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="connection.jsp"  %> 
<%
    String id = request.getParameter("id");
    Statement st = conn.createStatement();
    String sql = "UPDATE friend_requests AS fr INNER JOIN registration AS r ON fr.id = '"+id+"' SET fr.status = 'accepted' WHERE fr.receiver_id = '" + session.getAttribute("user_id") + "'";
    int rowsAffected = st.executeUpdate(sql);
    if (rowsAffected > 0) {   
        response.sendRedirect("notification.jsp");
    } else {
        out.print("Failed to accept request");
    }
    st.close();
    conn.close();
%>

