<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);
    Statement st1 = conn.createStatement();
    String contentType = request.getParameter("type");
    boolean displayFriends = "accepted".equals(contentType);
    String sql;

    if (displayFriends) {
        sql = "SELECT r.name, r.bio, u_p.photo, r.id AS rid, fr.* FROM registration AS r LEFT JOIN update_profile AS u_p ON r.id = u_p.userid LEFT JOIN friend_requests AS fr ON (r.id = fr.sender_id AND fr.receiver_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted') OR (r.id = fr.receiver_id AND fr.sender_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted') WHERE r.id != '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted'";
    } else {
        sql = "SELECT r.name, r.bio, u_p.photo, r.id AS rid, fr.* FROM registration AS r LEFT JOIN update_profile AS u_p ON r.id = u_p.userid LEFT JOIN friend_requests AS fr ON (r.id = fr.sender_id AND fr.receiver_id = '" + session.getAttribute("user_id") + "' AND fr.status IN ('pending', 'accepted')) OR (r.id = fr.receiver_id AND fr.sender_id = '" + session.getAttribute("user_id") + "' AND fr.status IN ('pending', 'accepted')) WHERE r.id != '" + session.getAttribute("user_id") + "' AND (fr.sender_id IS NULL OR fr.status = 'pending')";
    }
    ResultSet rs = st1.executeQuery(sql);
%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Connections</title>
        <!--<link href="css/myconnection_.css" rel="stylesheet" type="text/css"/>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                background: #efefef;
            }


            .left-sidebar{
                flex-basis:25%;
                position: sticky;
                top: 70px;
                align-self: flex-start;
                background:#fff;
                /*height:110vh;*/
            }
            .left-sidebar h3{
                text-align:left;
                color:black;
                font-size: 15px;
                padding: 10px;
            }

            .imp-links a{
                margin-left: 20px;
                text-decoration: none;
                display: flex;
                align-items: center;
                margin-top: 30px;
                color: rgb(0, 0, 0);
                width: fit-content;
            }
            .imp-links  span{
                margin-left:70%;
                float: right;
                gap: 10%;
                position: absolute;
            }
            .imp-links a img{
                width: 25px;
                margin-right:20px;
            }

            .imp-links{
                border-bottom:1px solid gray ;
                width:100%;
            }



        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

       <div class="container mt-4">
            <div class="row">
                <div class="col-md-3">
                    <div class="left-sidebar">
                        <h3>My Network</h3>
                        <div class="imp-links">
                            <a href="?type=accepted"><img src="images/connection.svg">Connection<span>77</span></a>
                            <a href=""><img src="images/contact.svg">Contact<span>35</span></a>
                            <a href=""><img src="images/follow.png">Following<span>43</span></a>
                            <a href=""><img src="images/group.svg">Group</a>
                            <a href=""><img src="images/event.svg">Events</a>
                            <a href=""><img src="images/page.svg">Pages<span>51</span></a>
                            <a href=""><img src="images/news.svg">Latest News<span>05</span></a>
                            <a href=""><img src="images/news.svg">Hashtags<span>05</span></a>
                        </div>
                    </div>
                </div>

                <!-- Main content -->
                <div class="col-md-9">
                    <div class="container">
                        <div class="row gy-3">
                            <% if (!rs.next()) { %>
                            <div class="col-md-12 no-connections-msg">
                                <p>Oops! Please make connections to view your suggestion list. You haven't made any connections yet.</p>
                            </div>
                            <% } else { %>
                            <% do {%>
                            <div class="col-md-4">
                                <div class="card h-100 d-flex flex-column">
                                    <img src="uploads/<%= rs.getString("photo")%>" class="card-img-top" alt="">
                                    <div class="card-body flex-grow-1">
                                        <h5 class="card-title"><%= rs.getString("name")%></h5>
                                        <p class="card-text"><%= rs.getString("bio")%></p>
                                    </div>

                                    <div class="btn-container mb-3">
                                        <% if ("accepted".equals(rs.getString("status"))) { %>
                                        <a href="#" class="btn btn-primary">View Profile</a>
                                        <a href="#" class="btn btn-info">Send Message</a>
                                        <% } else if ("pending".equals(rs.getString("status"))) { %>
                                        <button class="btn btn-primary" name="add_friend">Request Sent</button>
                                        <a href="cancel_request.jsp" class="btn btn-danger">Cancel</a>
                                        <% } else {%>
                                        <a href="add_friend_req.jsp?user_id=<%= rs.getString("rid")%>" class="btn btn-primary" name="add_friend">Add Friend</a>
                                        <a href="remove_friend.jsp" class="btn btn-danger">Remove</a>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <% } while (rs.next()); %>
                            <% }%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <hr>
</body>
</html>
