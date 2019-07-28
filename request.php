<?php 
	require "conn.php";

	$name = htmlentities($_REQUEST["textReqname"]);
	$area = htmlentities($_REQUEST["area"]);
	$phoneNo = htmlentities($_REQUEST["phoneNo"]);
	$venue = htmlentities($_REQUEST["venue"]);
	$date = htmlentities($_REQUEST["date"]);
	$puja = htmlentities($_REQUEST["puja"]);

	$emailID = htmlentities($_REQUEST["emailID"]);
	$phoneNoLog = htmlentities($_REQUEST["phoneNoLog"]);

	$mysqlQuery = "SELECT userID FROM userRegistration WHERE emailID = '$emailID' and phoneNo = '$phoneNoLog'";
	$result = mysqli_query($conn, $mysqlQuery);
	$row = $result->fetch_assoc();
	$uid = (int)$row['userID'];


	$mysqlQuery = "INSERT INTO pujaSchedule (userID, Name, DateandTime, Area, Venue, PujaName, MobileNo, timeRequested) VALUES ('$uid', '$name', '$date', '$area', '$venue' , '$puja', '$phoneNo' , now())";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Week 1 successfull";
	}
	else {
		echo "Some error occured for week 1!".$mysqlQuery."<br>".$conn->error;
	}

	$conn->close();

?>