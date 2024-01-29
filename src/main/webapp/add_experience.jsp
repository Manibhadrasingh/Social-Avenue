<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%

    // Store all form data in Key, Value format 
    Map<String, String> data = new HashMap<String, String>();

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {

        DiskFileItemFactory factory = new DiskFileItemFactory();

        ServletFileUpload upload = new ServletFileUpload(factory);

        try {

            List<FileItem> fileItems = upload.parseRequest(request);
            int i = 0;
            for (FileItem item : fileItems) {

                if (!item.isFormField()) {

                    String fileName = new File(item.getName()).getName();
                    String filePath = "/Users/manibhadrasingh/NetBeansProjects/SocialNetwork/src/main/webapp/uploads/" + fileName;
                    item.write(new File(filePath));

                    data.put(item.getFieldName(), item.getName());

                } else {
                    data.put(item.getFieldName(), item.getString());
                }

            }

        } catch (Exception e) {
            out.println("File upload failed: " + e.getMessage());
        }
    }

    out.print("<br/>");

    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);
    String sql = "INSERT INTO add_experience (user_Id, add_picture, add_job_role, add_company_name, add_interval, add_timing, add_about) VALUES (?,?, ?, ?, ?, ?, ?)";

    try ( PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

        try {
            String id = (String) session.getAttribute("user_id");
            if (id != null) {
                preparedStatement.setString(1, id);
            } else {
            
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        preparedStatement.setString(2, data.get("add_picture"));
        preparedStatement.setString(3, data.get("add_job_role"));
        preparedStatement.setString(4, data.get("add_company_name"));
        preparedStatement.setString(5, data.get("add_interval"));
        preparedStatement.setString(6, data.get("add_timing"));
        preparedStatement.setString(7, data.get("add_about"));

        int result = preparedStatement.executeUpdate();

        if (result > 0) {
            response.sendRedirect("profile.jsp");
        } else {
            // Something went wrong
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    }

%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Created</title>
    </head>
    <body>
        <h1>Post Created Successfully! <%    out.print(data.get("add_picture"));%></h1>
        <a href="index.jsp">Create Another Post</a>
    </body>
</html>