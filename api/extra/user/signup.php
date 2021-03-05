<?php

// get database connection
include_once '../config/database.php';

// instantiate user object
include_once '../objects/user.php';

$database = new Database();
$db = $database->getConnection();

$user = new User($db);

//set user property values
$user->id = $_POST['id'];
$user->username = $_POST['username'];
$user->password = base64_encode($_POST['password']);

// create the user
if($user->signup()){
	$user_arr=array(
		"status" => true,
		"message" => "succesfully signup!",
		"id" => $user->username
	);
}
else{
	$user_arr = array(
		"status" => false,
		"message" => "username already exists!"
	);
}
print_r(json_encode($user_arr));
?>