<?php 

	require "conn.php";

	$week3Score = htmlentities($_REQUEST["week3Score"]);
	$emailID = htmlentities($_REQUEST["emailID"]);
	$phoneNo = htmlentities($_REQUEST["phoneNo"]);

	$mysqlQuery = "SELECT userID FROM userRegistration WHERE emailID = '$emailID' and phoneNo = '$phoneNo'";
	$result = mysqli_query($conn, $mysqlQuery);
	$row = $result->fetch_assoc();
	$uid = (int)$row['userID'];


	$mysqlQuery = "UPDATE quizDetails SET week3Score = '$week3Score', totalScore = week1Score + week2Score + '$week3Score', week3Time = now() WHERE userID = '$uid'";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Altered for Week 3";
	}
	else {
		echo "Some error occured for week 3!".$mysqlQuery."<br>".$conn->error;
	}

	$conn->close();

?>