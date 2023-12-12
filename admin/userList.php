<?php
include '../classes/user.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user = new user();
    if (isset($_POST['block'])) {
        $result = $user->block($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Khóa người dùng thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Khóa người dùng thất bại!");</script>';
        }
    } else if (isset($_POST['active'])) {
        $result = $user->active($_POST['id']);
        if ($result) {
            echo '<script type="text/javascript">alert("Kích hoạt người dùng thành công!");</script>';
        } else {
            echo '<script type="text/javascript">alert("Kích hoạt người dùng thất bại!");</script>';
        }
    } else {
        echo '<script type="text/javascript">alert("Có lỗi xảy ra!");</script>';
        die();
    }
}

$user = new user();
$list = $user->getAllAdmin((isset($_GET['page']) ? $_GET['page'] : 1));
$pageCount = $user->getCountPaging();
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
    <title>Danh sách danh mục</title>
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
            <li><a href="userList.php" class="active" >Quản lý tài khoản</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Danh sách tài khoản</h1>
    </div>
    <div class="addNew">
    </div>
    <div class="container">
        <?php $count = 1;
        if ($list) { ?>
            <table class="list">
                <tr>
                    <th>STT</th>
                    <th>Email</th>
                    <th>Tên người dùng</th>
                    <th>Mật khẩu</th>

                    <th>Thao tác</th>
                </tr>
                <?php foreach ($list as $key => $value) { ?>
                    <tr>
                        <td><?= $count++ ?></td>
                        <td><?= $value['email'] ?></td>
                        <td><?= $value['fullname'] ?></td>
                        <td><?= $value['password'] ?></td>


                        <td>
                            <a href="edit_user.php?id=<?= $value['id'] ?>">Xem/Sửa</a>
                            <?php
                            if ($value['status']) { ?>
                                <form action="userList.php" method="post">
                                    <input type="text" name="id" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Khóa" name="block">
                                </form>
                            <?php } else { ?>
                                <form action="userList.php" method="post">
                                    <input type="text" name="id" hidden value="<?= $value['id'] ?>" style="display: none;">
                                    <input type="submit" value="Mở" name="active">
                                </form>
                            <?php } ?>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        <?php } else { ?>
            <h3>Chưa có tài khoản nào...</h3>
        <?php } ?>
        <div class="pagination">
            <a href="userList.php?page=<?= (isset($_GET['page'])) ? (($_GET['page'] <= 1) ? 1 : $_GET['page'] - 1) : 1 ?>">&laquo;</a>
            <?php
            for ($i = 1; $i <= $pageCount; $i++) {
                if (isset($_GET['page'])) {
                    if ($i == $_GET['page']) { ?>
                        <a class="active" href="userList.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php } else { ?>
                        <a href="userList.php?page=<?= $i ?>"><?= $i ?></a>
                    <?php  }
                } else { ?>
                    <a href="userList.php?page=<?= $i ?>"><?= $i ?></a>
                <?php  } ?>
            <?php }
            ?>
            <a href="userList.php?page=<?= (isset($_GET['page'])) ? $_GET['page'] + 1 : 2 ?>">&raquo;</a>
        </div>
    </div>
    </div>

</body>

</html>