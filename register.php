<?php

$name = htmlentities($_REQUEST["name"]);
$emailID    = htmlentities($_REQUEST["emailID"]);
$phoneNo    = htmlentities($_REQUEST["phoneNo"]);
$city     = htmlentities($_REQUEST["city"]);

if (empty($name) || empty($emailID) || empty($phoneNo) || empty($city)) 
{
	$returnArray["status"]  = "400";
	$returnArray["message"] = "Missing required information";
	echo json_encode($returnArray);
	return;
}

$file = parse_ini_file("../../../Puja Locator.ini");


//store information from ini file
$host = trim($file["dbhost"]);
$user = trim($file["dbuser"]);
$pass = trim($file["dbpass"]);
$uname = trim($file["dbname"]);

//access file
require ("secure/access.php");
$access = new access($host, $user, $pass, $uname);
$access->connect();
$result = $access->registerUser($name, $emailID, $phoneNo, $city);

if ($result) {

	$user = $access->selectUser($emailID);

	$returnArray["status"] = "200";
	$returnArray["message"] = "Successfully Registered!";
	$returnArray["userID"] = $user["userID"];
	$returnArray["name"] = $user["name"];
	$returnArray["emailID"] = $user["emailID"];
	$returnArray["phoneNo"] = $user["phoneNo"];
	$returnArray["city"] = $user["city"];
}
else {
	$returnArray["status"] = "400";
	$returnArray["message"] = "Could not register with given information";
}

$access->disconnect();
echo json_encode($returnArray);


?>