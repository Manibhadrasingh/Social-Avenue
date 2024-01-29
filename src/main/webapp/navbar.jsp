<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    Object email1 = session.getAttribute("email");
    if (email1 == null) {
        response.sendRedirect("login.jsp");
    } else {
        String driver1 = "com.mysql.jdbc.Driver";
        String host1 = "jdbc:mysql://localhost:3306/Socially";
        String user1 = "root";
        String pass1 = "";
        Class.forName(driver1);
        Connection conn1 = DriverManager.getConnection(host1, user1, pass1);
        Statement st2 = conn1.createStatement();
        String sql2 = "SELECT *, p.id AS pid, r.id AS rid, u.id AS uid FROM registration AS r LEFT JOIN post AS p ON p.user_id = r.id LEFT JOIN update_profile AS u ON u.userid = r.id WHERE r.email = '" + email1 + "'";
        ResultSet rs2 = st2.executeQuery(sql2);
        if (rs2.next()) {
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"/>
        <script src="js/nav_js.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-left">
                <a href="index.jsp" class="logo"><img src="images/google.svg" alt=""></a>

                <div class="search-box">
                    <img src="images/search.svg" alt="">
                    <input type="text" placeholder="Search">
                </div>
            </div>
            <div class="navbar-center">
                <ul class="ul-imgg">
                    <li><a href="index.jsp" class="active-link"><img src="images/house.svg"><span>Home</span></a></li>
                    <li><a href="friends.jsp"><img src="images/building.svg" ><span>My Network</span></a></li>
                    <li><a href="#"><img src="images/store-solid.svg" ><span>Projects</span></a></li>
                    <li><a href="profile.jsp"><img src="images/people.svg"><span>Profiles</span></a></li>
                    <li><a href="jobs.jsp"><img src="images/portfolio.png"><span>Jobs</span></a></li>
                    <li><a href="messaging.jsp"><img src="images/envelope.svg" ><span>Message</span></a></li>
                    <li><a href="notification.jsp"><img src="images/bell-slash.svg"><span>Notifications</span></a></li>
                </ul>
            </div>
            <div class="navbar-right">
                <div class="online">
                    <img src="uploads/<%=rs2.getString("photo")%>" class="nav-profile-img" onclick="toggleMenu()"/>
                </div>
            </div>
            <div class="profile-menu-wrap" id="profileMenu">
                <div class="profile-menu">
                    <div class="user-info">
                        <img src="uploads/<%=rs2.getString("photo")%>" alt="" />
                        <div>
                            <h3><%=rs2.getString("name")%></h3>
                            <a href="profile.jsp">See your profile</a>
                        </div>
                    </div>
                    <hr />
                    <a href="#" class="profile-menu-link">
                        <img src="images/feedback.png" />
                        <p>Give Feedback</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/setting.png" />
                        <p>Setting and privacy</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/help.png" />
                        <p>Help and support</p>
                        <span>></span>
                    </a>
                    <a href="#" class="profile-menu-link">
                        <img src="images/display.png" />
                        <p>Display and Accessibility</p>
                        <span>></span>
                    </a>
                    <a href="logout.jsp" class="profile-menu-link">
                        <img src="images/logout.png" />
                        <p>Logout</p>
                        <span>></span>
                    </a>
                </div>
            </div>
        </nav>
    </body>
</html>

<%
        }
    }
%>