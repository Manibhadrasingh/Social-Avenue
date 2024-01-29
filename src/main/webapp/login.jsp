<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
</head>
<body>

    <!-- Background Image with Blur Filter -->
    <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: -1;">
        <img src="images/lock2.png" alt="Background Image" style="width: 100%; height: 100%; filter: blur(5px);">
    </div>

    <div class="login-container">
        <form action="login_check.jsp" method="post">
            <div class="container">
                <label for="uname"><b>Email</b></label>
                <input type="email" placeholder="Enter Email" name="email" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
                
                <button type="submit">Login</button>
                <label>
                    <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>

            <div class="container">
                <a href="register.jsp"><button type="button" class="cancelbtn">Sign up</button></a>
                <span class="psw">Forgot <a href="#"  style="color:#f1f1f1">password?</a></span>
            </div>
        </form>
    </div>

</body>
</html>
