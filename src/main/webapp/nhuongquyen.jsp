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
</head>

<body>
<%
    // Check if the user is logged in
    HttpSession currentSession = request.getSession(false);
    Customer user = (currentSession != null) ? (Customer) currentSession.getAttribute("user") : null;
%>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->



    <!-- Navbar Start -->
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
                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Sản phẩm</a>
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
                <% } %>    </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Nhượng quyền</h1>
<!--            <nav aria-label="breadcrumb animated slideInDown">-->
<!--                <ol class="breadcrumb">-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>-->
<!--                    <li class="breadcrumb-item text-white active" aria-current="page">Free Quote</li>-->
<!--                </ol>-->
<!--            </nav>-->
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Quote Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 ps-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="Lets/logo_let.jpg" style="object-fit: cover;" alt="">
                    </div>
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">Thông tin cá nhân</h1>
                        </div>
                        <p class="mb-4 pb-2">Xin mời bạn để lại thông tin cá nhân. Chúng tôi sẽ liên lạc để hỗ trợ bạn trong thời gian sớm nhất . Cảm ơn bạn! </p>
                        <form>
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="Tên" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="email" class="form-control border-0" placeholder="Email" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="SĐT" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="Địa chỉ" style="height: 55px;">
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0" placeholder="Yêu cầu"></textarea>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">Gửi</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote End -->
        

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
                    <a class="btn btn-link" href="about.jsp">Về chúng tôi</a>
                    <a class="btn btn-link" href="sanphambanle.jsp">Sản phẩm bán lẻ</a>
                    <a class="btn btn-link" href="khoahoc.jsp">khóa học</a>
                    <a class="btn btn-link" href="nhuongquyen.html">Nhượng quyền</a>
                    <a class="btn btn-link" href="cungcapcaphe.jsp">Cung cấp cà phê</a>
                </div>

            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>