<?php 

require "conn.php";

$name = htmlentities($_REQUEST["name"]);
$emailID = htmlentities($_REQUEST["emailID"]);
$phoneNo = htmlentities($_REQUEST["phoneNo"]);
$city = htmlentities($_REQUEST["city"]);

$mysqlQuery = "SELECT * FROM userRegistration WHERE phoneNo like '$phoneNo' OR emailID LIKE '$emailID';";
$result = mysqli_query($conn, $mysqlQuery);
if (mysqli_num_rows($result) > 0) {
	echo "EXISTS";
}
else {
	echo "Does NOT exist";
	$mysqlQuery = "INSERT INTO userRegistration (name, emailID, phoneNo, city) VALUES ('$name', '$emailID', '$phoneNo', '$city')";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Registered successfully!";
	}
	else {
		echo "Some error occured!".$mysqlQuery."<br>".$conn->error;
	}
	
}
$conn->close();

 ?>