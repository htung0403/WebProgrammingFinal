<%@ page import="entity.Customer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <link href="css/signup.css" rel="stylesheet">
</head>
<body>
<form class="form mx-auto" action="register" method="POST">
    <p class="title">Register</p>

    <img src="Lets/logo1-2.png" style="height: 130px ; width: 100px" >

    <div class="flex">
        <label>
            <input required="" placeholder="" type="text" class="input" name="name">
            <span>Họ tên</span>
        </label>
        <label>
            <input required="" placeholder="" type="text" class="input" name="telNumber">
            <span>Số điện thoại</span>
        </label>
    </div>
    <label>
        <input required="" placeholder="" type="text" class="input" name="address">
        <span>Địa chỉ</span>
    </label>
    <label>
        <input required="" placeholder="" type="email" class="input" name="username">
        <span>Email</span>
    </label>

    <label>
        <input required="" placeholder="" type="password" class="input" name="password">
        <span>Mật khẩu</span>
    </label>

    <button class="submit">Submit</button>
    <p class="signin">Already have an account ? <a href="login.jsp">Sign in</a> </p>
</form>
</body>
</html>
