
<?php 


class Session {

    function sessionStart(){
        session_start();
      }

    function createSession($key,$value){

        return   $_SESSION[$key] = $value;

    }

      function getSessionValue($key){
        
        return $_SESSION[$key];

      }

      function sessionDestroy(){
        
        session_destroy();
        $_SESSION = array(); // Clears the $_SESSION variable
        
        echo "Session Destroyed";

      }

      function unsetSessionByKey($key){
            
        unset($_SESSION[$key]);

      }
    
}


?>