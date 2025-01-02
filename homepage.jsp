<%-- 
    Document   : homepage
    Created on : Dec 26, 2024, 12:25:02 AM
    Author     : iman
--%>

<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage - Online Bookstore</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="styles.css" rel="stylesheet">
</head>
<body>
    
    <%@ include file="header.jsp" %>

    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Sidebar for Categories -->
            <div class="col-md-3 col-lg-2">
                <div class="list-group">
                    <h5 class="mb-3">Book Categories</h5>
                    <a href="#" class="list-group-item list-group-item-action">Fiction</a>
                    <a href="#" class="list-group-item list-group-item-action">Non-Fiction</a>
                    <a href="#" class="list-group-item list-group-item-action">Children</a>
                    <a href="#" class="list-group-item list-group-item-action">Science</a>
                    <a href="#" class="list-group-item list-group-item-action">Mystery</a>
                </div>
            </div>

            <!-- Main Content - Books -->
            <div class="col-md-9 col-lg-10">
                <div class="row">
                    <c:forEach var="book" items="${books}">
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <img src="${book.image}" class="card-img-top" alt="${book.title}">
                                <div class="card-body">
                                    <h5 class="card-title">${book.title}</h5>
                                    <p class="card-text">Price: RM ${book.price}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <!-- Quantity controls (Plus and Minus) -->
                                        <div class="input-group" style="width: 100px;">
                                            <button class="btn btn-outline-secondary" type="button" onclick="updateQuantity('${book.id}', -1)">-</button>
                                            <input type="number" class="form-control text-center" id="quantity-${book.id}" value="1" min="1">
                                            <button class="btn btn-outline-secondary" type="button" onclick="updateQuantity('${book.id}', 1)">+</button>
                                        </div>
                                        <!-- Add to Cart Button -->
                                        <button class="btn btn-primary" onclick="addToCart('${book.id}')">Add to Cart</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Quantity Control and Add to Cart -->
    <script>
        function updateQuantity(bookId, change) {
            var quantityInput = document.getElementById('quantity-' + bookId);
            var currentQuantity = parseInt(quantityInput.value);
            currentQuantity += change;
            if (currentQuantity < 1) currentQuantity = 1; // Prevent negative quantities
            quantityInput.value = currentQuantity;
        }

        function addToCart(bookId) {
            var quantity = document.getElementById('quantity-' + bookId).value;
            alert('Added ' + quantity + ' of Book ID: ' + bookId + ' to your cart!');
            // You can send an AJAX request here to add to the cart or update session/cart data
        }
    </script>
    
    <%@ include file="footer.jsp" %>
</body>
</html>

