<%-- 
    Document   : book-detail
    Created on : Dec 19, 2024, 2:55:35 PM
    Author     : haziqfaruqi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Detail</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="page-container">
        <header>
            <h1>Book Details</h1>
            <nav>
                <a href="index.jsp">Home</a>
                <a href="books.jsp">Books</a>
                <a href="cart.jsp">Cart</a>
                <a href="login.jsp">
                    <% 
                        if (session.getAttribute("username") != null) {
                            out.print("Logout (" + session.getAttribute("username") + ")");
                        } else {
                            out.print("Login");
                        }
                    %>
                </a>
            </nav>
            <form action="search.jsp" method="get">
                <input type="text" placeholder="Search books..." name="query" id="search-bar">
                <button type="submit">Search</button>
            </form>
        </header>

        <section id="book-detail">
            <% 
                String bookId = request.getParameter("bookId");
                if (bookId == null || bookId.isEmpty()) {
                    out.println("<p>Invalid book ID.</p>");
                } else {
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        // Database connection
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/bookstore", "app", "app");

                        // Fetch book details
                        String query = "SELECT * FROM books WHERE book_id = ?";
                        stmt = conn.prepareStatement(query);
                        stmt.setInt(1, Integer.parseInt(bookId));
                        rs = stmt.executeQuery();

                        if (rs.next()) {
            %>
            <div class="book-info">
                <img src="<%= rs.getString("image_url") %>" alt="Book Cover" class="book-cover">
                <div class="book-details">
                    <h2><%= rs.getString("title") %></h2>
                    <p><strong>Author:</strong> <%= rs.getString("author") %></p>
                    <p><strong>Genre:</strong> <%= rs.getString("genre") %></p>
                    <p><strong>Price:</strong> $<%= rs.getBigDecimal("price") %></p>
                    <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                    <form action="addToCart.jsp" method="post">
                        <input type="hidden" name="bookId" value="<%= bookId %>">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
            <% 
                        } else {
                            out.println("<p>Book not found.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error fetching book details: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) {}
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                        if (conn != null) try { conn.close(); } catch (SQLException e) {}
                    }
                }
            %>
        </section>

        <footer>
            <p>&copy; 2024 Online Bookstore</p>
        </footer>
    </div>
</body>
</html>
