
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
//    securing page via session

    String driver = "com.mysql.jdbc.Driver";
    String host = "jdbc:mysql://localhost:3306/Socially";
    String user = "root";
    String pass = "";
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(host, user, pass);
    Statement st = conn.createStatement();
    Statement st1 = conn.createStatement();
    Statement st3 = conn.createStatement();
    Statement st4 = conn.createStatement();
    Statement st5 = conn.createStatement();
    String sql = "SELECT * FROM `registration` as r LEFT JOIN update_profile as up on up.userid= r.id WHERE r.id = '" + session.getAttribute("user_id") + "'";
    ResultSet rs = st.executeQuery(sql);
    String id = request.getParameter("id");
    String sql1 = "SELECT * FROM add_experience AS a_e LEFT JOIN registration AS r ON a_e.user_id = r.id WHERE r.id = '" + session.getAttribute("user_id") + "' ORDER BY shorting_time DESC";
    String sql3 = "SELECT * FROM add_education AS a_ed LEFT JOIN registration AS r ON a_ed.user_ID = r.id WHERE r.id = '" + session.getAttribute("user_id") + "' ORDER BY shorting_time DESC";
    String sql4 = "select * from skill as s left join registration as r on s.userr_id=r.id where r.id ='" + session.getAttribute("user_id") + "' order by created_At desc";
    String sql5 = "select * from  language as l left join registration as r on l.user__id = r.id where r.id = '" + session.getAttribute("user_id") + "' order by created_at desc";
    ResultSet rs1 = st1.executeQuery(sql1);
    ResultSet rs3 = st3.executeQuery(sql3);
    ResultSet rs4 = st4.executeQuery(sql4);
    ResultSet rs5 = st5.executeQuery(sql5);
    if (rs.next()) {
        String name = rs.getString("name");
        String headline = rs.getString("headline");
        String position = rs.getString("currentPosition");
        String location = rs.getString("location");
        String city = rs.getString("city");
        String about = rs.getString("about");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link href="css/user_profile.css" rel="stylesheet" type="text/css"/>
        <style>

        </style>
    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <h1>     </h1>

        <div class="container"> 
            <div class="profile-main">


                <div class="profile-description">
                    <!-- Description content here -->

                    <div class="profile-container">
                        <img src="uploads/<%=rs.getString("coverPhoto")%>" height="705px" width="1000px" class="cover_pic">                    
                        <div class="profile-container-inner">
                            <img src="uploads/<%=rs.getString("photo")%>" class="profile-pic">
                            <h1><%=name%></h1>
                            <b><%=headline%> || <%=position%></b>
                            <p><%=location%> || <%=city%> &middot; <a href="#">Contact Info</a></p>
                            <div class="mutual-connection">
                                <img src="images/profile.jpg" alt="">
                                <span>1 mutual connection: Akhand Singh</span>
                            </div>
                            <div class="profile-btn">
                                <a href="#" class="primary-btn"><img src="images/connect.png">Connect</a>
                                <a href="#"><img src="images/chat.png">Message</a>
                                <a href="#" id="edit-button"><img src="images/pencil.png">Update Profile</a>
                            </div>
                        </div>
                    </div>
                    <div id="edit-popup" class="popup">
                        <div class="popup-content">
                            <span class="close" id="close-button">&times;</span>
                            <h2>Edit Profile</h2>
                            <form id="update-form" action="updateProfile.jsp" method="post" enctype="multipart/form-data">

                                <input type="hidden" name="id" value="<%=session.getAttribute("user_id")%>"   >

                                <label for="new-name">First Name:</label>
                                <input type="text" id="new-name" name="new-name" value="<%=rs.getString("name")%>"><br>

                                <label for="new-photo">Upload Cover Photo:</label>
                                <input type="file" id="new-cover-photo" name="new-cover-photo" value="<%=rs.getString("coverPhoto")%>"><br>

                                <label for="new-photo">Upload Profile Photo:</label>
                                <input type="file" id="new-photo" name="new-photo" value="<%=rs.getString("photo")%>"><br>

                                <label for="new-headline">Headline:</label>
                                <input type="text" id="new-headline" name="new-headline" value="<%=rs.getString("headline")%>"><br>

                                <label for="new-position">Current Position:</label>
                                <input type="text" id="new-position" name="new-position" value="<%=rs.getString("currentPosition")%>"><br>


                                <label for="new-location">Location:</label>
                                <input type="text" id="new-location" name="new-location" value="<%=rs.getString("location")%>"><br>

                                <label for="new-city">City:</label>
                                <input type="text" id="new-city" name="new-city" value="<%=rs.getString("city")%>"><br>

                                <label for="new-about">About:</label>
                                <input type="text" id="new-about" name="new-about" value="<%=rs.getString("about")%>"><br>

                                <button type="submit">Save</button>
                            </form>
                        </div>
                    </div>

                    <div class="profile-description">
                        <h2>About</h2>
                        <p><%=about%></p>
                        <a href="#" class="see-more-link">See more...</a>
                    </div>

                    <%
                        }

                    %>
                    <div class="profile-description">
                        <div class="experience-heading">
                            <h2>Experience</h2>
                            <a href="#" id="add-experience-button"><img src="images/plus.png" alt="Add" width="18px"></a>
                        </div>           
                        <%                            while (rs1.next()) {
                        %>
                        <div class="profile-desc-row">
                            <img src="uploads/<%=rs1.getString("add_picture")%>">
                            <div>
                                <div class="experience-heading">
                                    <h3 id="job_role_<%=rs1.getString("id")%>"><%=rs1.getString("add_job_role")%></h3>
                                    <button class="edit-button" onclick="openEditPopup(<%=rs1.getString("id")%>)"><img src="images/pencil.png" alt=""/></button>
                                </div>                            
                                <b id="company_name_<%=rs1.getString("id")%>"><%=rs1.getString("add_company_name")%> </b>
                                <b id="interval_<%=rs1.getString("id")%>"> <%=rs1.getString("add_interval")%></b>
                                <b id="timing_<%=rs1.getString("id")%>"> <%=rs1.getString("add_timing")%></b>
                                <p id="about_<%=rs1.getString("id")%>"><%=rs1.getString("add_about")%></p>
                                <hr>
                            </div>
                        </div>

                        <%
                            }
                        %>
                        <hr>
                        <a href="#" class="experience-link">Show all 7 experiences <img src="images/right-arrow.png"></a>
                    </div>

                    <div class="profile-description">
                        <div class="experience-heading">
                            <h2>Education</h2>
                            <a href="#" id="edit_experience_button" onclick="openEducationModel()"><img src="images/plus.png" alt="Add" width="18px"></a>
                        </div>             
                        <%
                            while (rs3.next()) {
                        %>

                        <div class="profile-desc-row">

                            <img src="uploads/<%=rs3.getString("add_photo")%>">
                            <div>

                                <div class="experience-heading">
                                    <h3 id="add_college_<%=rs3.getString("id")%>"><%=rs3.getString("add_college")%></h3>
                                    <button class="edit_button" onclick="openEditPopupp(<%=rs3.getString("id")%>)""><img src="images/pencil.png" alt=""/></button>

                                </div> 
                                <b id="add_course_<%=rs3.getString("id")%>"><%=rs3.getString("add_course")%></b>
                                <b id="add_joining_<%=rs3.getString("id")%>">From:<%=rs3.getString("add_joining_date")%></b>
                                <b id="add_closing_<%=rs3.getString("id")%>">To:<%=rs3.getString("add_ending_date")%></b>
                                <hr>
                            </div>

                        </div>
                        <%}%>
                    </div>

                    <div class="profile-description">
                        <div class="experience-heading">
                            <h2>Skills</h2>
                            <a href="#" id="add_skill_button" onclick="openSkillModel()"><img src="images/plus.png" alt="Add" width="18px"></a>
                        </div>     
                        <%
                            while (rs4.next()) {

                        %>
                        <a href="" class="skills-btn"><%=rs4.getString("skill1")%></a>
                        <a href="" class="skills-btn"><%=rs4.getString("skill2")%></a>
                        <a href="" class="skills-btn"><%=rs4.getString("skill3")%></a>
                        <a href="" class="skills-btn"><%=rs4.getString("skill4")%></a>
                        <a href="" class="skills-btn"><%=rs4.getString("skill5")%></a>
                        <a href="" class="skills-btn"><%=rs4.getString("skill6")%></a>
                        <%
                            }
                        %>
                    </div>
                    <div class="profile-description">
                        <div class="experience-heading">
                            <h2>Languages</h2>        
                            <a href="#" id="add_lng_button" onclick="addLanguage()"><img src="images/plus.png" alt="Add" width="18px"></a>
                        </div>  
                        <%
                            while (rs5.next()) {
                        %>
                        <a href="" class="language-btn"><%=rs5.getString("language1")%></a>
                        <a href="" class="language-btn"><%=rs5.getString("language2")%></a>
                        <a href="" class="language-btn"><%=rs5.getString("language3")%></a>
                        <a href="" class="language-btn"><%=rs5.getString("language4")%></a>
                    </div>
                    <%
                        }
                    %>
                </div>
                 
                <!-- Other profile content here -->
                <div class="profile-sidebar">
                    <!-- Sidebar content here -->

                    <div class="sidebar-ad">
                        <small>Ad &middot; &middot; &middot;</small>
                        <p>Master the 5 principles of web design</p>
                        <div>
                            <img src="uploads/<%=rs.getString("photo")%>" alt="" />
                            <img src="images/mi-logo.png" alt="" />
                        </div>
                        <b>Brand and Demand in Xiaomi</b>
                        <a href="#" class="ad-link">Learn More</a>
                    </div>

                </div>


            </div>



        </div>

        <!--add experience--> 
        <div id="add-experience-popup" class="popup">
            <div class="popup-content">
                <span class="close" id="close-experience-button">&times;</span>
                <h2>Add Experience</h2>

                <form action="add_experience.jsp" method="post" id="add-experience-form" enctype="multipart/form-data">
                    <label for="add-picture">Upload Picture:</label>
                    <input type="file" id="job-title" name="add_picture"><br>

                    <label for="job-role">Add Job Role:</label>
                    <input type="text" id="add-job-role" name="add_job_role"><br>

                    <label for="company-name">Company Name:</label>
                    <input type="text" id="add-company" name="add_company_name"><br>

                    <label for="timing">Add Timing:</label>
                    <input type="text" id="add-timing" name="add_interval"><br>

                    <label for="overall-timing">Add Total Experience:</label>
                    <input type="date" id="add-total-experience" name="add_timing"><br>

                    <label for="about">Add About:</label>
                    <input type="text" id="add-about" name="add_about"><br>
                    <!-- Add more form fields for other experience items here -->

                    <button type="submit">Save</button>

                </form>
            </div>
        </div>



        <!--edit experience--> 

        <div class="popup" id="edit--popup">
            <div class="popup-content">
                <span class="close-button" onclick="closeEditPopup()">&times;</span>
                <h2>Edit Experience</h2>
                <form id="edit-form" action="edit_experience.jsp" method="post" enctype="multipart/form-data">
                    <!-- Your form fields go here -->
                    <input type="hidden" name="id" id="exp_id" >
                    <label for="add-picture">Edit Picture:</label>
                    <input type="file" id="job-title" name="exp-photo" ><br>

                    <label for="job-role">Job Role:</label>
                    <input type="text" id="job-role" name="job-role" class="job-role" ><br>

                    <label for="company-name">Company Name:</label>
                    <input type="text" id="company" name="company-name"><br>

                    <label for="timing">Timing:</label>
                    <input type="text" id="timing" name="timing" ><br>

                    <label for="overall-timing">Total Experience:</label>
                    <input type="date" id="total-experience" name="total-experience"><br>

                    <label for="about">About:</label>
                    <input type="text" id="about" name="about"><br>
                    <button type="submit">Save</button>
                </form>
            </div>
        </div>





        <!--add education--> 

        <div id="edit_experience_popup" class="popup">
            <div class="popup-content">
                <span class="close" id="close_experience_button">&times;</span>
                <h2>Add Education</h2>

                <form action="add_education.jsp" method="post" id="update_experience_form" enctype="multipart/form-data">

                    <label for="add-picture">Upload College Picture:</label>
                    <input type="file" id="add_cllg_photo" name="add_cllg_photo"  ><br>

                    <label for="job-role">Add College Name:</label>
                    <input type="text" id="add_collg_name" name="add_cllg_name" ><br>

                    <label for="company-name">Add Course Name:</label>
                    <input type="text" id="add_course_name" name="add_course_name"><br>

                    <label for="timing">Add Starting Date:</label>
                    <input type="date" id="add_starting_date" name="add_starting_date" ><br>

                    <label for="overall-timing">Add Ending Date:</label>
                    <input type="date" id="add_ending_date" name="add_ending_date"><br>



                    <button type="submit">Save</button>

                </form>

            </div>
        </div>


        <!--edit education--> 

        <div class="popup" id="edit__popup">
            <div class="popup-content">
                <span class="close-button" onclick="closeEditPopupp()">&times;</span>
                <h2>Edit Education</h2>
                <form id="edit_form" action="edit_education.jsp" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" id="edu_id" >
                    <label for="add-picture">Upload College Picture:</label>
                    <input type="file" id="add_cllg_photo" name="add_cllg_photo"  ><br>

                    <label for="job-role">Add College Name:</label>
                    <input type="text" id="add_collg_name" name="add_cllg_name" ><br>

                    <label for="company-name">Add Course Name:</label>
                    <input type="text" id="add_course_name" name="add_course_name"><br>

                    <label for="timing">Add Starting Date:</label>
                    <input type="date" id="add_starting_date" name="add_starting_date" ><br>

                    <label for="overall-timing">Add Ending Date:</label>
                    <input type="date" id="add_ending_date" name="add_ending_date"><br>
                    <button type="submit">Save</button>
                </form>
            </div>
        </div>



        <!--add skill--> 

        <div id="add_skills" class="popup"> <!--edit_experience_popup -->
            <div class="popup-content">
                <span class="close" id="close_skills">&times;</span><!--close_experience_button -->
                <h2>Add Education</h2>

                <form action="add_skills.jsp" method="post" id="update_skills" > <!--update_experience_form -->
                    <input type="hidden" id="skill_id" name="skill_id">
                    <label for="add-skill">Add 1 skill:</label>
                    <input type="text" id="add_1_skill" name="add_1_skill"><br>

                    <label for="add-skill">Add 2 skill:</label>
                    <input type="text" id="add_2_skill" name="add_2_skill" ><br>

                    <label for="addd-skill">Add 3 skill:</label>
                    <input type="text" id="add_3_skill" name="add_3_skill" ><br>

                    <label for="add-skill">Add 4 skill:</label>
                    <input type="text" id="add_4_skill" name="add_4_skill" ><br>

                    <label for="add-skill">Add 5 skill:</label>
                    <input type="text" id="add_5_skill" name="add_5_skill" ><br>

                    <label for="add-skill">Add 6 skill:</label>
                    <input type="text" id="add_6_skill" name="add_6_skill" ><br>

                    <button type="submit">Save</button>
                </form>
            </div>
        </div>
        <!--add Language--> 

        <div id="add_language" class="popup"> <!--add_skills -->
            <div class="popup-content">
                <span class="close" id="close_language">&times;</span><!--close_skills -->
                <h2>Add Education</h2>
                <form action="add_language.jsp" method="post" id="update_language" > <!--update_skills -->
                    <input type="hidden" id="language_id" name="lanuage_id">
                    <label for="add-language">Add 1 Language:</label>
                    <input type="text" id="add_1_language" name="add_1_language"><br>

                    <label for="add-language">Add 2 Language:</label>
                    <input type="text" id="add_2_language" name="add_2_language" ><br>


                    <button type="submit">Save</button>
                </form>
            </div>
        </div>


        <script src="js/nav_toggle.js" type="text/javascript"></script>
        <script src="js/add_education_.js" type="text/javascript"></script>
        <script src="js/add_expp_.js" type="text/javascript"></script>
        <script src="js/update_Profile.js" type="text/javascript"></script>
        <script src="js/edit_education.js" type="text/javascript"></script>
        <script src="js/addLanguage.js" type="text/javascript"></script>
        <script src="js/add_skills.js" type="text/javascript"></script>
        <script src="js/edit_expe_.js" type="text/javascript"></script>
    </body>
</html>


