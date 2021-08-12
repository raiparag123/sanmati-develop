<?php 

session_start();

if($_SERVER['SERVER_NAME'] == "localhost")

    $_SESSION["db_connect"] ="db_localhost.php";
else
    $_SESSION["db_connect"] ="db.php";

    echo $_SESSION["db_connect"];


// echo 'Server name: '.$_SERVER['SERVER_NAME'].'<br>';

?>


<a href="header.php"> HELLO </a>