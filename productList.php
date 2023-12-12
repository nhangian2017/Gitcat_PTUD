<?php
include_once 'lib/session.php';
include_once 'classes/product.php';
include_once 'classes/categories.php';
include_once 'classes/cart.php';
include_once 'classes/user.php';

$user = new user();
$userInfo = $user->get();


$cart = new cart();
$totalQty = $cart->getTotalQtyByUserId();

$product = new product();
$list = $product->getProductsByCateId((isset($_GET['page']) ? $_GET['page'] : 1), (isset($_GET['cateId']) ? $_GET['cateId'] : 2));
$pageCount = $product->getCountPagingClient((isset($_GET['cateId']) ? $_GET['cateId'] : 2));//kiểm tra tồn tại hay không mới lấy

$categories = new categories();
$categoriesList = $categories->getAll();
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
    <title>Danh sách sản phẩm</title>
</head>

<body>
<nav class="menu">
    <div id="logo"><a href="index.php"><p class="logo">𝔾𝕚𝕥ℂ𝕒𝕥</p></a></div>
        <div id="menu">
        <ul>
            <li><a href="index.php" class="active">Trang chủ</a></li>
            <li><a href="productList.php" >Sản phẩm</a></li>
            <li><a href="order.php" id="order">Đơn hàng</a></li>
        

            <li>
                <a href="checkout.php">
                    <i class="fa fa-shopping-bag"></i>
                    <span class="sumItem">
                        <?= ($totalQty['total']) ? $totalQty['total'] : "0" ?>
                    </span>
                </a>
            </li>
            <?php
            if (isset($_SESSION['user']) && $_SESSION['user']) { ?>
            <li><a href="#" class="fa fa-user"> <?= $userInfo['fullname'] ?></a>
                <ul class="submenu"> 
                    <li><a href="accountList.php?id=<?= $userInfo['id'] ?>">Đổi mật khẩu</a></li>
                    <li><a href="logout.php" id="signin">Đăng xuất</a></li>
                </ul>
            </li>
            <?php } else { ?>
                <li><a href="#" class="fa fa-user" ></a>
                <ul class="submenu"> 
                    <li><a href="register.php" id="signup">Đăng ký</a></li>
                    <li><a href="login.php" id="signin">Đăng nhập</a></li>
                </ul>

                </li>

            <?php } ?>



        </ul>
        </div>
    </nav>
    <section class="banner"></section>
    <div class="featuredProducts">
        <h2>Danh sách sản phẩm</h2>
    </div>
    <div class="category">
        Danh mục: <select onchange="location = this.value;">
            <?php
            foreach ($categoriesList as $key => $value) {
                if ($value['id'] == $_GET['cateId']) { ?>
                    <option selected value="productList.php?cateId=<?= $value['id'] ?>"><?= $value['name'] ?></option>
                <?php } else { ?>
                    <option value="productList.php?cateId=<?= $value['id'] ?>"><?= $value['name'] ?></option>
                <?php } ?>
            <?php }
            ?>
        </select>
    </div>
    <div class="container">
        <?php if ($list) {
            foreach ($list as $key => $value) { ?>
                <div class="card">
                    <div class="imgBx">
                        <a href="detail.php?id=<?= $value['id'] ?>"><img src="admin/uploads/<?= $value['image'] ?>" alt=""></a>
                    </div>
                    <div class="content">
                        <div class="productName">
                            <a href="detail.php?id=<?= $value['id'] ?>">
                                <h5><?= $value['name'] ?></h5>
                            </a>
                        </div>
                        <div>
                            Đã bán: <?= $value['soldCount'] ?>
                        </div>

                        <div class="price">
                            <!----Giá bán:---> <?= number_format($value['promotionPrice'], 0, '', ',') ?>đ
                        </div>

                        <div class="original-price">
                            <?php
                            if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                                <!---Giá gốc:---> <del><?= number_format($value['originalPrice'], 0, '', ',') ?>đ</del>
                            <?php } else { ?>
                                <p>.</p>
                            <?php } ?>
                        </div>
                        <!-- <div class="rating">
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div> -->
                        <div class="action">
                            <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">
                            <img src="images/cart.png" style="width: 25px; height: 15px;" alt="" srcset=""> Thêm giỏ hàng</a>
                        </div>
                        
                    </div>
                </div>
            <?php }
        } else { ?>
            <h3>Không có sản phẩm nào...</h3>
        <?php  }
        ?>
    </div>
    <div class="pagination">
        <a href="productList.php?page=<?= (isset($_GET['page'])) ? (($_GET['page'] <= 1) ? 1 : $_GET['page'] - 1) : 1 ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : 2 ?>">&laquo;</a>
        <?php
        for ($i = 1; $i <= $pageCount; $i++) {
            if (isset($_GET['page'])) {
                if ($i == $_GET['page']) { ?>
                    <a class="active" href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : 2 ?>"><?= $i ?></a>
                <?php } else { ?>
                    <a href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : 2 ?>"><?= $i ?></a>
                <?php  }
            } else { ?>
                <a href="productList.php?page=<?= $i ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : 2 ?>"><?= $i ?></a>
            <?php  } ?>
        <?php }
        ?>
        <a href="productList.php?page=<?= (isset($_GET['page'])) ? $_GET['page'] + 1 : 2 ?>&cateId=<?= (isset($_GET['cateId'])) ? $_GET['cateId'] : 2 ?>">&raquo;</a>
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

</html>