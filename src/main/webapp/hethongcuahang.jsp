<%@ page import="entity.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">


<head>
        <meta charset="utf-8">
        <title>Danh sách cửa hàng - Let's Coffee</title>
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
        <link href="css/shopList.css" rel="stylesheet"/>

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
                <a href="about.jsp" class="nav-item nav-link">Về chúng tôi</a>
                <a href="hethongcuahang.jsp" class="nav-item nav-link active">Hệ thống cửa hàng</a>
                <a href="cauchuyenthuonghieu.jsp" class="nav-item nav-link">Câu chuyện thương hiệu</a>
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
                <% } %>    </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Hệ thống cửa hàng</h1>
            <nav aria-label="breadcrumb animated slideInDown">
<!--                <ol class="breadcrumb">-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>-->
<!--                    <li class="breadcrumb-item text-white active" aria-current="page">Service</li>-->
<!--                </ol>-->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- image slider -->
  <div class="container">
   <div class ="row g-4">
     <figure class="col-lg-4 col-md-4 container ">
        <div class="mc-sl__item" data-province="ho-chi-minh" data-number="028-6678-7648" data-address="so-75a-duong-3-2-phuong-11-quan-10">
            <img src="Lets/let_hanoi.jpg" alt=""/>

        </div>
        <a class="button" href="https://www.google.com/maps/place/Lets+Cafe/@21.0092924,105.8310034,17z/data=!3m1!4b1!4m6!3m5!1s0x3135ab8cdf872579:0x8a97fe1b7fa63a74!8m2!3d21.0092874!4d105.8335783!16s%2Fg%2F11pghppmxb?entry=ttu" target="_blank" role="button">Xem tren MAP</a>

        <div class="mc-sl__name">Let's Cafe Hà Nội</div>
        <div class="mc-sl__address">
                <span class="mc-sl__icon">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z"></path>-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>-->
                    <!--                  </svg>-->
                </span>
                <span>
                101-B4 ngõ 46C Phạm Ngọc Thạch, Hà Nội, Việt Nam
                </span>

        </div>
        <div class="mc-sl__phone">
                <span class="mc-sl__icon ">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z"></path>-->
                    <!--                  </svg>-->
                </span>
            <span>084 577 8383</span>
        </div>

        <div class="mc-sl__opening">Thứ 2 đến Chủ Nhật: 09:00 - 22:00</div>
