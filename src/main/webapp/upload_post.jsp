<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%
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
        Statement st = conn.createStatement();
        Object user_id = session.getAttribute("user_id");
        String sql = "insert into post (post_desc,post_photo,user_id) values ('"+data.get("post_desc") +"','"+data.get("post_photo") +"','"+user_id+"')";
        int result = st.executeUpdate(sql);
    if (result > 0) {
            response.sendRedirect("index.jsp");
    } else {
        out.print("something went wrong");
    }
%>
