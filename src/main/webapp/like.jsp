<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
    // Database connection parameters
    String driver = "com.mysql.cj.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";

    String itemIdString = request.getParameter("itemId");
    int itemId = 0;  
    int likes = 0;

    if (itemIdString != null && !itemIdString.isEmpty()) {
        itemId = Integer.parseInt(itemIdString);
    }

    try {
        // Load the JDBC driver
        Class.forName(driver);

        // Establish a connection
        Connection connection = DriverManager.getConnection(host, user, pass);

        // Retrieve current likes
        PreparedStatement selectStatement = connection.prepareStatement("SELECT likes FROM useLike WHERE item_id = ?");
        selectStatement.setInt(1, itemId);
        ResultSet resultSet = selectStatement.executeQuery();

        if (resultSet.next()) {
            likes = resultSet.getInt("likes");
        }

        // Close the resources
        resultSet.close();
        selectStatement.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>

<html>
    <head>
        <title>Like System</title>
    </head>
    <body>

        <p>Likes: <%= likes%></p>

        <form action="like.jsp" method="post">
            <input type="hidden" name="itemId" value="<%= itemId%>">
            <input type="submit" name="action" value="Like">
        </form>

        <%-- Handle the form submission --%>
        <%
            String action = request.getParameter("action");
            if ("Like".equals(action)) {
                try {
                    // Establish a connection
                    Connection connection = DriverManager.getConnection(host, user, pass);

                    // Update likes
                    PreparedStatement updateStatement = connection.prepareStatement("INSERT INTO useLike (item_id, likes) VALUES (?, 1) ON DUPLICATE KEY UPDATE likes = likes + 1");
                    updateStatement.setInt(1, itemId);
                    updateStatement.executeUpdate();

                    // Close the resources
                    updateStatement.close();
                    connection.close();

                    // Redirect to refresh the page
                    response.sendRedirect("like.jsp");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

    </body>
</html>



