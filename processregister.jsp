<%-- 
    Document   : processregister
    Created on : Dec 26, 2024, 12:05:25 AM
    Author     : iman
--%>

<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String confirmPassword = request.getParameter("confirmPassword");

    // Check if passwords match
    if (!password.equals(confirmPassword)) {
        out.println("<script>alert('Passwords do not match!');</script>");
        response.sendRedirect("register.jsp");
        return;
    }

    // Database connection details
    String dbURL = "jdbc:derby://localhost:1527/bookstore";
    String dbUser = "app"; // Replace with your database username
    String dbPass = "app"; // Replace with your database password

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Get the current date and time for CREATED_AT field
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createdAt = sdf.format(new java.util.Date());

        // SQL Insert query
        String sql = "INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, CREATED_AT) VALUES (?, ?, ?, ?)";

        // Create PreparedStatement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        pstmt.setString(4, createdAt);

        // Execute update
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<script>alert('Registration successful!');</script>");
            response.sendRedirect("login.jsp");
        } else {
            out.println("<script>alert('Registration failed. Try again.');</script>");
            response.sendRedirect("register.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        response.sendRedirect("register.jsp");
    } finally {
        // Close resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

