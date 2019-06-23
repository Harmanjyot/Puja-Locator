<?php 

	require "conn.php";

	$week2Score = htmlentities($_REQUEST["week2Score"]);
	$emailID = htmlentities($_REQUEST["emailID"]);
	$phoneNo = htmlentities($_REQUEST["phoneNo"]);

	$mysqlQuery = "SELECT userID FROM userRegistration WHERE emailID = '$emailID' and phoneNo = '$phoneNo'";
	$result = mysqli_query($conn, $mysqlQuery);
	$row = $result->fetch_assoc();
	$uid = (int)$row['userID'];


	$mysqlQuery = "UPDATE quizDetails SET week2Score = '$week2Score', totalScore = week1Score + '$week2Score', week2Time = now() WHERE userID = '$uid'";
	if ($conn->query($mysqlQuery) === TRUE) {
		echo "Altered for Week 2";
	}
	else {
		echo "Some error occured for week 2!".$mysqlQuery."<br>".$conn->error;
	}

	$conn->close();

?>