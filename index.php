<?php
include_once 'lib/session.php';
include_once 'classes/product.php';
include_once 'classes/cart.php';
include_once 'classes/user.php';

$user = new user();
$userInfo = $user->get();


$cart = new cart();
$totalQty = $cart->getTotalQtyByUserId();

$product = new product();
$list = mysqli_fetch_all($product->getFeaturedProducts(), MYSQLI_ASSOC);
$list2 = mysqli_fetch_all($product->getFeaturedProducts2(), MYSQLI_ASSOC);


						if(isset($_REQUEST['nut']))
						{							
							$keyword = addslashes($_GET['keyword']);
							if(!empty($keyword))
							{	
								$list = $product->searchProduct($keyword);
								
							}
						}
						else {
              $list = mysqli_fetch_all($product->getFeaturedProducts(), MYSQLI_ASSOC);
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
    <title>Trang chủ</title>
    <link rel="shortcut icon" href="images/sách-removebg-preview-removebg-preview.png" />
    <link rel="stylesheet" href="css/style2.css">
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
<div class="banner">
    <main class="main-content">
  <section class="slideshow">
    <div class="slideshow-inner">
      <div class="slides">
        <div class="slide is-active ">
          <div class="slide-content">
            <div class="caption">
              <div class="text">
              </div> 
            </div>
          </div>
          <div class="image-container"> 
            <img src="images/NHÀ SÁCH H&M.png" alt="" class="image" />
          </div>
        </div>
        <div class="slide">
          <div class="slide-content">
            <div class="caption">
              <div class="text">
              </div>
              <a href="productList.php" class="btn">
                <span class="btn-inner">MUA NGAY</span>
              </a>
 
            </div>
          </div>
          <div class="image-container">
            <img src="images/KM.png" alt="" class="image" />
          </div>
        </div>
        <div class="slide">
          <div class="slide-content">
            <div class="caption">
              <div class="title">GIẢM NGAY 30%</div>
              <div class="text">
                <p>Mức giảm tối đa lên tới 40k</p>
              </div> 
              <a href="productList.php" class="btn">
                <span class="btn-inner">MUA NGAY</span>
              </a>
            </div>
          </div>
          <div class="image-container">
            <img src="images/sách.jpg" alt="" class="image" />
          </div>
        </div>
        <div class="slide">
          <div class="slide-content">
            <div class="caption">
            <div class="title">HM BOOK</div>
              <div class="text">
              <p>Ưu đãi siêu hời khi mua combo sách</p>
              </div> 
              <a href="productList.php" class="btn">
                <span class="btn-inner">MUA NGAY</span>
              </a>

            </div>
          </div>
          <div class="image-container"> 
            <img src="images/4.png" alt="" class="image" />
          </div>
        </div>
      </div>
      <div class="pagination">
        <div class="item is-active"> 
          <span class="icon">1</span>
        </div>
        <div class="item">
          <span class="icon">2</span>
        </div>
        <div class="item">
          <span class="icon">3</span>
        </div>
        <div class="item">
          <span class="icon">4</span>
        </div>
      </div>
      <div class="arrows">
        <div class="arrow prev">
          <span class="svg svg-arrow-left">
            <svg version="1.1" id="svg4-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M13,26c-0.256,0-0.512-0.098-0.707-0.293l-12-12c-0.391-0.391-0.391-1.023,0-1.414l12-12c0.391-0.391,1.023-0.391,1.414,0s0.391,1.023,0,1.414L2.414,13l11.293,11.293c0.391,0.391,0.391,1.023,0,1.414C13.512,25.902,13.256,26,13,26z"/> </svg>
            <span class="alt sr-only"></span>
          </span>
        </div>
        <div class="arrow next">
          <span class="svg svg-arrow-right">
            <svg version="1.1" id="svg5-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M1,0c0.256,0,0.512,0.098,0.707,0.293l12,12c0.391,0.391,0.391,1.023,0,1.414l-12,12c-0.391,0.391-1.023,0.391-1.414,0s-0.391-1.023,0-1.414L11.586,13L0.293,1.707c-0.391-0.391-0.391-1.023,0-1.414C0.488,0.098,0.744,0,1,0z"/> </svg>
            <span class="alt sr-only"></span>
          </span>
        </div>
      </div>
    </div> 
  </section>
</main>

</div>
          <div class="featuredProducts">
            <form action="" method="get" class="form">
                  <input type="text" name="keyword" class="form__field" placeholder="Tìm kiếm sách..." />
                  <button type="submit" name="nut" hidden class="btn2 btn--primary">Tìm kiếm</button>
            </form>
          </div>

    <div class="featuredProducts">
        <h1><i class="fab fa-hotjar" aria-hidden="true"> Xu hướng mua sắm</i></h1>
    </div>
    
    <div class="container">
        <?php
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
                        <!----Giá bán:--> <?= number_format($value['promotionPrice'] ) ?>đ
                    </div>

                    <div class="original-price">
                        <?php
                        //Hàm number_format định dạng lại số theo hàng nghìn
                        if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                            <!--Giá gốc:--> <del><?= number_format($value['originalPrice']) ?>đ</del>
                        <?php } else { ?>
                            <p>.</p>
                        <?php } ?>
                    </div>

                    
                    <div class="action">
                        <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">
                        <img src="images/cart.png" style="width: 25px; height: 15px;" alt="" srcset=""> Thêm giỏ hàng</a>
                    </div>
                </div>
            </div>
        <?php }
        ?>
    </div>
    <div class="featuredProducts">
        <h2><i class="fa fa-book" aria-hidden="true"> Sách HOT - Giảm sốc</i></h2>
    </div>

    <div class="container">
        <?php
        foreach ($list2 as $key => $value) { ?>
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
                        <!----Giá bán:--> <?= number_format($value['promotionPrice'] ) ?>đ
                    </div>

                    <div class="original-price">
                        <?php
                        //Hàm number_format định dạng lại số theo hàng nghìn
                        if ($value['promotionPrice'] < $value['originalPrice']) { ?>
                            <!--Giá gốc:--> <del><?= number_format($value['originalPrice']) ?>đ</del>
                        <?php } else { ?>
                            <p>.</p>
                        <?php } ?>
                    </div>

                    
                    <div class="action">
                        <a class="add-cart" href="add_cart.php?id=<?= $value['id'] ?>">
                        <img src="images/cart.png" style="width: 25px; height: 15px;" alt="" srcset=""> Thêm giỏ hàng</a>
                    </div>
                </div>
            </div>
        <?php }
        ?>
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
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>
<script  src="js/script.js"></script>


</html>