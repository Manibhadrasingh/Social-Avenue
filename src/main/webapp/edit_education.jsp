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

//            out.println("File(s) uploaded successfully! <br/> ");

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
    String id  = request.getParameter("id");

    String sql = "UPDATE add_education as ax SET add_photo=?, add_college=?, add_course=?, add_joining_date=?, add_ending_date=? WHERE ax.id="+id;

    try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
    
        preparedStatement.setString(1, data.get("add_cllg_photo"));
        preparedStatement.setString(2, data.get("add_cllg_name"));
        preparedStatement.setString(3, data.get("add_course_name"));
        preparedStatement.setString(4, data.get("add_starting_date"));
        preparedStatement.setString(5, data.get("add_ending_date"));
        
        out.print(id);

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
    <title>Post Updated</title>
</head>
<body>
    <h1>Post Updated Successfully! <%    out.print(data.get("add_cllg_photo")); %></h1>
    <a href="index.jsp">Update Another Post</a>
</body>
</html>
