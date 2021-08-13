<?php 
session_start();
// ini_set('display_errors', '1');
// ini_set('display_startup_errors', '1');
// error_reporting(E_ALL);

// require "../services/ServerCheck.php";
// if (class_exists('ServerCheck')){
//     $server_check = new ServerCheck();
// }else 
// echo "<script>console.log('Server Check Class Not Found')</script>";

// if (class_exists($server_check -> checkServer())){
//     $db_handle = new DBControllerLocal();
//     // echo $db_handle->connectDB();
//     echo "<script>console.log('Db Controller Class Exist')</script>";
// }
// else
// echo "<script>console.log('Db Controller doesn't Class Exist')</script>";

require "../services/DBController.php";
require "../services/AdminUser.php";


if (class_exists('AdminUser')){
    $admin = new AdminUser();
    $getAdminResult = $admin->getAdmin();
    if(isset($getAdminResult)){
        echo $getAdminResult[0]['name'];
    }

}else
echo "<script>console.log('AdminUser Class Not Found')</script>";
























?>