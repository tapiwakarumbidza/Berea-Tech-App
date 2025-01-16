<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            background-color: #007BFF; /* Blue background */
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }
        .banner {
            background-color: #0056b3; /* Darker blue for banner */
            color: white;
            text-align: center;
            padding: 1em;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        .banner img {
            width: 100%;
            height: auto;
            max-height: 150px; /* Adjust the banner height */
            object-fit: cover;
            border-bottom: 2px solid #0056b3;
        }
        .container {
            margin: 2em auto;
            padding: 20px;
            max-width: 800px;
            background-color: #ffffff; /* White background for content area */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .links a {
            color: #007BFF;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.2em;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .logout-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #FF4136; /* Red for logout button */
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.1em;
        }
        .logout-button:hover {
            background-color: #e03a2b; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <div class="banner">
        <!-- Banner Image -->
      
       
        <img src="images/download.png" alt=""/>
        
        <!-- Welcome Message -->
        <h1>Welcome ${sessionScope.firstName} ${sessionScope.lastName}!</h1>
    </div>
    <div class="container">
        <div class="links">
            <a href="#">Student Results</a>
            <a href="#">Moodle</a>
            <a href="#">Berea News</a>
            <a href="#">Lecture Timetable</a>
            <a href="#">Student Information</a>
        </div>
        <a href="LogoutServlet" class="logout-button">Logout</a>
    </div>
</body>
</html>
