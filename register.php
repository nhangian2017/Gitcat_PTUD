<?php
include 'classes/user.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = new user();
    $result = $user->insert($_POST);
    if ($result === true) {
        header("Location:./login.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://use.fontawesome.com/2145adbb48.js"></script>
    <script src="https://kit.fontawesome.com/a42aeb5b72.js" crossorigin="anonymous"></script>
    <title>Đăng ký</title>
</head>

<body>
    <nav>
    <div id="logo"><a href="index.php"><p class="logo">𝔾𝕚𝕥ℂ𝕒𝕥</p></a></div>
        <div id="menu"><ul>
            <li><a href="index.php">Trang chủ</a></li>
            <li><a href="productList.php">Sản phẩm</a></li>
            <li><a href="register.php" id="signup" class="active">Đăng ký</a></li>
            <li><a href="login.php" id="signin">Đăng nhập</a></li>
            <li><a href="order.php" id="order">Đơn hàng</a></li>

            <li>
                <a href="checkout.php">
                    <i class="fa fa-shopping-bag"></i>
                    <span class="sumItem">
                        0
                    </span>
                </a>
            </li>
        </ul></div> 
    </nav>
    <section class="banner"></section>
    <div class="featuredProductss">
    <center><h2 style="background: #effbf8; margin-top: 10px;">Đăng ký</h2></center >
    </div>
    <div class="container-single">
        <div class="login">
        <b class="error"><?= !empty($result) ? $result : '' ?></b>
            <form action="register.php" method="post" class="form-login">
                <label for="fullName">Họ tên</label>
                <input type="text" id="fullName" name="fullName" placeholder="Họ tên..." required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Email..." required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">

                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="Mật khẩu..." required>

                <label for="repassword">Nhập lại mật khẩu</label>
                <input type="password" id="repassword" name="repassword" required placeholder="Nhập lại mật khẩu..." oninput="check(this)">

                <label for="address">Địa chỉ</label>
                <textarea name="address" id="address" cols="30" rows="5" required></textarea>

                <label for="dob">Ngày sinh</label>
                <input type="date" name="dob" id="dob" required>

                <input type="submit" value="Đăng ký" name="submit">
            </form>
        </div>
    </div>
    </div>
    <footer>
        <div class="container2">
            <!--Bắt Đầu Nội Dung Giới Thiệu-->
            <div class="noi-dung about">
                <h2>Về Chúng Tôi</h2>
                <p>Đây là trang web bán sách trực tuyến với giá cả hợp lý, 
                  đa dạng thể loại sách và đảm bảo an toàn khi thanh toán. 
                  Chúng tôi cung cấp ưu đãi đặc biệt và hỗ trợ khách hàng nhanh chóng. 
                  Cảm ơn bạn đã ghé thăm!</p>
                <ul class="social-icon">
                    <li><a href="https://www.facebook.com/quandinh.7712/"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                </ul>
                <div id="logo"><a href="index.php"><p class="logo" 
                style="color: red;font-size: 40px;line-height: 60px;padding: 0 0px;">𝔾𝕚𝕥ℂ𝕒𝕥</p></a></div>

            </div>
            <!--Kết Thúc Nội Dung Giới Thiệu-->
            <!--Bắt Đầu Nội Dung Đường Dẫn-->
            <div class="noi-dung links">
                <h2>Đường Dẫn</h2>
                <ul>
                    <li><a href="#">Trang Chủ</a></li>
                    <li><a href="#">Về Chúng Tôi</a></li>
                    <li><a href="#">Thông Tin Liên Lạc</a></li>
                    <li><a href="#">Dịch Vụ</a></li>
                    <li><a href="#">Điều Kiện Chính Sách</a></li>
                </ul>
            </div>
            <!--Kết Thúc Nội Dung Đường Dẫn-->
            <!--Bắt Đâu Nội Dung Liên Hệ-->
            <div class="noi-dung contact">
                <h2>Thông Tin Liên Hệ</h2>
                <ul class="info">
                    <li>
                        <span><i class="fa fa-map-marker"></i></span>
                        <span>12 Nguyễn Văn Bảo, P4, Gò Vấp, TP. Hồ Chí Minh</span>
                    </li>
                    <li>
                        <span><i class="fa fa-phone"></i></span>
                        <p><a href="#">+84 373 19 2816</a>
                    </li>
                    <li>
                        <span><i class="fa fa-envelope"></i></span>
                        <p><a href="#">nhangian2017@gmail.com</a>
                        <br>
                          <a href="#">tranmanhdat0156@gmail.com</a>
                        <br>
                          <a href="#">qthuong1809@gmail.com</a>
                        <br>
                          <a href="#">otp610@gmail.com</a>
                        <br>
                          <a href="#">lamphong091202@gmail.com</a></p>
                   </li>
                    <li>
                        <form class="form">
                            <input type="email" class="form__field" placeholder="Đăng Ký Subscribe Email" />
                            <button type="button" class="btn2 btn--primary  uppercase">Gửi</button>
                        </form>
                    </li>
                </ul>
            </div>
            <!--Kết Thúc Nội Dung Liên Hệ-->
        </div>
    </footer>
</body>
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Mật khẩu không trùng khớp');
        }else{
            input.setCustomValidity('');
        }
    }
</script>
</html>