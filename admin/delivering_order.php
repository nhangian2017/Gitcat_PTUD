<?php

include_once '../classes/order.php';

if (isset($_GET['orderId'])) {
    $order = new order();
    $result = $order->deliveringOrder($_GET['orderId']);
    if ($result) {
        echo '<script type="text/javascript">alert("Thành công!"); history.back();</script>';
    } else {
        echo '<script type="text/javascript">alert("Thất bại!"); history.back();</script>';
    }
}