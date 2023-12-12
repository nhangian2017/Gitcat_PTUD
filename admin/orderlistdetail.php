<?php
include '../classes/orderDetails.php';
include '../classes/order.php';
include '../classes/user.php';
$user = new User();
$userInfor=$user->get();

$orderDetails = new orderDetails();
$result = $orderDetails->getOrderDetails($_GET['orderId']);
$order = new order();
$order_result = $order->getById($result[0]['orderId']);
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
    <title>Chi tiết đơn đặt hàng</title>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <a href="index.php" style="background-color: #0082e6;"><label class="logo">ADMIN</label></a>
        <ul>
            <li><a href="productlist.php">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Quản lý Danh mục</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
            <li><a href="userList.php" >Quản lý tài khoản</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Chi tiết đơn đặt hàng <?= $order_result['id'] ?></h1>
    </div>
    <div class="container">
        <?php
        if ($result) { ?>
            <table class="list">
                <tr>
                    <th>STT</th>
                    <th>Mã đơn hàng</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                </tr>
                <?php $count = 1;
                foreach ($result as $key => $value) { ?>
                    <tr>
                        <td><?= $count++ ?></td>
                        <td><?= $value['orderId'] ?></td>
                        <td><?= $value['productName'] ?></td>
                        <td><img class="image-cart" src="uploads/<?= $value['productImage'] ?>" alt=""></td>
                        <td><?= number_format($value['productPrice']) ?></td>
                        <td><?= $value['qty'] ?></td>

                    </tr>
                <?php }
                ?>
            </table>
            <?php
            if ($order_result['status'] == 'Đang xử lý') { ?>
                <a href="processed_order.php?orderId=<?= $_GET['orderId'] ?>"><button class="tablinks">Xác nhận</button></a>
            <?php }
            ?>
        <?php } else { ?>
            <h3>Chưa có đơn hàng nào đang xử lý</h3>
        <?php }
        ?>
    </div>
    </div>
</body>

</html>