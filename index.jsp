
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="https://img.freepik.com/premium-vector/hand-drawn-flat-design-bookstore-logo-template_23-2149337113.jpg?semt=ais_hybrid" 
                 style="height: 10%; width: 10%;" alt="Bookstore logo" class="navbar-logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Register/Login</a>
                </li>
            </ul>
        </div>
        <form class="d-flex ms-auto" role="search" action="search.jsp" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search books..." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
    </div>
</nav>
    
    <div class="bg-light py-5 text-center">
        <div class="container">
            <h1 class="display-4">Welcome to BookStore</h1>
            <p class="lead">Discover your next favorite book from our extensive collection.</p>
            <a href="#categories" class="btn btn-primary btn-lg">Browse Categories</a>
        </div>
    </div>

    <!-- Categories Section -->
    <section id="categories" class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Book Categories</h2>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Fiction">
                        <div class="card-body">
                            <h5 class="card-title">Fiction</h5>
                            <p class="card-text">Explore our wide selection of fictional masterpieces.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Non-Fiction">
                        <div class="card-body">
                            <h5 class="card-title">Non-Fiction</h5>
                            <p class="card-text">Dive into the world of real-life stories and facts.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Children">
                        <div class="card-body">
                            <h5 class="card-title">Children</h5>
                            <p class="card-text">Find delightful books for young readers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Best Sellers Section -->
    <section id="bestsellers" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4">Best Sellers</h2>
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/200" class="card-img-top" alt="Book 1">
                        <div class="card-body">
                            <h5 class="card-title">Book Title 1</h5>
                            <p class="card-text">Author Name</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/200" class="card-img-top" alt="Book 2">
                        <div class="card-body">
                            <h5 class="card-title">Book Title 2</h5>
                            <p class="card-text">Author Name</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/200" class="card-img-top" alt="Book 3">
                        <div class="card-body">
                            <h5 class="card-title">Book Title 3</h5>
                            <p class="card-text">Author Name</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card h-100">
                        <img src="https://via.placeholder.com/200" class="card-img-top" alt="Book 4">
                        <div class="card-body">
                            <h5 class="card-title">Book Title 4</h5>
                            <p class="card-text">Author Name</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="bg-dark text-light py-3">
    <div class="container text-center">
        <p>&copy; 2024 Online Bookstore. All rights reserved.</p>
    </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
