<?php session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://baodanang.toasoan.net/aboutviettin.php -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Welcome</title>

    <style>
        .style3{
            color:red;
        }

        .chat-main {
            position: fixed;
            width: 25%;
            bottom: 79px;
            right: 27px;
        }

        .header-one {
            background: #404040;
        }

        .name h6 {
            display: inline-block;
            font-size: 14px;
        }

        .options i,
        .options .arrow-up {
            height: 25px;
            width: 25px;
        }

        .options i {
            color: #B2B2B2;
            font-size: 16px;
            cursor: pointer;
        }

        .options .hover:hover,
        .options .arrow-up:hover {
            background: #737373;
        }

        .options .arrow-up {
            display: inline-block;
            line-height: 0;
        }

        .options .hover:hover,
        .options .arrow-up:hover .fa-arrow-up {
            color: #fff;
        }

        .options .fa-arrow-up {
            transform: rotate(40deg);
        }

        .header-two {
            border-top: 2px solid #35AC19;
            background: #ECEFF1;
            color: #5E6060;
            padding: 8px 0px 4px 8px;
            box-shadow: 0px 6px 13px -7px #c1c1c1;
            z-index: 1000;
            position: absolute;
        }

        .options-left i,
        .options-right i {
            font-size: 20px;
            cursor: pointer;
        }

        .options-left i:hover,
        .options-right i:hover {
            color: #000;
        }

        .chats {
            height: 250px !important;
            overflow-x: scroll;
            overflow-x: hidden;
            background: #ECEFF1;
            position: relative;
            top: 0px;
            padding-bottom: 10px;
        }

        .chats ul li {
            display: inline-block;
            list-style: none;
            clear: both;
            font-size: 13px;
            margin: 8px;
        }

        .sender-img {
            display: inline;
        }

        .sender-img img {
            width: 32px;
            height: 32px;
            border-radius: 100%;
        }

        .receive-msg .receive-msg-desc {
            display: inline-block;
            position: relative;
        }

        .receive-msg-desc:before {
            content: "";
            width: 0;
            height: 0;
            top: 0px;
            left: -8px;
            position: absolute;
            border-top: 8px solid #fff;
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
        }

        .receive-msg-time,
        .send-msg-time {
            color: #7D7E87;
            font-size: 10px;
        }

        .receive-msg-time i {
            font-size: 4px;
        }

        .msg-box {
            margin-top: 0px;
        }

        .msg-box i {
            color: #404040;
        }

        .msg-box input {
            font-size: 14px;
        }

        .msg-box input:focus {
            outline: none;
        }

        .send-msg {
            height: 80px;
            margin-right: 5px !important;
            margin-left: 2px !important;
        }

        img {
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 20px !important;
            right: 28px;
            width: 50px;
        }

        .btn-submit {
            margin-top: 5px !important;
            height: 35px;
        }

        .img-avata {
            top: 2px;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 5px;
            right: 8px;
            width: 20%;
            height: 20%;
        }

        .contents {
            outline: none !important;
            border-color: #719ECE;
            box-shadow: 0 0 10px #719ECE;
        }

        .div-contents {
            margin-left: -20px;
        }

        .form-container .btn:hover,
        .open-button:hover,
        .open-img:hover {
            opacity: 1;
        }

        @media only screen and (max-width: 900px) {
            .chat-main {
                position: fixed;
                width: 40%;
                bottom: 79px;
                right: 27px;
            }
        }

        @media only screen and (max-width: 600px) {
            .chat-main {
                position: fixed;
                width: 50%;
                bottom: 79px;
                right: 27px;
            }
        }
    </style>
    <!-- <link rel="stylesheet" href="./dist/chatbot.css"> -->
    <link rel="stylesheet" href="./dist/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="./dist/jquery/3.3.1/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="./dist/chatbot.js"></script> -->
</head>

