<?php

//creating response array
$response = array();

if($_SERVER['REQUEST_METHOD']=='POST'){

    //getting values

    // if (isset($_POST[`name`]))
        $name = $_POST['name'];
    
    // if (isset($_POST[`emailID`]))
        $emailID = $_POST['emailID'];

    // if (isset($_POST[`phoneNo`]))
        $phoneNo = $_POST['phoneNo'];

    // if (isset($_POST[`city`]))
        $city = $_POST["city"];
    
    
    

    //including the db operation file
    require_once '../includes/DbOperation.php';

    $db = new DbOperation();

    //inserting values 
    if($db->createTeam($name,$emailID, $phoneNo, $city)){
        $response['error']=false;
        $response['message']='Team added successfully';
    }else{

        $response['error']=true;
        $response['message']='Could not add team';
    }

}else{
    $response['error']=true;
    $response['message']='You are not authorized';
}
echo json_encode($response);