<!--        <img src="Lets/let_hanoi.jpg" alt=""/>-->
<!--        <figcaption>-->
<!--            <h3>Let's Cafe Hà Nội</h3>-->
<!--            <p></p>-->
<!--            <a href="#" class="move" target="_blank">Xem tren MAP</a>-->
<!--        </figcaption>-->
<!--        <h4 style="color: white; margin-top: 10px" >Let's Cafe Hà Nội </h4>-->
<!--        <h4 style="color: white; margin-top: 10px" >101-B4 ngõ 46C Phạm Ngọc Thạch (khu Tập thể Trung Tự), Hà Nội, Việt Nam, Hanoi, Vietnam, 11500 </h4>-->
      </figure>

      <figure class="col-lg-4 col-md-4 container ">
        <div class="mc-sl__item" >
            <img src="Lets/Let_leduan1.jpg" alt=""/>

        </div>
        <a class="button" href="https://www.google.com/maps/place/Let%E2%80%99s+Caf%C3%A9+-+01+L%C3%AA+Du%E1%BA%A9n/@10.7865527,106.7023231,17z/data=!3m1!4b1!4m6!3m5!1s0x31752f4700e096cf:0x738779fe2ccc2b26!8m2!3d10.7865474!4d106.704898!16s%2Fg%2F11sv5gtwk1?entry=ttu" target="_blank" role="button">Xem tren MAP</a>

        <div class="mc-sl__name">Let's Cafe Perimeum Lê Duẩn</div>
        <div class="mc-sl__address">
                <span class="mc-sl__icon">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z"></path>-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>-->
                    <!--                  </svg>-->
                </span>
            <span>
               01 Lê Duẩn, Ho Chi Minh City, Vietnam
            </span>

        </div>
        <div class="mc-sl__phone">
                <span class="mc-sl__icon ">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z"></path>-->
                    <!--                  </svg>-->
                </span>
            <span>088 686 81 88</span>
        </div>

        <div class="mc-sl__opening">Thứ 2 đến Chủ Nhật: 06:30 - 21:00</div>
        <!--        <img src="Lets/let_hanoi.jpg" alt=""/>-->
        <!--        <figcaption>-->
        <!--            <h3>Let's Cafe Hà Nội</h3>-->
        <!--            <p></p>-->
        <!--            <a href="#" class="move" target="_blank">Xem tren MAP</a>-->
        <!--        </figcaption>-->
        <!--        <h4 style="color: white; margin-top: 10px" >Let's Cafe Hà Nội </h4>-->
        <!--        <h4 style="color: white; margin-top: 10px" >101-B4 ngõ 46C Phạm Ngọc Thạch (khu Tập thể Trung Tự), Hà Nội, Việt Nam, Hanoi, Vietnam, 11500 </h4>-->
      </figure>

      <figure class=" col-lg-4 col-md-4 container ">
        <div class="mc-sl__item" data-province="ho-chi-minh" data-number="028-6678-7648" data-address="so-75a-duong-3-2-phuong-11-quan-10">
            <img src="Lets/workshop.jpg" alt=""/>

        </div>
        <a class="button" href="https://www.google.com/maps/place/Lets+Cafe/@10.9435627,106.824335,17z/data=!3m1!4b1!4m6!3m5!1s0x3174df334cddb929:0xc6661e00878dc4b2!8m2!3d10.9435574!4d106.8269099!16s%2Fg%2F11h8bn25lc?entry=ttu" target="_blank" role="button">Xem tren MAP</a>

        <div class="mc-sl__name">Let's Cafe Workshop Biên Hòa </div>
        <div class="mc-sl__address">
                <span class="mc-sl__icon">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z"></path>-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>-->
                    <!--                  </svg>-->
                </span>
            <span>
                Đường N1, p. Thống Nhất, Biên Hòa, Đồng Nai, Vietnam
                </span>

        </div>
        <div class="mc-sl__phone">
                <span class="mc-sl__icon ">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z"></path>-->
                    <!--                  </svg>-->
                </span>
            <span>090 648 42 40</span>
        </div>

        <div class="mc-sl__opening">Thứ 2 đến Chủ Nhật: 06:30 - 22:30</div>
        <!--        <img src="Lets/let_hanoi.jpg" alt=""/>-->
        <!--        <figcaption>-->
        <!--            <h3>Let's Cafe Hà Nội</h3>-->
        <!--            <p></p>-->
        <!--            <a href="#" class="move" target="_blank">Xem tren MAP</a>-->
        <!--        </figcaption>-->
        <!--        <h4 style="color: white; margin-top: 10px" >Let's Cafe Hà Nội </h4>-->
        <!--        <h4 style="color: white; margin-top: 10px" >101-B4 ngõ 46C Phạm Ngọc Thạch (khu Tập thể Trung Tự), Hà Nội, Việt Nam, Hanoi, Vietnam, 11500 </h4>-->
      </figure>
       <figure class=" col-lg-4 col-md-4 container ">
           <div class="mc-sl__item" data-province="ho-chi-minh" data-number="028-6678-7648" data-address="so-75a-duong-3-2-phuong-11-quan-10">
               <img src="Lets/Let_anhao.jpg" alt=""/>

           </div>
           <a class="button" href="https://www.google.com/maps/place/Lets+Cafe/@10.9435627,106.824335,17z/data=!3m1!4b1!4m6!3m5!1s0x3174df334cddb929:0xc6661e00878dc4b2!8m2!3d10.9435574!4d106.8269099!16s%2Fg%2F11h8bn25lc?entry=ttu" target="_blank" role="button">Xem tren MAP</a>

           <div class="mc-sl__name">Let's Cafe Premium An Hảo   </div>
           <div class="mc-sl__address">
                <span class="mc-sl__icon">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z"></path>-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>-->
                    <!--                  </svg>-->
                </span>
               <span>
                1 Lê Văn Duyệt, Biên Hòa, Vietnam
                </span>

           </div>
           <div class="mc-sl__phone">
                <span class="mc-sl__icon ">
<!--                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">-->
                    <!--                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z"></path>-->
                    <!--                  </svg>-->
                </span>
               <span>090 648 42 40</span>
           </div>

           <div class="mc-sl__opening">Thứ 2 đến Chủ Nhật: 06:30 - 22:30</div>
           <!--        <img src="Lets/let_hanoi.jpg" alt=""/>-->
           <!--        <figcaption>-->
           <!--            <h3>Let's Cafe Hà Nội</h3>-->
           <!--            <p></p>-->
           <!--            <a href="#" class="move" target="_blank">Xem tren MAP</a>-->
           <!--        </figcaption>-->
           <!--        <h4 style="color: white; margin-top: 10px" >Let's Cafe Hà Nội </h4>-->
           <!--        <h4 style="color: white; margin-top: 10px" >101-B4 ngõ 46C Phạm Ngọc Thạch (khu Tập thể Trung Tự), Hà Nội, Việt Nam, Hanoi, Vietnam, 11500 </h4>-->
       </figure>
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
                    <a class="btn btn-link" href="about.jsp">Về chúng tôi</a>
                    <a class="btn btn-link" href="sanphambanle.jsp">Sản phẩm bán lẻ</a>
                    <a class="btn btn-link" href="khoahoc.jsp">khóa học</a>
                    <a class="btn btn-link" href="nhuongquyen.jsp">Nhượng quyền</a>
                    <a class="btn btn-link" href="cungcapcaphe.jsp">Cung cấp cà phê</a>
                </div>            </div>
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