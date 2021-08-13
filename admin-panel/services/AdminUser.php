<?php 


class AdminUser {

    private $db_handle;
    
    function __construct() {
        $this->db_handle = new DBController();
    }

    function getAdmin() {
        $query = "select name from admin_user WHERE admin_id=1 ";
        $result = $this->db_handle->runBaseQuery($query);
        return $result;
    }



}



?>