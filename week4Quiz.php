<?php 

	require "conn.php";

	$week4Score = htmlentities($_REQUEST["week4Score"]);
	$emailID = htmlentities($_REQUEST["emailID"]);
	$phoneNo = htmlentities($_REQUEST["phoneNo"]);

	$mysqlQuery = "SELECT userID FROM userRegistration WHERE emailID = '$emailID' and phoneNo = '$phoneNo'";
	$result = mysqli_query($conn, $mysqlQuery);
	$row = $result->fetch_assoc();
	$uid = (int)$row['userID'];


	$mysqlQuery = "UPDATE quizDetails SET week4Score = '$week4Score', totalScore = week1Score + week2Score + week3Score + '$week4Score', week4Time = now() WHERE userID = '$uid'";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Altered for Week 4";
	}
	else {
		echo "Some error occured for week 4!".$mysqlQuery."<br>".$conn->error;
	}

	$conn->close();

?>