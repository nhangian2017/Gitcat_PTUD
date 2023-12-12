<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath . '/../lib/database.php');
include_once($filepath . '/../lib/session.php');
include_once($filepath . '/../classes/cart.php');
include_once($filepath . '/../classes/product.php');
?>


 
<?php
/**
 * 
 */
class order
{
    private $db;
    public function __construct()
    {
        $this->db = new Database();
    }
    //insert data vào table order
    public function add()
    {
        $userId = Session::get('userId');
        //Add new order
        $sql_insert_cart = "INSERT INTO orders VALUES(NULL,'$userId','" . date('y/m/d') . "',NULL,'Đang xử lý' )";
        $insert_cart = $this->db->insert($sql_insert_cart);
        if (!$insert_cart) {
            return false;
        }

        //Lấy danh sách giỏ hàng theo userid
        $cart = new cart();
        $cart_user = $cart->get();

            //Get last orderid
        $sql_get_cart_last_id = "SELECT id FROM orders ORDER BY id DESC LIMIT 1";
        $get_cart_last_id = $this->db->select($sql_get_cart_last_id);
        if ($get_cart_last_id) {
            $orderId = mysqli_fetch_row($get_cart_last_id)[0];
        }

        //Update product qty
        $product = new product();
        foreach ($cart_user as $key => $value) {
            //Add item cart to order detail
            $sql_insert_order_details = "INSERT INTO order_details VALUES(NULL,'$orderId'," . $value['productId'] . "," . $value['qty'] . "," . $value['productPrice'] . ",'" . $value['productName'] . "','" . $value['productImage'] . "')";
            $insert_order_details = $this->db->insert($sql_insert_order_details);
            if (!$insert_order_details) {
                return false;
            }

            $product->updateQty($value['productId'], $value['qty']);
            if (!$product) {
                return false;
            }
        }

        //Delete cart
        $sql_delete_cart = "DELETE FROM cart WHERE userId = $userId";
        $delete_cart = $this->db->delete($sql_delete_cart);
        if ($delete_cart) {
            return true;
        }

        return false;
    }

    function updateReceivedDateOrder($id)
    {
        $query = "UPDATE orders SET receivedDate = '" . Date('y/m/d', strtotime('+3 days')) . "' WHERE id = $id";
        $mysqli_result = $this->db->update($query);
        if ($mysqli_result) {
            return true;
        }
        return false;
    }

    public function getOrderByUser()
    {
        $userId = Session::get('userId');
        $query = "SELECT id, userID, DATE_FORMAT(createdDate, '%d-%m-%Y') AS createdDate , DATE_FORMAT(receivedDate, '%d-%m-%Y') AS receivedDate,status FROM orders WHERE userId = '$userId' ";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }

    public function getById($id)
    {
        $query = "SELECT * FROM orders WHERE id = '$id' ";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
            return $result;
        }
        return false;
    }
    ////Đang xử lí
    public function getProcessingOrder()
    {
        $query = "SELECT id, userID, DATE_FORMAT(createdDate, '%d-%m-%Y') AS createdDate , DATE_FORMAT(receivedDate, '%d-%m-%Y') AS receivedDate,status FROM orders WHERE status = 'Đang xử lý' order by id DESC" ;
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }
    ///Đã xác nhận
    public function getProcessedOrder()
    {
        $query = "SELECT id, userID, DATE_FORMAT(createdDate, '%d-%m-%Y') AS createdDate , DATE_FORMAT(receivedDate, '%d-%m-%Y') AS receivedDate,status FROM orders WHERE status = 'Đã xử lý'";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }
    ///Đang giao hàng
    public function getDeliveringOrder()
    {
        $query = "SELECT id, userID, DATE_FORMAT(createdDate, '%d-%m-%Y') AS createdDate , DATE_FORMAT(receivedDate, '%d-%m-%Y') AS receivedDate,status FROM orders WHERE status = 'Đang giao hàng' order by id asc";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }
    ///Hoàn thành
    public function getCompleteOrder()
    {
        $query = "SELECT id, userID, DATE_FORMAT(createdDate, '%d-%m-%Y') AS createdDate , DATE_FORMAT(receivedDate, '%d-%m-%Y') AS receivedDate,status FROM orders WHERE status = 'Hoàn thành' order by receivedDate ASC";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC);
            return $result;
        }
        return false;
    }

    public function processedOrder($id)
    {
        $query = "UPDATE orders SET status = 'Đã xử lý' WHERE id = $id";
        $mysqli_result = $this->db->update($query);
        if ($mysqli_result) {
            if ($this->updateReceivedDateOrder($id)) {
                return true;
            }
        }
        return false;
    }

    public function deliveringOrder($id)
    {
        $query = "UPDATE orders SET status = 'Đang giao hàng' WHERE id = $id";
        $mysqli_result = $this->db->update($query);
        if ($mysqli_result) {
            return true;
        }
        return false;
    }
    //Cật nhập trạng thái đơn hàng sang Complete
    public function completeOrder($id)
    {
        $query = "UPDATE orders SET status = 'Hoàn thành', receivedDate = '" . date('y/m/d') . "' WHERE id = $id";
        $mysqli_result = $this->db->update($query);
        if ($mysqli_result) {
            return true;
        }
        return false;
    }
}
?>