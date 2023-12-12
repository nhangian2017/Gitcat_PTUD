<?php

include '../classes/product.php';
include '../classes/categories.php';

    $product = new product();
    $productUpdate = mysqli_fetch_assoc($product->getProductbyIdAdmin($_GET['id']));
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $result = $product->update($_POST, $_FILES);
        $productUpdate = mysqli_fetch_assoc($product->getProductbyIdAdmin($_GET['id']));
    }
else {
}

$category = new categories();
$categoriesList = $category->getAll();
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
    <title>Chỉnh sửa sản phẩm</title>

    <script>
        function validatePrices() {
            var originalPrice = document.getElementById('originalPrice').value;
            var promotionPrice = document.getElementById('promotionPrice').value;

            if (parseFloat(promotionPrice) >= parseFloat(originalPrice)) {
                alert('Giá khuyến mãi phải bé hơn giá gốc.');
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <a href="index.php" style="background-color: #0082e6;"><label class="logo">ADMIN</label></a>
        <ul>
            <li><a href="productlist.php" class="active">Quản lý Sản phẩm</a></li>
            <li><a href="categoriesList.php">Quản lý Danh mục</a></li>
            <li><a href="orderlist.php">Quản lý Đơn hàng</a></li>
        </ul>
    </nav>
    <div class="title">
        <h1>Chỉnh sửa sản phẩm</h1>
    </div>
    <div class="container">
        <?php
        if (isset($result)) {
            echo $result;
        }
        ?>
        <div class="form-add">
            <form action="edit_product.php?id=<?= $productUpdate['id'] ?>" method="post" enctype="multipart/form-data" onsubmit="return validatePrices()">
                <input type="text" hidden name="id" style="display: none;" value="<?= $productUpdate['id'] ?>">

                <label for="name">Tên sản phẩm</label>
                <input type="text" id="name" name="name" placeholder="Tên sản phẩm.." value="<?= $productUpdate['name'] ?>" required>

                <label for="originalPrice">Giá gốc</label>
                <input type="number" id="originalPrice" name="originalPrice" value="<?= $productUpdate['originalPrice'] ?>" min="1000" required>

                <label for="promotionPrice">Giá khuyến mãi</label>
                <input type="number" id="promotionPrice" name="promotionPrice" value="<?= $productUpdate['promotionPrice'] ?>" min="900" required>
               
                <label for="image">Hình ảnh</label>
                <img src="uploads/<?= $productUpdate['image'] ?>" style="height: 200px;" id="image" required> <br>

                <label for="imageNew">Chọn hình ảnh mới</label>
                <input type="file" id="imageNew" name="image">

                <label for="cateId">Loại sản phẩm</label>
                <select id="cateId" name="cateId">
                    <?php foreach ($categoriesList as $key => $value) {
                        if ($value['id'] == $productUpdate['cateId']) { ?>
                            <option selected value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                        <?php  } else { ?>
                            <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                        <?php   } ?>
                    <?php } ?>
                </select>

                <label for="qty">Số lượng</label>
                <input type="number" id="qty" name="qty" value="<?= $productUpdate['qty'] ?>" min="1" required>

                <label for="des">Mô tả</label>
                <textarea name="des" id="des" cols="30" rows="10"><?= $productUpdate['des'] ?></textarea>



                <input type="submit" value="Lưu" name="submit">
            </form>
        </div>
    </div>
    </div>

</body>

</html>
