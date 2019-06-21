<?php

class DbOperation
{
    private $conn;

    //Constructor
    function __construct()
    {
        require_once dirname(__FILE__) . '/Config.php';
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    //Function to create a new usersss
    public function createTeam($name, $emailID, $phoneNo, $city)
    {
        $stmt = $this->conn->prepare("INSERT INTO userRegistration(name, emailID, phoneNo, city) values(?, ?, ?, ?)");
        $stmt->bind_param("ssis", $name, $emailID, $phoneNo, $city);
        $result = $stmt->execute();
        $stmt->close();
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

}