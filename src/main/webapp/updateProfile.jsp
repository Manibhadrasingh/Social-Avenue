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
    Statement st = conn.createStatement();
//    Object user_id = session.getAttribute("user_id");
//        out.print(user_id);
    String cmd = "select userid from update_profile where userid='" + session.getAttribute("user_id") + "'";
//    out.print(cmd);
    ResultSet rs = st.executeQuery(cmd);
    int res = 0;
    if (rs.next()) {
//    String sql1 = "update update_profile set firstName = '"+data.get("new-first-name")+"',lastName = '"+data.get("new-last-name")+"',coverphoto = '"+data.get("new-cover-photo")+"',photo = '"+data.get("new-photo")+"',headline = '"+data.get("new-headline")+"',currentPosition = '"+data.get("new-position")+"',location = '"+data.get("new-location")+"',city = '"+data.get("new-city")+"',about = '"+data.get("new-about")+"' where userid = '"+session.getAttribute("user_id")+"'";
        String sql1 = "UPDATE update_profile AS a  JOIN registration AS b ON a.userid = b.id " +
                   "SET a.name = '" + data.get("new-name") + "', b.name = '" + data.get("new-name") + "', a.coverphoto = '" + data.get("new-cover-photo") + "', a.photo = '" + data.get("new-photo") + "', a.headline = '" + data.get("new-headline") + "', a.currentPosition = '" + data.get("new-position") + "', a.location = '" + data.get("new-location") + "', a.city = '" + data.get("new-city") + "', a.about = '" + data.get("new-about") + "', b.city = '" + data.get("new-city") + "', b.address = '" + data.get("new-location") + "', b.bio = '" + data.get("new-about") + "'"
                + "WHERE a.userid = '" + session.getAttribute("user_id") + "'";
               
        res = st.executeUpdate(sql1);
         response.sendRedirect("profile.jsp");
    } else {
        String sql = "insert into update_profile (userid,name,coverPhoto,photo,headline,currentPosition,location,city,about) values ('" + session.getAttribute("user_id") + "','" + data.get("new-name") + "','" + data.get("new-cover-photo") + "','" + data.get("new-photo") + "','" + data.get("new-headline") + "','" + data.get("new-position") + "','" + data.get("new-location") + "','" + data.get("new-city") + "','" + data.get("new-about") + "')";
        out.print(sql);
        res = st.executeUpdate(sql);
                 response.sendRedirect("profile.jsp");


    }
//    out.print(res);

%>


