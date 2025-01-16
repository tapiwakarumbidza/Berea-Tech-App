<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #a2c2e0, #f4f4f4);
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 350px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            text-align: center;
        }
        h2 {
            color: #007BFF;
            margin-bottom: 20px;
            font-size: 2em;
        }
        input {
            width: calc(100% - 22px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: #FF4136; /* Red */
            font-size: 0.9em;
            margin: 10px 0;
            text-align: left;
        }
        .message {
            color: #007BFF; /* Blue */
            font-size: 1em;
            margin: 10px 0;
            text-align: left;
        }
        .container img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var passwordError = document.getElementById("passwordError");
            var confirmPasswordError = document.getElementById("confirmPasswordError");
            var strengthError = document.getElementById("strengthError");
            var isValid = true;

            // Clear previous error messages
            passwordError.textContent = "";
            confirmPasswordError.textContent = "";
            strengthError.textContent = "";

            // Check password length
            if (password.length < 6) {
                passwordError.textContent = "Password is too short. It must be at least 6 characters long.";
                isValid = false;
            }

            // Check if passwords match
            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match.";
                isValid = false;
            }

            // Check password strength
            var strength = 0;
            if (password.match(/[a-z]+/)) strength += 1;
            if (password.match(/[A-Z]+/)) strength += 1;
            if (password.match(/[0-9]+/)) strength += 1;
            if (password.match(/[\W_]+/)) strength += 1;

            if (strength < 2) {
                strengthError.textContent = "Password is weak. It should contain at least two of the following: lowercase letters, uppercase letters, numbers, special characters.";
                isValid = false;
            }

            return isValid;
        }
    </script>
</head>
<body>
    <div class="container">
        
        <img src="images/download.jpeg" alt=""/>
        <h2>Student Registration</h2>
        <form action="RegisterServlet" method="post" onsubmit="return validatePassword()">
            First Name: <input type="text" name="firstName" required><br>
            Last Name: <input type="text" name="lastName" required><br>
            Email: <input type="email" name="email" required><br>
            Password: <input type="password" id="password" name="password" required><br>
            <div id="passwordError" class="error"></div>
            Confirm Password: <input type="password" id="confirmPassword" name="confirmPassword" required><br>
            <div id="confirmPasswordError" class="error"></div>
            <div id="strengthError" class="error"></div>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
