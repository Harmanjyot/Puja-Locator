<?php 
	require "conn.php";

	$week1Score = htmlentities($_REQUEST["week1Score"]);
	$emailID = htmlentities($_REQUEST["emailID"]);
	$phoneNo = htmlentities($_REQUEST["phoneNo"]);

	$mysqlQuery = "SELECT userID FROM userRegistration WHERE emailID = '$emailID' and phoneNo = '$phoneNo'";
	$result = mysqli_query($conn, $mysqlQuery);
	$row = $result->fetch_assoc();
	$uid = (int)$row['userID'];


	$mysqlQuery = "INSERT INTO quizDetails (userID, week1Score, week2Score, week3Score, week4Score, totalScore) VALUES ('$uid', '$week1Score', '0', '0', '0', '$week1Score')";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Week 1 successfull";
	}
	else {
		echo "Some error occured for week 1!".$mysqlQuery."<br>".$conn->error;
	}

	$conn->close();

?>