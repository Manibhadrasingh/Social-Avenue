
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In</title>
        <link href="css/userRegistration.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
 <img src="images/back.jpg" alt="Background Image" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; filter: blur(5px);">

        <div class="container">
            <div class="left-panel">
                <!--<img src="images/google.svg" alt="Logo">-->
                <h1>Welcome back</h1>
                <p>Don't miss your next opportunity. Sign up to stay updated on your professional world.</p>
            </div>
            <div class="right-panel">

                <h2>Sign up</h2>
                <form action="register_data.jsp" method="post">
                    <input type="text" placeholder="Name"  name="name" required>
                    <input type="email" placeholder="Email"name="email" required>
                    <input type="password" placeholder="Password" name="password" required>
                    <input type="tel" placeholder="Phone"  name="mobile" required>
                    <input type="date" placeholder="DOB"   name="dob" required>
                    <div class="input-group form-group" >
                        <select name="gender" class="form-control" style="color: gray" required>
                            <option value="" disabled selected>Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <input type="text" placeholder="City" name="city" required>
                    <input type="text" placeholder="State" name="state" required>
                    <input type="text" placeholder="Address" name="address" required>
                    <input type="text" placeholder="Bio" name="bio" required>
                    <span class="forget">Forgot password?</span>
                    <button type="submit">Sign up</button>
                    <div>
                        <ul>
                            <li class="line1"></li>
                            <li class="or">OR</li>
                            <li class="line1"></li>
                        </ul>
                    </div>
                    <button type="button" class="google"> <img src="images/google.svg" alt="Google Logo" class="g-img" /><span> Continue with Google</span></button>
                    <p class="member">Not a member? <a href="#">Join now</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
