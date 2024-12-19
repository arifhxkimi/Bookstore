<%-- 
    Document   : signup
    Created on : Dec 19, 2024, 2:27:54 PM
    Author     : haziqfaruqi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Online Bookstore</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="signup-page">
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form action="SignupServlet" method="POST">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="confirm-password" required>
            <button type="submit">Create Account</button>
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </form>
    </div>
</body>
</html>

