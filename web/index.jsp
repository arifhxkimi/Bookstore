<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="page-container"> 
        <!-- Header Section -->
        <header>
            <h1>Online Bookstore</h1>
            <nav>
                <a href="index.jsp">Home</a>
                <a href="books.jsp">Books</a>
                <a href="cart.jsp">Cart</a>
                <a href="login.jsp">
                    <% 
                        // Check session for logged-in user
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

        <!-- Featured Books Section -->
        <section id="featured-books">
            <h2>Featured Books</h2>
            <div class="book-grid">
                <% 
                    // Example dynamic data for featured books
                    List books = new ArrayList();
                    Map book1 = new HashMap();
                    book1.put("id", "1");
                    book1.put("title", "The Great Gatsby");
                    book1.put("author", "F. Scott Fitzgerald");
                    book1.put("price", "$8.31");
                    book1.put("image", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg/634px-The_Great_Gatsby_Cover_1925_Retouched.jpg?20201214221805");
                    books.add(book1);

                    Map book2 = new HashMap();
                    book2.put("id", "2");
                    book2.put("title", "1984");
                    book2.put("author", "George Orwell");
                    book2.put("price", "$14.39");
                    book2.put("image", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT06JVQxvQtUTRwGCO3wuZUi8XO8vmecdWWMA&s");
                    books.add(book2);

                    // Display books dynamically
                    Iterator iterator = books.iterator();
                    while (iterator.hasNext()) {
                        Map book = (Map) iterator.next();
                %>
                <a href="book-detail.jsp?bookId=<%= book.get("id") %>">
                    <div class="book-card">
                        <img src="<%= book.get("image") %>" alt="Book Cover">
                        <h3><%= book.get("title") %></h3>
                        <p>by <%= book.get("author") %></p>
                        <p><%= book.get("price") %></p>
                        <button onclick="addToCart('<%= book.get("title") %>')">Add to Cart</button>
                    </div>
                </a>
                <% } %>
            </div>
        </section>

        <!-- Footer Section -->
        <footer>
            <p>&copy; 2024 Online Bookstore</p>
        </footer>
    </div>    
</body>
</html>
