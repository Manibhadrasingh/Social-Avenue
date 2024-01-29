<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>



<%
//    securing page via session
    String post_photo = null;
    Object email = session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("login.jsp");
    } else {
        String driver = "com.mysql.jdbc.Driver";
        String host = "jdbc:mysql://localhost:3306/Socially";
        String user = "root";
        String pass = "";
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(host, user, pass);

        Statement st = conn.createStatement();
//        String sql = "SELECT *, p.id AS pid, r.id AS rid, u.id AS uid FROM registration AS r LEFT JOIN post AS p ON p.user_id = r.id LEFT JOIN update_profile AS u ON u.userid = r.id left join friend_requests as fr  ON (r.id = fr.sender_id AND fr.receiver_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted') OR (r.id = fr.receiver_id AND fr.sender_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted')  WHERE r.email = '" + email + "'  or fr.status= 'accepted'  order by p.created_at desc";
        String sql = "SELECT *, p.id AS pid, r.id AS rid, u.id AS uid FROM registration AS r "
                + "LEFT JOIN post AS p ON p.user_id = r.id "
                + "LEFT JOIN update_profile AS u ON u.userid = r.id "
                + "LEFT JOIN friend_requests AS fr ON "
                + "(r.id = fr.sender_id AND fr.receiver_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted') OR "
                + "(r.id = fr.receiver_id AND fr.sender_id = '" + session.getAttribute("user_id") + "' AND fr.status = 'accepted') "
                + "WHERE (r.email = '" + email + "' OR fr.status = 'accepted') AND "
                + "p.post_desc IS NOT NULL AND p.post_desc <> '' "
                + "ORDER BY p.created_at DESC";

        ResultSet rs = st.executeQuery(sql);

        Statement st1 = conn.createStatement();
        String sql1 = "select * from registration as r left join update_profile as up on r.id = up.userid  where email = '" + email + "'";
        ResultSet rs1 = st1.executeQuery(sql1);
        if (rs1.next()) {
            String name = rs1.getString("name");
            String bio = rs1.getString("bio");


%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link href="css/index_Page.css" rel="stylesheet" type="text/css"/>
        <script src="js/user_Comment.js" type="text/javascript"></script>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <!-- left sidebar -->
            <div class="left-sidebar">
                <div class="sidebar-profile-box">
                    <img src="uploads/<%=rs1.getString("coverPhoto")%>" width="100%" />
                    <div class="sidebar-profile-info">
                        <img src="uploads/<%=rs1.getString("photo")%>" />
                        <h1><%= name%></h1>                       
                        <h3><%= bio%></h3>
                        <ul>
                            <li>Your profile views <span>52</span></li>
                            <li>Your post views <span>130</span></li>
                            <li>Your connection <span>502</span></li>
                        </ul>
                    </div>
                    <div class="sidebar-profile-link">
                        <a href="#"><img src="images/bookmark-fill.svg" />My items</a>
                        <a href="#"><img src="images/medal.png" />Try premium</a>
                    </div>
                </div>
                <div class="sidebar-activity">
                    <h3>RECENT</h3>
                    <a href="#"><img src="images/recent.png">Web development</a>
                    <a href="#"><img src="images/recent.png">User Interface</a>
                    <a href="#"><img src="images/recent.png">Online Learning</a>
                    <a href="#"><img src="images/recent.png">Learn Online</a>
                    <a href="#"><img src="images/recent.png">Code Better</a>
                    <a href="#"><img src="images/recent.png">Group Learning</a>
                    <h3>GROUPS</h3>
                    <a href="#"><img src="images/group.png">Web Design group</a>
                    <a href="#"><img src="images/group.png">HTML & CSS Learners</a>
                    <a href="#"><img src="images/group.png">Python & Javascript Group</a>
                    <a href="#"><img src="images/group.png">Web Development</a>
                    <h3>HASHTAG</h3>
                    <a href="#"><img src="images/hashtag.png">User interface</a>
                    <a href="#"><img src="images/hashtag.png">Online Learning</a>
                </div> 

            </div>

            <!-- main-content -->

            <div class="main-content">
                <div class="create-post">
                    <div class="create-post-input">
                        <img src="uploads/<%=rs1.getString("photo")%>" />
                        <textarea rows="2" placeholder="Write a post"></textarea>
                    </div>
                    <div class="create-post-links">
                        <li><img src="images/photo.png" />Photo</li>
                        <li><img src="images/video.png" />Video</li>
                        <li><img src="images/event.png" />Event</li>
                        <li id="openPostBtn">Post</li>
                    </div>
                </div>
                <div class="overlay" id="postOverlay">
                    <div class="post-popup">
                        <span class="close" id="closePostBtn">&times;</span>
                        <h2>Create a Post</h2>
                        <form method="post" action="upload_post.jsp" enctype="multipart/form-data" id="postForm">
                            <textarea id="postDescription" placeholder="Write something..." name="post_desc" style="height: 125px;width:95%; resize: none"></textarea>
                            <input type="file" id="photoUpload" name="post_photo" alt="..." accept="image/*" >
                            <button type="submit" class="btn" name="submit">Post</button>
                        </form>
                    </div>
                </div>
                <div class="sort-by">
                    <hr />
                    <p>
                        Sort by: <span>top <img src="images/arrow-down.png" alt="" /></span>
                    </p>
                </div>
                <%
                    if (!rs.next()) {
                %>
                <div class="col-md-12 no-posts-msg">
                    <p>Oops! Please upload a post. You haven't posted anything yet.</p>
                </div>
                <%
                } else {
                    do {
                %>

                <div class="post">
                    <div class="post-author">
                        <img src="uploads/<%=rs.getString("photo")%>"/>
                        <div>
                            <h1> <%= rs.getString("name")%></h1>
                            <small><%=rs.getString("bio")%></small>

                            <span class="post-time" data-post-time="<%= rs.getString("created_at")%>">

                        </div>
                    </div>
                    <p>
                        <%= rs.getString("post_desc")%>
                    </p>
                    <img src="uploads/<% out.print(rs.getString("post_photo"));%>" width="100%" alt="not found"/>

                    <div class="post-stats">
                        <div>
                            <img src="images/like.png" alt="" />
                            <img src="images/heart1.png" alt="" />
                            <img src="images/clap.png" alt="" />
                            <span class="liked-users">Deepak Singh and 45 others</span>
                        </div>

                        <div>
                            <span>22 comments &middot; 40 shares</span>
                        </div>
                    </div>
                    <div class="post-activity">
                        <div>
                            <img src="uploads/<% out.print(rs.getString("photo"));%>" class="post-activity-user-icon" />
                            <img src="images/arrow-down.png" class="post-activity-arrow-icon" />
                        </div>
                        <div class="post-activity-link">
                            <img src="images/like.png" alt="" />
                            <span>Like</span>
                        </div>
                        <div class="post-activity-link">
                            <img src="images/comment.png" alt="" id="comment-btn1" onclick="showComment(<%= rs.getString("pid")%>)" />
                            <!-- <span>Comment</span> -->
                            <div class="posttt" id="showcomment_<%= rs.getString("pid")%>">
                                <div class="add-comment">
                                    <div class="user-profileee">
                                        <img src="uploads/<% out.print(rs.getString("photo"));%>" alt="Your Profile Icon">
                                    </div>
                                    <!--<input type="text"  >-->
                                    <input type="text" id="comment-input_<%= rs.getString("pid")%>" style="display: none;" placeholder="Add a comment...">
                                    <button id="comment-btn">Comment</button>
                                </div>
                            </div>
                        </div>
                        <div class="post-activity-link">
                            <img src="images/share.png" alt="" />
                            <span>Share</span>
                        </div>
                        <div class="post-activity-link">
                            <img src="images/send.png" alt="" />
                            <span>Send</span>
                        </div>
                    </div>
                </div>
                <%
                        } while (rs.next());
                    }
                %>


            </div>


            <!-- right sidebar -->
            <div class="right-sidebar">
                <div class="sidebar-news">
                    <img src="images/more.png" class="info-icon" width="20px" />
                    <h3>Trending news</h3>
                    <a href="#">High demand for skilled manpower</a>
                    <span>1d ago &middot; 10,934 readers</span>

                    <a href="#">Careers growing horizontally too</a>
                    <span>19h ago &middot; 1,934 readers</span>

                    <a href="#">Less work visa for US, more for UK</a>
                    <span>18h ago &middot; 8,208 readers</span>

                    <a href="#">More hiring = higher confidence?</a>
                    <span>12 ago &middot; 6,534 readers</span>

                    <a href="#">Gautam Adani is the world's third richest</a>
                    <span>21h ago &middot; 15,754 readers</span>

                    <a href="#" class="read-more-link">Read More</a>
                </div>
                <div class="sidebar-ad">
                    <small>Ad &middot; &middot; &middot;</small>
                    <p>Master the 5 principles of web design</p>
                    <div>
                        <img src="uploads/<%=rs1.getString("photo")%>"/>
                        <img src="images/mi-logo.png"/>
                    </div>
                    <b>Brand and Demand in Xiaomi</b>
                    <a href="#" class="ad-link">Learn More</a>
                </div>

                <div class="sdebar-useful-links">
                    <a href="#">About</a>
                    <a href="#">Accessibility</a>
                    <a href="#">Help Center</a>
                    <a href="#">Privacy Policy</a>
                    <a href="#">Advertising</a>
                    <a href="#">Get the App</a>
                    <a href="#">More</a>

                    <div class="copyright-msg">
                        <img src="images/mi-logo.png" />
                        <p>Social &#169; 2023. All right reserved</p>
                    </div>
                </div>
            </div>
        </div>
        <%                String email12 = session.getAttribute("email").toString();
        %>


        <script src="js/pop_up.js" type="text/javascript"></script>
        <script>
                                function updatePostTime() {
                                    var postTimeElements = document.getElementsByClassName('post-time');

                                    for (var i = 0; i < postTimeElements.length; i++) {
                                        var postTime = postTimeElements[i].getAttribute('data-post-time');
                                        var parsedTime = new Date(postTime);
                                        var formattedTime = PostUtil.calculateTimeAgo(parsedTime);
                                        postTimeElements[i].textContent = formattedTime;
                                    }
                                }

                                // Update post times every 60 seconds
                                setInterval(updatePostTime, 60000);

                                // Initial update
                                updatePostTime();
        </script>

    </body>
</html>

<%
        }
    }
%>