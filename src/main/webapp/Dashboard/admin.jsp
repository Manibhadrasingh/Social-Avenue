

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <title>LinkedIn Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <link href="../admin_css/admin.css" rel="stylesheet" type="text/css"/>
        <script>
            const sidebar = document.querySelector('.sidebar');
            const mainContent = document.querySelector('.main-content');

            // Toggle sidebar on click
            document.addEventListener('click', (e) => {
                if (e.target.classList.contains('dashboard-links')) {
                    sidebar.classList.toggle('active');
                    mainContent.classList.toggle('active');
                }
            });

        </script>
    </head>
    <body>
        <div class="sidebar">
            <div class="admin-icon">
                <img src="../images/software-engineer.png" alt=""/>
            </div>
            <ul class="dashboard-links">
                <li><a href="#"><i class="fas fa-home"></i>Dashboard</a></li>
                <li><a href="#"><i class="fas fa-briefcase"></i>Admin</a></li>
                <li><a href="#"><i class="fas fa-user-friends"></i> Jobs</a></li>
                <li><a href="#"><i class="fas fa-comment"></i> Networking</a></li>
                <li><a href="#"><i class="fas fa-bell"></i> Recruiter</a></li>
                <li><a href="#"><i class="fas fa-bell"></i> Settings</a></li>
                <li><a href="#"><i class="fas fa-bell"></i> Help and Supports</a></li>
                <li><a href="#"><i class="fas fa-bell"></i> Feedback</a></li>
                <li><a href="#"><i class="fas fa-bell"></i> Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <h1>Welcome to Your Dashboard</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sit amet felis eu purus blandit laoreet.</p>
        </div>
        <script src="script.js"></script>
    </body>
</html>
