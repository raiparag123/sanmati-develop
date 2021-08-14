<?php 
session_start();

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