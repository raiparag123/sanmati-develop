<?php 
session_start();

require "../services/DBController.php";
require "../services/Session.php";
require "../services/AdminUser.php";


if (class_exists('AdminUser')){
    $admin = new AdminUser();
    $session = new Session();
    $getAdminResult = $admin->authenticateLogin(14);

    echo "<script>console.log(".$getAdminResult.")</script>";

    // $admin->logout();
    echo $session->getSessionValue("roleId");

    
    
    
}else
echo "<script>console.log('AdminUser Class Not Found')</script>";
























?>