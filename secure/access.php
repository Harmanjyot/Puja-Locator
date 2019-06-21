<?php

class access {
	var $host   = null;
	var $user   = null;
	var $pass   = null;
	var $uname   = null;
	var $conn   = null;
	var $result = null;

	function __construct($dbhost, $dbuser, $dbpass, $dbname) {
		$this->host = $dbhost;
		$this->user = $dbuser;
		$this->pass = $dbpass;
		$this->uname = $dbname;

	}

	//open connection

	public function connect() {

		//establish connection

		$this->conn = new mysqli($this->host, $this->user, $this->pass, $this->uname);

		if (mysqli_connect_errno()) {
			echo "Could not connect to Puja Locator";
		}


		$this->conn->set_charset("utf8");

	}

	public function disconnect() {
		if ($this->conn !=null) {

			$this->conn->close();
		}

	}


	public function registerUser($name, $emailID, $phoneNo, $city)
	{
		$sql = "INSERT INTO userRegistration SET (name=?, emailID=?, phoneNo=?, city=?)";
		$statement = $this->conn->prepare($sql);

		if (!$statement) {
			throw new Exception($statement->error);

		}


		$statement->bind_param("ssis", $name, $emailID, $phone, $city);
		
		$returnValue = $statement->execute();
		return $returnValue;
	}

	public function selectUser($emailID) {
		$sql = "SELECT * FROM userRegistration WHERE emailID='".$emailID."'";
		$result = $this->conn->query($sql);

		if ($result != null && (mysqli_num_rows($result) >= 1)) {
			
			$row = $result->fetch_array(MYSQL_ASSOC);

			if (!empty($row)) {
				$returnArray = $row;
			}
		}


		return $returnArray;
	}


}

?>


