<body>
    &nbsp;<br>
    <!-- <table border="0" cellspacing="0" cellpadding="0" width="90%">
        <tbody>
            <tr>
                <td width="87" height="28">&nbsp;</td>
                <td width="894"><span class="style1">Xin chào  bạn ADMIN !</span></td>
            </tr>
            <tr>
                <td height="187">&nbsp;</td>
                <td>
                    <p>Chúc bạn một ngày làm việc vui vẻ và thành công.<br>
                        <br> Hệ phần mềm Quản trị Tòa Soạn iNews được thiết kế làm Văn phòng Tòa soạn của cơ quan Báo chí trên mạng Internet, với chức năng chính về điều hành tác nghiệp báo chí, quản lý quy trình xuất bản từ khi viết bài, gửi bài về tòa
                        soạn, qua các bước biên tập bước 1, bước 2, duyệt nội dung, xuất bản bài, chấm và chi nhuận bút. iNews hướng đến sự chuyên nghiệp trong tác nghiệp báo chí: phóng viên sẽ nhận được yêu cầu tác nghiệp nhanh chóng từ phần mềm qua
                        hệ thống tin nhắn đến máy di động, các bước biên tập nội dung tin bài sẽ được lưu trữ theo vết để kiểm tra lại về thời điểm biên tập, nội dung biên tập cũng như người thực hiện biên tập.<br> Ngoài ra, iNews còn nhiều chức năng
                        chi tiết khác mà người sử dụng sẽ được tìm hiểu trong quá trình sử dụng. Mọi chi tiết xin vui lòng liên hệ đơn vị sản xuất phần mềm theo số điện thoại 0947 945.946 (Phượng).<br>
                        <br> Rất hân hạnh được phục vụ bạn!<br>
                    </p>
                    <hr>
                    <span class="style3">Lưu ý quan trọng:</span><br> - Tỷ lệ nhắn tin thành công đến máy di động của người nhận phụ thuộc vào các nhà cung cấp dịch vụ Vinaphone, Mobiphone, Viettel... và máy điện thoại của người được nhận tin nên có thể
                    có trường hợp tin nhắn đến chậm hơn hoặc không đến.<br> Do vậy, đối với các công việc quan trọng, khuyến nghị anh chị cần có cách thức xử lý phù hợp.
                    <p><span class="style3">@Sản phẩm được sản xuất bởi  Công ty TNHH Công nghệ Tin học Việt Tín.<br>
        Địa chỉ: 02 Lê Văn Sĩ - Đà Nẵng - Việt Nam.<br>
