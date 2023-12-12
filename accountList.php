<?php
    include_once 'lib/session.php';
    Session::checkSession('client');
    include_once 'classes/cart.php';
    include_once 'classes/user.php';
    $cart = new cart();
    $list = $cart->get();
    $totalPrice = $cart->getTotalPriceByUserId();
    $totalQty = $cart->getTotalQtyByUserId();
    
    $role_id = Session::get('role_id');

    if ($role_id == 2 || $role_id ==1) {
        $user = new user();
        $addressUpdate = mysqli_fetch_assoc($user->getByIdUser($_GET['id']));
        $userInfo = $user->get();
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
            $result = $user->updatepw($_POST, $_FILES);
            $addressUpdate = mysqli_fetch_assoc($user->getByIdUser($_GET['id']));
        }
    } else {
        header("Location:checkout.php");
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
    <title>Account_List</title>
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
    <div class="title">
        <h1>Đổi mật khẩu</h1>
    </div>
    <div class="container">
        <?php
        if (isset($result)) {
            echo $result;
        }
        ?>
        <div class="form-add">
            <form action="accountList.php?id=<?= $addressUpdate['id'] ?>" method="post">
                <input type="text" hidden name="id" style="display: none;" value="<?= (isset($_GET['id']) ? $_GET['id'] : $addressUpdate['id']) ?>">
                <label for="name"></label>
                <input cols="1000" rows="10" type="text" id="name" name="pwd" 
                placeholder="Mật khẩu của bạn..."    required>

                <input type="submit" value="Lưu" name="submit" id="submit">
            </form>
        </div>
    </div>    
</body>
</html>