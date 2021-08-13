<?php 

function session_start(){
    session_start()
  }
  function session_create($key,$value){
    return   $_SESSION[$key] = $value;
  }
  function session_destroy(){
    session_destroy();
  }

  
?>