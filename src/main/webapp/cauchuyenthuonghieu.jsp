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
                <a href="cauchuyenthuonghieu.jsp" class="nav-item nav-link active">Câu chuyện thương hiệu </a>
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">Câu chuyện thương hiệu</h1>
<!--            <nav aria-label="breadcrumb animated slideInDown">-->
<!--                <ol class="breadcrumb">-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>-->
<!--                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>-->
<!--                    <li class="breadcrumb-item text-white active" aria-current="page">Project</li>-->
<!--                </ol>-->
<!--            </nav>-->

        </div>
    </div>
    <!-- Page Header End -->


    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">From Farm To Cup</h1>
                <h5 class ="display-6">Hành trình kì diệu</h5>
                <br>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                        <li class="mx-2" data-filter="*">All</li>
                        <li class="mx-2" data-filter=".first">Từ nông trại xa xôi </li>
                        <li class="mx-2" data-filter=".second">Sơ chế và bảo quản cà phê</li>
                        <li class="mx-2" data-filter=".third">Rang cà phê</li>
                        <li class="mx-2" data-filter=".fourth">Kết thúc hành trình tại quán cà phê</li>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
                <div class="col-lg-6 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="Lets/Farm_2.jpg" alt="">
                            <div class="portfolio-overlay">
                                <a class="btn btn-square btn-outline-light mx-1" href="Lets/Farm_2.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-square btn-outline-light mx-1" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                        <div class="border border-5 border-light border-top-0 p-4">
                            <p class="text-primary fw-medium mb-2">Khởi nguồn từ nông trại</p>
                            <p class="">Phụ thuộc vào vị trí địa lý và khí hậu của từng vùng đất mà những người nông dân sẽ lựa chọn giống cà phê để gieo trồng cho phù hợp.Tùy thuộc vào từng giống cây nhưng sẽ mất khoảng 3 đến 4 năm cho đến khi cây cà phê ra trái.
                                Đến mùa thu hoạch hạt cà phê, người nông dân sẽ chỉ chọn hái những quả chín nhất và hái trực tiếp bằng tay. Việc lựa chọn và thu hoạch cà phê thường sẽ kéo dài vài ngày hoặc cả tháng cho đến khi thu hoạch hết. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.3s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="Lets/So_che.jpg" alt="">
                            <div class="portfolio-overlay">
                                <a class="btn btn-square btn-outline-light mx-1" href="Lets/So_che.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-square btn-outline-light mx-1" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                        <div class="border border-5 border-light border-top-0 p-4">
                            <p class="text-primary fw-medium mb-2">Sơ chế cà phê</p>
                            <p>Khi cà phê đã được hái xuống thì cần bắt đầu ngay quy trình chế biến. Công việc này nên được làm càng nhanh càng tốt để tránh làm ảnh hưởng đến chất lượng cà phê. Sau khi hoàn thành giai đoạn bóc vỏ, nhân cà phê bên trong sẽ được sấy khô. Tiếp theo sẽ là khoảng thời gian để hạt cà phê được ‘nghỉ ngơi’ ở nhiệt độ và độ ẩm thích hợp. Cuối cùng, cà phê sẽ được xát vỏ và phân loại theo kích cỡ hạt để đóng gói và vận chuyển.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 portfolio-item third wow fadeInUp" data-wow-delay="0.5s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="Lets/roast.jpg" alt="">
                            <div class="portfolio-overlay">
                                <a class="btn btn-square btn-outline-light mx-1" href="Lets/roast.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-square btn-outline-light mx-1" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                        <div class="border border-5 border-light border-top-0 p-4">
                            <p class="text-primary fw-medium mb-2">Rang cà phê</p>
                            <p>Quá trình rang sẽ khiến cho những hạt cà phê xanh trở thành màu nâu mà chúng ta thường nhìn thấy ở những quán cà phê. Ở mỗi mẻ rang tùy vào mục đích khác nhau mà họ sẽ điều chỉnh và lựa chọn mức độ rang sao cho phù hợp nhất, đảm bảo mùi vị, màu sắc của cà phê khi lên thành phẩm. Rang cà phê là một quá trình rất quan trọng ảnh hưởng trực tiếp đến mùi vị của cà phê và từng tách cà phê.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 portfolio-item fourth wow fadeInUp" data-wow-delay="0.1s">
                    <div class="rounded overflow-hidden">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="Lets/product.jpg" alt="">
                            <div class="portfolio-overlay">
                                <a class="btn btn-square btn-outline-light mx-1" href="Lets/product.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-square btn-outline-light mx-1" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                        <div class="border border-5 border-light border-top-0 p-4">
                            <p class="text-primary fw-medium mb-2">Tạo nên tách ca phê thơm ngon, đậm đà tại quán</p>
                            <p>Kết thúc quy trình “From Farm To Cup” này chính là khi làm nên những tách cà phê thơm ngon, đậm đà. Đến đây vài trò của người Barista sẽ được thể hiện. Có thể thấy để có thể đi hết một hành trình kì diệu ấy thì đó là cả một chặng đường dài với những nỗ lực, cố gắng và làm việc tỉ mỉ từ những người nông dân vun trồng, hái quả cho đến những Barista đảm nhiệm công việc pha chế trong cửa hàng</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Projects End -->
        

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
<!--                <div class="col-lg-3 col-md-6">-->
<!--                    <h4 class="text-light mb-4">Services</h4>-->
<!--                    <a class="btn btn-link" href="">General Carpentry</a>-->
<!--                    <a class="btn btn-link" href="">Furniture Remodeling</a>-->
<!--                    <a class="btn btn-link" href="">Wooden Floor</a>-->
<!--                    <a class="btn btn-link" href="">Wooden Furniture</a>-->
<!--                    <a class="btn btn-link" href="">Custom Carpentry</a>-->
<!--                </div>-->
                <div class="col-lg-6 col-md-6">
                    <h4 class="text-light mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
<!--                <div class="col-lg-3 col-md-6">-->
<!--                    <h4 class="text-light mb-4">Newsletter</h4>-->
<!--                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>-->
<!--                    <div class="position-relative mx-auto" style="max-width: 400px;">-->
<!--                        <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">-->
<!--                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>-->
<!--                    </div>-->
<!--                </div>-->
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