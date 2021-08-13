
<?php 

class ServerCheck {

    function checkServer(){

        if($_SERVER['SERVER_NAME'] == 'localhost') 
            $db_connect = "DBControllerLocal";
        else
            $db_connect = "DBControllerOnline";
        return  $db_connect;

    }
}


?>