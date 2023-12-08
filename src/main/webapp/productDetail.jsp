<%@ page import="entity.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="entity.Product" %>
<%@ page import="controller.ProductServlet" %>
<%@ page import="database.ProductDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Let's Cafe - Vị cà phê quốc dân</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="Lets/logo1-2.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/product-details.css" rel="stylesheet">
</head>
<body>
<%
    // Check if the user is logged in
    HttpSession currentSession = request.getSession(false);
    Customer user = (currentSession != null) ? (Customer) currentSession.getAttribute("user") : null;
    String productIdStr = (currentSession != null) ? (String) currentSession.getAttribute("productId") : null;
    Integer productId = null;
    if (productIdStr != null) {
        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            // Handle the situation where productIdStr cannot be parsed to an integer
        }
    }
    Product product = null;
    if (productId != null) {
        product = ProductDB.getProductById(productId);
    }
%>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    <a href="index.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <img src="Lets/logo1-2.png" alt="Logo của Let's Cafe" width="80" height="70" class="m-0">        </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="index.jsp" class="nav-item nav-link">Trang chủ</a>
            <a href="about.jsp" class="nav-item nav-link">Về chúng tôi </a>
            <a href="hethongcuahang.jsp" class="nav-item nav-link">Hệ thống cửa hàng</a>
            <a href="cauchuyenthuonghieu.jsp" class="nav-item nav-link">Câu chuyện thương hiệu </a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Sản phẩm</a>
                <div class="dropdown-menu fade-up m-0">
                    <a href="cungcapcaphe.jsp" class="dropdown-item">Cung cấp cà phê</a>
                    <a href="nhuongquyen.jsp" class="dropdown-item">Nhượng quyền</a>
                    <a href="sanphambanle.jsp" class="dropdown-item">Sản phẩm bán lẻ</a>
                    <a href="khoahoc.jsp" class="dropdown-item">Đào tạo</a>
                </div>
            </div>
            <a href="cart.jsp" class="nav-item nav-link active">Giỏ hàng</a>
        </div>
            <% if (user == null) { %>
        <!-- Display login button if user is not logged in -->
        <a href="login.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">ĐĂNG NHẬP<i class="fa fa-arrow-right ms-3"></i></a>
            <% } else { %>
        <!-- Display a different button or text if user is logged in -->
        <a href="profile.jsp" class="btn btn-success py-4 px-lg-5 d-none d-lg-block">Welcome, <%= user.getName() %>!</a>
        <% } %>
</nav>
<!-- Navbar End -->
    <div class="main-container">
        <div class="product-detail-container">
            <div class="product-detail-title">
                <h3><%= product.getProductName()%></h3>
            </div>
            <div class="product-detail-content">
                <div class="product-img-area">
                    <img src="<%= product.getImgUrl()%>">
                </div>
                <div class="product-detail-area">
                    <div class="product-description">
                        <h3>Description</h3>
                        <div class="price-detail">
                            <h4><%= product.getPrice()%> VNĐ</h4>
                        </div>
                        <span><%= product.getDescription()%></span>
                    </div>
                    <form action="cart" method="post">
                        <input type="hidden" name="productId" value="<%= product.getId() %>">
                        <input type="hidden" name="quantity" value="1">
                        <div class="access-product-button">
                            <button type="submit">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Add to cart</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer pt-5 wow fadeIn" data-wow-delay="0.1s" style="margin-top: 6rem;">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-6 col-md-6">
                <h4 class="text-light mb-4">Address</h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>1 ,Lê Duẩn Street,Thành phố HCM, Việt Nam</p>
                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+84 908842985</p>
                <p class="mb-2"><i class="fa fa-envelope me-3"></i>Letscafe@gmail.com</p>
                <div class="d-flex pt-2">
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/profile.php?id=61552846468722&mibextid=9R9pXO"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <div class="col-lg-6 col-md-6">
                <h4 class="text-light mb-4">Quick Links</h4>
                <a class="btn btn-link" href="about.html">Về chúng tôi</a>
                <a class="btn btn-link" href="sanphambanle.html">Sản phẩm bán lẻ</a>
                <a class="btn btn-link" href="khoahoc.html">khóa học</a>
                <a class="btn btn-link" href="nhuongquyen.html">Nhượng quyền</a>
                <a class="btn btn-link" href="cungcapcaphe.html">Cung cấp cà phê</a>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->
</body>
</html>
