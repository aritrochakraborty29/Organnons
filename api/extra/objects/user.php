<?php
class User{

	// datase connection and table name
	private $conn;
	private $table_name = "admin_users";

	// object properties
	public $id;
	public $username;
	public $password;

	// constructor with $db as database connection
	public function __construct($db){
		$this->conn = $db;
	}
	// signup user
	function signup(){

		if($this->isAlreadyExist()){
			return false;
		}
		// query to insert record
		$query = "INSERT INTO
					" . $this->table_name . "
				set 
					id=:id
					username=:username,
						password=:password";

		// prepare query
		$stmt = $this->conn->prepare($query);

		// sanitize
		$this->id=htmlspecialchars(strip_tags($this->id));
		$this->username=htmlspecialchars(strip_tags($this->username));
		$this->password=htmlspecialchars(strip_tags($this->password));

		// bind values
		$stmt->bindParam(":id", $this->id);
		$stmt->bindParam(":username", $this->username);
		$stmt->bindParam(":password", $this->password);

		//execute query
		if($stmt->execute()){
			$this->id = $this->conn->lastInsertId();
			return true;
		}
		return false;

	}

//login user
function login(){
	//select all query
	$query = "SELECT `id`,`username`,`password` 
				FROM 
					" . $this->table_name . "
				WHERE
					username='".$this->username."' 
						AND password ='".$this->password."'";
	// prepared query staement
	$stmt = $this->conn->prepared($query);
	// execute query
	$stmt->execute();
	return $stmt;
}
function isAlreadyExist(){
	$query = "SELECT * 
			FROM
			" . $this->table_name . "
			WHERE
				username='".$this->username."'";
	// prepared query statement
	$stmt = $this->conn->prepare($query);
	// execute query
	$stmt->execute();
	if($stmt->rowCount() > 0){
		return true;
	}
	else{
		return false;
	}
}
}