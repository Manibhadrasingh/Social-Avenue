
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>
<%    
 
    Statement st = conn.createStatement();
    String sql = "UPDATE friend_requests as fr SET status = 'rejected' WHERE fr.id = '"+session.getAttribute("user_id") +"'";
    int res = st.executeUpdate(sql);
    out.print("rejected");
%>

