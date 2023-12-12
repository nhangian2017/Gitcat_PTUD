<?php
include_once '../classes/order.php';

if (isset($_GET['orderId'])) {
    $order = new order();
    $result = $order->processedOrder($_GET['orderId']);
    if ($result) {
        echo '<script type="text/javascript">alert("Cập nhật thành công!"); 
        window.location.href = "orderlist.php";</script>';
} else {
        echo '<script type="text/javascript">alert("Thất bại!"); history.back();</script>';
    }
}