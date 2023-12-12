<?php
include '../classes/user.php';
    $user = new user();
    $userUpdate = mysqli_fetch_assoc($user->getByIdAdmin($_GET['id']));
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $result = $user->adupdate($_POST, $_FILES);
        $userUpdate = mysqli_fetch_assoc($user->getByIdAdmin($_GET['id']));
    }
else {
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
    <title>Chỉnh sửa người dùng</title>
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
            <li><a href="userList.php" class="active">Quản lý tài khoản</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Chỉnh sửa người dùng</h1>
    </div>
    <div class="container">
        <?php
        if (isset($result)) {
            echo $result;
        }
        ?>
        <div class="form-add">
            <form action="edit_user.php?id=<?= $userUpdate['id'] ?>" method="post">
                <input type="text" hidden name="id" style="display: none;" value="<?= (isset($_GET['id']) ? $_GET['id'] : $userUpdate['id']) ?>">
                <label for="name">Mật khẩu người dùng</label>
                <input type="text" id="pwd" name="pwd" placeholder="Mật khẩu.." 
                style="display: inline-block;" required="">

                <input type="submit" value="Lưu" name="submit">
            </form>
        </div>
    </div>
    </div>

</body>

</html>