<?php
$filepath = realpath(dirname(__FILE__));
include_once($filepath . '/../lib/session.php');
include_once($filepath . '/../lib/database.php');
include_once($filepath . '/../lib/PHPMailer.php');
include_once($filepath . '/../lib/SMTP.php');

use PHPMailer\PHPMailer\PHPMailer;
?>

<?php
/**
 * 
 */
class user
{
	private $db;
	public function __construct()
	{
		$this->db = new Database();
	}
	///Đăng nhập
	public function login($email, $password)
	{
		$query = "SELECT * FROM users WHERE email = '$email' AND password = '$password' AND status='1' LIMIT 1 ";
		$result = $this->db->select($query);
		if ($result) {
			$value = $result->fetch_assoc();
			Session::set('user', true);
			Session::set('userId', $value['id']);
			Session::set('role_id', $value['role_id']);
			if (intval($value['role_id']) == 1) {
				header("Location:./admin");
				return true;
			}
			header("Location:index.php");
		} else {
			$alert = "Tên đăng nhập hoặc mật khẩu không đúng!";
			return $alert;
		}
	}
// đăng ký tài khoản
	public function insert($data)
	{
		$fullName = $data['fullName'];
		$email = $data['email'];
		$dob = $data['dob'];
		$address = $data['address'];
		$password = md5($data['password']);


		$check_email = "SELECT * FROM users WHERE email='$email' LIMIT 1";
		$result_check = $this->db->select($check_email);
		if ($result_check) {
			return 'Email đã tồn tại!';
		} else {
			// Genarate captcha
			$captcha = rand(10000, 99999);

			$query = "INSERT INTO users VALUES (NULL,'$email','$fullName','$dob','$password',2,1,'$address',0,'" . $captcha . "') ";
			$this->db->insert($query);
			return '<script type="text/javascript">alert("Đăng ký tài khoản thành công! Cảm ơn bạn"); 
			window.location.href = "login.php";</script>';
		}
	}

	public function get()
	{
		$userId = Session::get('userId');
		$query = "SELECT * FROM users WHERE id = '$userId' LIMIT 1";
		$mysqli_result = $this->db->select($query);
		if ($mysqli_result) {
			$result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
			return $result;
		}
		return false;
	}

	public function getLastUserId()
	{
		$query = "SELECT * FROM users ORDER BY id DESC LIMIT 1";
		$mysqli_result = $this->db->select($query);
		if ($mysqli_result) {
			$result = mysqli_fetch_all($this->db->select($query), MYSQLI_ASSOC)[0];
			return $result;
		}
		return false;
	}
	public function update($data)
    {
        $query = "UPDATE users SET address = '".$data['dc']."' WHERE id = '".$data['id']."'";
        $result = $this->db->update($query);
        if ($result) {
			return '<script type="text/javascript">alert("Cập nhật địa chỉ thành công!"); 
			window.location.href = "checkout.php";</script>';
        } else {
            $alert = "<span class='error'>Cập nhật địa chỉ thất bại</span>";
            return $alert;
        }

    }
	public function updatepw($data)
    {
		$pwd = $data['pwd'];
        $query = "UPDATE users SET password='".md5($pwd)."' WHERE id = '".$data['id']."'";
        $result = $this->db->update($query);
        if ($result) {
			return '<script type="text/javascript">alert("Cập nhật mật khẩu thành công!"); 
			window.location.href = "checkout.php";</script>';
        } else {
            $alert = "<span class='error'>Cập nhật địa chỉ thất bại</span>";
            return $alert;
        }

    }

	public function getByIdUser($id)
    {
        $query = "SELECT * FROM users where id = '$id'";
        $result = $this->db->select($query);
        return $result;
    }
	/////Hiển thị user lên trang chủ
	public function getAllAdmin($page = 1, $total = 10)
    {
        if ($page <= 0) {
            $page = 1;
        }
        $tmp = ($page - 1) * $total;
        $query ="SELECT * FROM users order by fullname asc limit $tmp,$total";
        $result = $this->db->select($query);
        return $result;
    }
	//Khóa or mở user
	public function block($id)
    {
        $query = "UPDATE users SET status = 0 where id = '$id' ";
        $result = $this->db->delete($query);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
	public function active($id)
    {
        $query = "UPDATE users SET status = 1 where id = '$id' ";
        $result = $this->db->delete($query);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
	public function getCountPaging($row = 8)
    {
        $query = "SELECT COUNT(*) FROM users";
        $mysqli_result = $this->db->select($query);
        if ($mysqli_result) {
            $totalrow = intval((mysqli_fetch_all($mysqli_result, MYSQLI_ASSOC)[0])['COUNT(*)']);
            $result = ceil($totalrow / $row);
            return $result;
        }
        return false;
    }
	/// Sửa người dùng 
	public function adupdate($data)
    {
		$pwd = $data['pwd'];
        $query = "UPDATE users SET password='".md5($pwd)."' WHERE id = '".$data['id']."'";
        $result = $this->db->update($query);
        if ($result) {
			return '<script type="text/javascript">alert("Cập nhật mật khẩu thành công!"); 
			window.location.href = "userList.php";</script>';
        } else {
            $alert = "<span class='error'>Cập nhật danh mục thất bại</span>";
            return $alert;
        }

    }
	//Lấy id
	public function getByIdAdmin($id)
    {
        $query = "SELECT * FROM users where id = '$id'";
        $result = $this->db->select($query);
        return $result;
    }


        
    


}
?>