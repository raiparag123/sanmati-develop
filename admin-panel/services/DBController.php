<?php
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

class DBController {
    
  
    private $conn;

    function __construct() {
        
        $this->conn = $this->connectDB();
    }   
    
    function connectDB() {
        
        if($_SERVER['SERVER_NAME'] == 'localhost') {
            $host = "localhost";
            $user = "root";
            $password = "root";
            $database = "u990700695_sanmati";
       }
       else{
            $host = "localhost";
            $user = "u990700695_dbuser_sanmati";
            $password = "Qwer123#";
            $database = "u990700695_sanmati";
       }
        $conn = mysqli_connect($host,$user,$password,$database);
        return $conn;
    }
    
    function runBaseQuery($query) {
        $result = $this->conn->query($query);   
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $resultset[] = $row;
            }
        }
        return $resultset;
    }
    
    
    
    function runQuery($query, $param_type, $param_value_array) {
        $sql = $this->conn->prepare($query);
        $this->bindQueryParams($sql, $param_type, $param_value_array);
        $sql->execute();
        $result = $sql->get_result();
        
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $resultset[] = $row;
            }
        }
        
        if(!empty($resultset)) {
            return $resultset;
        }
    }
    
    function bindQueryParams($sql, $param_type, $param_value_array) {
        $param_value_reference[] = & $param_type;
        for($i=0; $i<count($param_value_array); $i++) {
            $param_value_reference[] = & $param_value_array[$i];
        }
        call_user_func_array(array(
            $sql,
            'bind_param'
        ), $param_value_reference);
    }
    
    function insert($query, $param_type, $param_value_array) {
        $sql = $this->conn->prepare($query);
        $this->bindQueryParams($sql, $param_type, $param_value_array);
        $sql->execute();
        $insertId = $sql->insert_id;
        return $insertId;
    }
    
    function update($query, $param_type, $param_value_array) {
        $sql = $this->conn->prepare($query);
        $this->bindQueryParams($sql, $param_type, $param_value_array);
        $sql->execute();
        //$rowCount = $sql->rowCount();
        //return $rowCount;
    }
}
?>