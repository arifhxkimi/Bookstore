<%-- 
    Document   : books
    Created on : Dec 19, 2024, 2:59:17 PM
    Author     : haziqfaruqi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books - Online Bookstore</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="page-container">
    <!-- Header Section -->
    <header>
        <h1>Online Bookstore</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="books.jsp" class="active">Books</a>
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

    <section id="books-section">
        <h2>Our Collection</h2>
        
        <!-- Filter by Category -->
        <div id="filter-container">
            <label for="category-filter">Filter by Category:</label>
            <select id="category-filter" onchange="filterBooks()">
                <option value="all">All</option>
                <option value="fiction">Fiction</option>
                <option value="non-fiction">Non-Fiction</option>
                <option value="young-adult">Young Adult</option>
                <option value="children">Children's Books</option>
                <option value="academic">Academic</option>
                <option value="religion">Religion & Spirituality</option>
                <option value="hobbies">Hobbies & Crafts</option>
                <option value="others">Others</option>
            </select>
        </div>

        <div class="book-grid">
            <% 
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    // Database connection
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/bookstore", "app", "app");

                    // Fetch books from database
                    String query = "SELECT * FROM books";
                    stmt = conn.prepareStatement(query);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
            %>
            <div class="book-card">
                <img src="<%= rs.getString("image_url") %>" alt="Book Cover">
                <h3><%= rs.getString("title") %></h3>
                <p>by <%= rs.getString("author") %></p>
                <p>$<%= rs.getBigDecimal("price") %></p>
                <form action="addToCart.jsp" method="post">
                    <input type="hidden" name="bookId" value="<%= rs.getInt("book_id") %>">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
            <% 
                    }
                } catch (Exception e) {
                    out.println("<p>Error loading books: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            %>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Online Bookstore</p>
    </footer>
    </div>
</body>
<script>
    function filterBooks() {
        const filter = document.getElementById('category-filter').value;
        window.location.href = `books.jsp?category=${filter}`;
    }
</script>
</html>

