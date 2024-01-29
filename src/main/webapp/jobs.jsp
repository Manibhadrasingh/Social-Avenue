<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Portal</title>
<link href="css/jobs.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <%@include file="navbar.jsp"%>
<div class="job-box">
  <div class="job-section">
    <h2 class="job-title">Suggested Job Search</h2>
    <div class="profile-description">
        <a href="" class="skills-btn"><img src="images/search.svg"> Software Engineer</a>
        <a href="" class="skills-btn"><img src="images/search.svg">Senior Software Engineer</a>
        <a href="" class="skills-btn"><img src="images/search.svg"> Software Engineer Team Lead</a>
        <a href="" class="skills-btn"><img src="images/search.svg"> Junior Software Engineer</a>
        <a href="" class="skills-btn"><img src="images/search.svg"> Software Engineer Technical Lead</a>
        <a href="" class="skills-btn"><img src="images/search.svg"> Senior Software Engineer Team Lead</a>
      </div>
      
  </div>

  <h2>Recommended for you</h2>
  <p>Based on your profile and search history</p>

  <!-- first job suggestion -->

  <div class="job-section">
    <ul class="job-list">
      <div class="job-card">
        <img class="logo" src="images/google.svg" alt="IBM Logo">
        <div class="job-details">
          <div class="job-title">Data Analytics</div>
          <div class="company">Google</div>
          <div class="location">California, USA, USA (On-site)</div>
          <button class="action-button">Save Data Analytics at Google</button>
          <div class="status">Actively recruiting</div>
          <div class="status">3 days ago</div>
        </div>
    </div>
    <div class="job-card">
      <img class="logo" src="images/amazon.png" alt="IBM Logo">
      <div class="job-details">
        <div class="job-title">Full Stack Developer</div>
        <div class="company">Amazon</div>
        <div class="location">Pune Central, Maharashtra, India (On-site)</div>
        <button class="action-button">Save Full Stack Developer at Amazon</button>
        <div class="status">Actively recruiting</div>
        <div class="status">1 month ago</div>
      </div>
  </div>
  <div class="job-card">
    <img class="logo" src="images/netflix.png" alt="IBM Logo">
    <div class="job-details">
      <div class="job-title">Web Designer</div>
      <div class="company">Netflix</div>
      <div class="location">Banglore, Karantka, India (Remote)</div>
      <button class="action-button">Save Data Analytics at Google</button>
      <div class="status">Actively recruiting</div>
      <div class="status">20 days ago</div>
    </div>
</div>
<div class="job-card">
  <img class="logo" src="images/microsoft.png" alt="IBM Logo">
  <div class="job-details">
    <div class="job-title">Java Developer</div>
    <div class="company">Microsoft</div>
    <div class="location">Noida, Uttar Pradesh, India (On-site)</div>
    <button class="action-button">Save Java Developer at Microsoft</button>
    <div class="status">Actively recruiting</div>
    <div class="status">7 days ago</div>
  </div>
</div>
    </ul>
  </div>
<hr>
<br>
<!-- Hiring page -->


<h2>Hiring in your network</h2>
<p>Explore relevant jobs in your network</p>
  <div class="job-section">
    <ul class="job-list">
      <div class="job-card">
        <img class="logo" src="images/google.svg" alt="IBM Logo">
        <div class="job-details">
          <div class="job-title">Data Analytics</div>
          <div class="company">google</div>
          <div class="location">California, USA, USA (On-site)</div>
          <button class="action-button">Save Data Analytics at Google</button>

          <!-- updated code -->

         <ul class="mutual">
          <li><img src="images/profile.jpg" ></li>
          <li>1 mutual connection with the hiring team</li>
         </ul>


          <div class="status">1 month ago</div>
        </div>
    </div>
    <div class="job-card">
      <img class="logo" src="images/amazon.png" alt="IBM Logo">
      <div class="job-details">
        <div class="job-title">Product Manager</div>
        <div class="company">Amazon</div>
        <div class="location">New Delhi, New Delhi, India (Remote)</div>
        <button class="action-button">Save Data Analytics at Google</button>
          <!-- updated code -->

          <ul class="mutual">
            <li><img src="images/profile.jpg" ></li>
            <li>1 mutual connection with the hiring team</li>
           </ul>
        <div class="status">1 month ago</div>
      </div>
  </div>
  <div class="job-card">
    <img class="logo" src="images/microsoft.png" alt="IBM Logo">
    <div class="job-details">
      <div class="job-title">Prompt Engineer</div>
      <div class="company">Microsoft</div>
      <div class="location">Jaipur, Rajashthan, India (On-site)</div>
      <button class="action-button">Save Data Analytics at Google</button>
        <!-- updated code -->

        <ul class="mutual">
          <li><img src="images/profile.jpg" ></li>
          <li>1 mutual connection with the hiring team</li>
         </ul>
      <div class="status">1 month ago</div>
    </div>