Văn phòng tại Quảng Nam: 139 Nguyễn Duy Hiệu - TP Tam Kỳ - tỉnh Quảng Nam. <br>
Điện thoại: 02363.500.515. Hotline: 0914 132.123 (mr Anh). Website: www.congtyviettin.com. </span></p>
                    <p><span class="style2">Rất hân hạnh được phục vụ bạn! </span><br>
                        <br>
                        <br>
                    </p>
                </td>
            </tr>
        </tbody>
    </table> -->
    <img src="./img/messenger.png" alt="messenger" class="open-img" onclick="openForm()">
   <div class="chat-popup chatbotForm" id="myForm">
        <div class="container">
            <div class="row pt-3">
                <div class="chat-main">
                    <div class="col-md-12 chat-header">
                        <div class="row header-one text-white p-1">
                            <div class="col-md-6 name pl-2">
                                <i class="fa fa-comment"></i>
                                <h6 class="ml-1 mb-0">Chat</h6>
                            </div>
                            <div class="col-md-6 options text-right pr-0">
                                <i class="fa fa-window-minimize hide-chat-box hover text-center pt-1" onclick="closeForm()"></i>
                            </div>
                        </div>
                    </div>
                    <div class="chat-content">
                        <div class="col-md-12 chats">
                            <ul class="p-0 dataUL" id="dataULL">
                                <!-- Lấy dữ liệu getUpdate cho lần chạy đầu tiên trong group telegram -->
                                <?php
                                    $api_url="https://api.telegram.org/bot1749227125:AAFexLtC2txoar6H-GqXFqsypb5sZE6khr0/getUpdates";
                                    
                                    $json_data = file_get_contents($api_url);

                                    $response_data = json_decode($json_data);

                                    $user_data = $response_data->result;

                                    //$user_data = array_slice($user_data, 85, 300);

                                    foreach ($user_data as $user) {
                                        
                                        $first_name = $user->message->from->first_name;
                                        $last_name = $user->message->from->last_name;
                                        $message_id = $user->message->message_id;
                                        $text = $user->message->text;
                                        $date = $user->message->date;
                                        $_SESSION['group']['messageID'] = $message_id+1;
                                        echo '<li>';
                                            echo '<div class="row" id="load_data">';
                                                echo '<img src="./img/img-avata.png" alt="image" class="col-md-3 col-sm-3 float-left img-avata mediaImg">';
                                                    echo '<div class="col-md-6 col-sm-6 div-contents">';
                                                        echo '<span style="display:none">'.$message_id.'</span>';
                                                        echo '<h6 style="color:#B22222">'.$first_name." ".$last_name.'</h6>';
                                                        echo '<span>'.$text.'</span>';
                                                    echo '</div>';
                                                echo '<div class="col-md-3 col-sm-3">';
                                                    echo '<span>'.date('d/m/Y',$date).'</span>';
                                                echo '</div>';
                                            echo '</div>';
                                        echo '</li>';
                                    }
                                    
                                ?>
                            </ul>
                        </div>
                        <div class="col-md-12 p-2 msg-box border border-primary">
                            <!-- <form method="POST" action="about.php?action=teleSend"> -->
                            <form id="formSubmit">
                                <div class="send-msg">
                                    <input type="hidden" name="messageID" value="<?php echo $_SESSION['group']['messageID'];?>" class="messageIDS"/>
                                    <input type="hidden" name="username" value="Admin" class="usernameIP"/>
                                    <textarea id="content" class="contents" name="content" rows="3" cols="45" style="width:100%" placeholder="Nhập nội dung" onkeypress="onTestChange()"></textarea><br>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //Bắt sự kiện nhấn nút Enter
        function onTestChange() {
            var key = window.event.keyCode;
            
            if (key === 13) {
                //Bắt sự kiện thành công
                //Gọi hàm myTest() thực thi chương trình
                myTest();
                // return false;
            }
        }
        
        function myTest(){
            //Lấy dữ liệu từ textbox web
            var messageID = $('.messageIDS').val();
            var usernameIP = $('.usernameIP').val();
            var contents = $('.contents').val();

            //Lấy ngày giờ hiện tại
            var today = new Date();
            var time = today.getDate()+"/0"+ (today.getMonth()+1)+"/"+today.getFullYear();

            //Tạo một element li
            var li = document.createElement("li");
            
            var noiDungMoi = document.createTextNode(contents);
            
            li.appendChild(noiDungMoi);
            
            var contentSP = document.getElementById("dataULL");
        
            contentSP.appendChild(li).innerHTML = 
                '<div class="row">'
                    +'<img src="./img/img-avata.png" alt="image" class="col-md-3 col-sm-3 float-left img-avata mediaImg">'
                    +'<div class="col-md-6 col-sm-6 div-contents">'
                        +'<span class="contentSP" id="idContentSP" style="display:none">'+messageID+'</span>'
                        +'<h6 style="color:#191970" class="usernameIDS">Admin</h6>'
                        +'<span class="contentSP" id="idContentSP">'+contents+'</span>'
                    +'</div>'
                    +'<div class="col-md-3 col-sm-3">'
                        +'<span>'+time+'</span>'
                    +'</div>'
                +'</div>';
            //Gửi dữ liệu đến Group Telegrame
            $.ajax({
                url:'https://api.telegram.org/bot1749227125:AAFexLtC2txoar6H-GqXFqsypb5sZE6khr0/sendMessage',
                method:'POST',
                data:{
                    chat_id:-1001359853051,
                    text:usernameIP+ " OK "+messageID +" : "+contents,
                    },
                });

            myFunction();
            //Sau khi cập nhật làm mới textbox
            $('.contents').val('');
        }

        // function lấy dữ liệu từ group telegrame
        // dữ liệu được lấy sau 0.7s
        function myFunction() {
            setInterval(function(){
                
                $.ajax({
                    type: 'GET',
                    url: 'https://api.telegram.org/bot1749227125:AAFexLtC2txoar6H-GqXFqsypb5sZE6khr0/getUpdates',
                    dataType: 'html',
                    success: function(data) {
                    
                        var getData = $.parseJSON(data);
                        var str = "";
                        $.each(getData.result, function(index, item) {
                            var messageID = $('.messageIDS').val();
                            var usernameIP = $('.usernameIP').val();
                            var contents = $('.contents').val();

                            var message_id = item.message.message_id;
                            var first_name = item.message.from.first_name;
                            var last_name = item.message.from.last_name;
                            var text = item.message.text;
                            // var date = item.message.date;

                            //Lấy ngày giờ hiện tại
                            var today = new Date();
                            var time = today.getDate()+"/0"+ (today.getMonth()+1)+"/"+today.getFullYear();

                            //So sánh id của group với id của textbox website
                            //Nếu id group lớn hơn thì hiển thị dữ liệu
                            if(message_id > messageID){
                                str += '<li id="dataS">';
                                    str += '<div class="row">';
                                        str += '<img src="./img/img-avata.png" alt="image" class="col-md-3 col-sm-3 float-left img-avata mediaImg">';
                                        str += '<div class="col-md-6 col-sm-6 div-contents">';
                                            // str += '<span style="color:#B22222" class="idS" style="display:none">'+message_id+'</span>';
                                            str += '<h6 style="color:#B22222" class="usernameIDS">'+first_name+" "+last_name+'</h6>';
                                            str += '<span class="contentSP text-center">'+text+'</span>';
                                        str += '</div>';
                                        str += '<div class="col-md-3 col-sm-3">';
                                            str += '<span>'+time+'</span>';
                                        str += '</div>';                  
                                    str += '</div>';
                                str += '</li>';
                                $('.dataUL').html(str);
                                //Cập nhật id của textbox website
                                $('.messageIDS').val(message_id);
                            }
                        });
                    },
                });
            }, 700);
        }
    </script>

<script>
        //Mở chatbot
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }
        //Đóng chatbot
        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }

        function myFunctionMedia(x) {
            if (x.matches) {
                document.getElementsByClassName("chatbotForm")[0].style.display = "none";
            } else {
                document.getElementsByClassName("chatbotForm")[0].style.display = "block";
            }
        }

        var x = window.matchMedia("(max-width: 1100px)")
        myFunctionMedia(x)
        x.addListener(myFunctionMedia)
    </script>

</body>

</html>