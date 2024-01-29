<%
    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);
    Statement st = conn.createStatement();
    String sql = "select fr.*,up.photo, r.* from friend_requests as fr inner join registration as r on r.id = fr.sender_id left join update_profile as up on r.id = up.userid where fr.receiver_id = '" + session.getAttribute("user_id") + "' and status = 'pending';";
    ResultSet rs = st.executeQuery(sql);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LinkedIn Notifications</title>
        <link href="css/notifications_.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <!-- Rest of your HTML content -->
        <div class="notification-panel">
            <h3>Notifications Panel</h3><br>
            <div class="notification">
                <div class="notification-header">
                    <img src="images/follow.png" alt="Post Icon" class="notification-icon">
                    <div class="notification-text">
                        Someone you follow has made a post.
                    </div>
                </div>
                <div class="notification-time">2h ago</div>
            </div>

            <div class="notification">
                <div class="notification-header">
                    <img src="images/like.png" alt="Like Icon" class="notification-icon">
                    <div class="notification-text">
                        John Doe liked and commented on your post.
                    </div>
                </div>
                <div class="notification-time">4h ago</div>
            </div>

            <div class="notification">
                <div class="notification-header">
                    <img src="images/amazon.png" alt="Job Icon" class="notification-icon">
                    <div class="notification-text">
                        New job opportunity: Marketing Manager at ABC Company.
                    </div>
                </div>
                <div class="notification-time">1d ago</div>
            </div>

          <div class="notification">
    <div class="notification-heade">
        <% while (rs.next()) {
            if ("pending".equals(rs.getString("status"))) {
        %>
        <div class="notification-text">
            <div class="profile-info">
                <img src="uploads/<%=rs.getString("photo")%>" alt="Connection Icon" class="notification-icon"/>
                <div>
                    <p><%= rs.getString("name")%> sent you a connection request</p>
                    <a href="request_accept.jsp?id=<%=rs.getString("fr.id")%>" ><button class="notifyG">Accept</button></a>  
                    <a href="request_delete.jsp?id=<%=rs.getString("fr.id")%>" > <button class="notifyR">Reject</button></a> <br></br> 
                </div>
            </div>
        </div>
                 <!--<div class="notification-time">2d ago</div>-->
        <%
                }
            }
            rs.close();
            st.close();
            conn.close();
        %>
    </div>
   
</div>



            <div class="notification">
                <div class="notification-header">
                    <img src="images/peo_profile.png" alt="Profile Icon" class="notification-icon">
                    <div class="notification-text">
                        5 people viewed your profile this week.
                    </div>
                </div>
                <div class="notification-time">3d ago</div>
            </div>

        </div>
        <div class="profile-sidebar">
            <!-- Sidebar content here -->
            <div class="sidebar-ad">
                <small>Ad &middot; &middot; &middot;</small>
                <p>Manibhadra, stay informed on industry news and trends</p>
                <div>
                    <img src="images/profile.jpg" alt="" />
                    <img src="images/mi-logo.png" alt="" />
                </div>
                <b>Manibhadra, keep up with the latest insights from Humanitec</b>
                <button class="ad-link"><a href="#">Visit Company</a></button>
            </div>

        </div>
    </body>
</html>
