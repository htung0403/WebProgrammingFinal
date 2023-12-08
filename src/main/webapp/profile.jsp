<%@ page import="entity.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
    <link href="css/profile.css" rel="stylesheet">
</head>
<body background="Lets/quan.jpg">
<%
    // Check if the user is logged in
    HttpSession currentSession = request.getSession(false);
    Customer user = (currentSession != null) ? (Customer) currentSession.getAttribute("user") : null;
%>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    <a href="index.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <img src="Lets/logo1-2.png" alt="Logo của Let's Cafe" width="80" height="70" class="m-0">        </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="index.jsp" class="nav-item nav-link active">Trang chủ</a>
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
            <a href="cart.jsp" class="nav-item nav-link">Giỏ hàng</a>
        </div>
        <% if (user == null) { %>
        <!-- Display login button if user is not logged in -->
        <a href="login.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">ĐĂNG NHẬP<i class="fa fa-arrow-right ms-3"></i></a>
        <% } else { %>
        <!-- Display a different button or text if user is logged in -->
        <a href="profile.jsp" class="btn btn-success py-4 px-lg-5 d-none d-lg-block">Welcome, <%= user.getName() %>!</a>
        <% } %>
    </div>
</nav>
<!-- Navbar End -->

<div class="card columns mx-auto">

    <div class="button-container">
        <img src="Lets/roast.jpg" class="avatar-container" style="width: 100px; height: 100px" alt="">

<!--        <p class="offer">JOB OFFER</p>-->
    </div>
    <% if (user != null) { %>
        <p class="secondary-heading" id="profileForm">
            Tên: <span id="name"><%= user.getName() %></span><br>
            Tên đăng nhập: <span id="username"><%= user.getEmail() %></span><br>
            SĐT: <span id="telNumber"><%= user.getTelNumber() %></span><br>
            Địa chỉ: <span id="address"><%= user.getAddress() %></span>
        </p>
    <button class="btn1 red-flag" id="editBtn" onclick="editInfo()">Sửa Thông tin</button>
    <!-- Edit User Info Form -->
    <form id="editForm" action="UpdateProfileServlet" method="POST" style="display: none;">
        <label for="nameInput">Tên: </label><input type="text" id="nameInput" name="name"><br>
        Tên đăng nhập: <span id="username1"><%= user.getEmail() %></span><br>
        <label for="telNumberInput">SĐT: </label><input type="text" id="telNumberInput" name="telNumber"><br>
        <label for="addressInput">Địa chỉ: </label><input type="text" id="addressInput" name="address"><br>
        <button class="btn1 red-flag" id="submitBtn" type="submit">Xác nhận</button>
    </form>
    <% } %>
    <script>
        function editInfo() {
            var fields = ["name", "telNumber", "address"];
            fields.forEach(function(field) {
                var span = document.getElementById(field);
                var input = document.getElementById(field + "Input");
                input.value = span.textContent;
            });
            document.getElementById("editBtn").style.display = "none";
            document.getElementById("profileForm").style.display ="none";
            document.getElementById("editForm").style.display = "block";
        }
    </script>
    <div class="container1">
        <a href="logout" class="animated-button" style="width: fit-content;height: 50px">
            <!-- Các phần tử SVG và span ở đây -->
            <svg viewBox="0 0 24 24" class="arr-2" xmlns="http://www.w3.org/2000/svg">
                <path d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"></path>
            </svg>
            <span class="text">Đăng xuất</span>
            <span class="circle"></span>
            <svg viewBox="0 0 24 24" class="arr-1" xmlns="http://www.w3.org/2000/svg">
                <path d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"></path>
            </svg>
        </a>
    </div>
</div>
<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
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