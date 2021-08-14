<?php 



class AdminUser {

    private $db_handle;
    
    function __construct() {
        $this->db_handle = new DBController();
        $this->session_handle = new Session();
    }


    function authenticateLogin($admin_id){
        $status = 0;

        $query = "select name, email_id, role_id from admin_user where admin_id = ? ";
        $paramType = "i";
        $paramValue = array(
            $admin_id
        );
        
        $result = $this->db_handle->runQuery($query, $paramType, $paramValue);

        if(!empty($result)){
            if($this->session_handle->createSession("adminId",$admin_id)){
                if($this->session_handle->createSession("roleId",$result[0]['role_id'])) {
                    $status = 1;
                }
            }
            
        }

        return $status;
    }

    function logout(){

        $this->session_handle->sessionDestroy();

    }


    function verifyAdminPassword($email_id, $password) {

        $status = 0;

        $query = "select admin_id, password from admin_user where is_active = 1 and is_deleted = 0 and
        email_id = ? ";

        $paramType = "s";
        $paramValue = array(
            $email_id
        );
        
        $result = $this->db_handle->runQuery($query, $paramType, $paramValue);

        if(!empty($result)){
            if(password_verify($password,$result[0]['password']))
                $status = $result[0]['admin_id'];
        }
        return $status;
       
    }

    function createAdminUser($name,$email_id,$role_id,$password){
        
        $insertId=0; 

        //Check whether user exit and not deleted (is_delete = 0) 
        $query = "select admin_id from admin_user where  is_deleted = 0 and
        email_id = ? ";
        $paramType = "s";
        $paramValue = array(
            $email_id
        );
        $resultset = $this->db_handle->runQuery($query, $paramType, $paramValue);
        
        if(empty($resultset)) { //IF resultset is empty then user doesn't exist
            $password = password_hash($password, PASSWORD_DEFAULT);
            $query = "INSERT INTO admin_user (name, email_id, role_id, password, doc) VALUES (?,?,?,?,NOW())";
            $paramType = "ssis";
            $paramValue = array(
                $name,$email_id,$role_id,$password
            );
            $insertId = $this->db_handle->insert($query, $paramType, $paramValue);
        }
        return $insertId; // If 0 then user cannot be created or than 0 user created.

    }






}



?>