</div>
<div class="job-card">
  <img class="logo" src="images/netflix.png" alt="IBM Logo">
  <div class="job-details">
    <div class="job-title">ABM Manager</div>
    <div class="company">Netflix</div>
    <div class="location">Lucknow, Uttar Pradesh, India (On-site)</div>
    <button class="action-button">Save ABM at Netflix</button>
      <!-- updated code -->

      <ul class="mutual">
        <li><img src="images/profile.jpg" ></li>
        <li>1 mutual connection with the hiring team</li>
       </ul>
    <div class="status">28 hours ago</div>
  </div>
</div>
    </ul>
  </div>
<hr>
<br>

<!-- More jobs for yoy  -->


  <h2>More jobs for you</h2>
<p>Based on your profile and search history</p>
  <div class="job-section">
    <ul class="job-list">
      <div class="job-card">
        <img class="logo" src="images/flipkart.png" alt="IBM Logo">
        <div class="job-details">
          <div class="job-title">Software Development Engineer</div>
          <div class="company">Flipkart</div>
          <div class="location">Noida, Uttar Pradesh, India (Remote)</div>
          <button class="action-button">Save Software Development Engineer at Flipkart</button>
            <!-- updated code -->
      
            <ul class="mutual">
              <li><img src="images/profile.jpg" ></li>
              <li>1 mutual connection with the hiring team</li>
             </ul>
          <div class="status">3 days ago</div>
        </div>
      </div>
      <div class="job-card">
        <img class="logo" src="images/adobe.png" alt="adobe Logo">
        <div class="job-details">
          <div class="job-title">Python Developrs | MySQL (WFH)</div>
          <div class="company">Adobe</div>
          <div class="location"> India (Remote)</div>
          <button class="action-button">Save Python Developrs | MySQL (WFH) at Adobe</button>
            <!-- updated code -->
      
            <ul class="mutual">
              <li><img src="images/profile.jpg" ></li>
              <li>1 mutual connection with the hiring team</li>
             </ul>
          <div class="status">6 days ago</div>
        </div>
      </div>
      <div class="job-card">
        <img class="logo" src="images/netflix.png" alt="IBM Logo">
        <div class="job-details">
          <div class="job-title">Java Springboot Lead</div>
          <div class="company">Infosys</div>
          <div class="location">Crossover</div>
          <button class="action-button">Save Java Springboot Lead at Infosys</button>
            <!-- updated code -->
      
            <ul class="mutual">
              <li><img src="images/profile.jpg" ></li>
              <li>1 mutual connection with the hiring team</li>
             </ul>
          <div class="status">28 hours ago</div>
        </div>
      </div>
      <div class="job-card">
        <img class="logo" src="images/netflix.png" alt="IBM Logo">
        <div class="job-details">
          <div class="job-title">JAVA Developer || 4 Years || Banglore</div>
          <div class="company">Netflix</div>
          <div class="location">Bengaluru, Karnataka, India (On-site)</div>
          <button class="action-button">Save JAVA Developer at Netflix</button>
            <!-- updated code -->
      
            <ul class="mutual">
              <li><img src="images/profile.jpg" ></li>
              <li>1 mutual connection with the hiring team</li>
             </ul>
          <div class="status">28 hours ago</div>
        </div>
      </div>
    </ul>
    <hr>
  </div>
</div>
</body>
</html>
