<?php 
$request_method = $_SERVER['REQUEST_METHOD'];
$response = array();
// echo $request_method;
switch ($request_method) {
	case "GET":
		response(doGet());
	break;
	case "POST":
		response(doPost());
	break;
	case "DELETE":
		response(doDelete());
	break;
	case "PUT":
		response(doPut());
	break;
}

function doGet(){

	if (@$_GET['id']){
		@$id = $_GET['id'];
		$where = "where id =".$id;
	}else{
		$id=0;
		$where = "";
	}


	$dbconnect = mysqli_connect("localhost","root","","ecom");
	$query = mysqli_query($dbconnect,"select * from admin_users ".$where);
	while($data = mysqli_fetch_assoc($query)){
		$response[] = array("id"=>$data['id'],"username"=>$data['username'],"password"=>$data['password']);
	}
	return $response;

}
function doPost(){
	if (@$_POST){
		$dbconnect = mysqli_connect("localhost","root","","ecom");
		$query = mysqli_query($dbconnect,"INSERT INTO admin_users (id,username,password) values('".$_POST['id']."','".$_POST['username']."','".$_POST['password']."')");
		if ($query == true){
			$response = array("message"=>"success INSERT");
		}else{
			$response = array("message"=>"failed");
		}
		
	}
	return $response;
}
function doDelete(){
	if ($_GET['id']){
		$dbconnect = mysqli_connect("localhost","root","","ecom");
		$query = mysqli_query($dbconnect,"DELETE from admin_users where id='".$_GET['id']."'");
		if ($query == true){
			$response = array("message"=>"success DELETE");
		}else{
			$response = array("message"=>"failed");
		}
		
	}
	return $response;
}
function doPut(){
	parse_str(file_get_contents('php://input'),$_PUT);
	// print_r($_PUT);
	if ($_PUT){
		$dbconnect = mysqli_connect("localhost","root","","ecom");
		$query 	   = mysqli_query($dbconnect,"UPDATE admin_users SET 
							username = '".$_PUT['username']."',
							password = '".$_PUT['password']."'
					WHERE id = '".$_GET['id']."'
					");
		if ($query == true){
			$response = array("message"=>"success UPDATE");
		}else{
			$response = array("message"=>"failed");
		}
		
	}
	return $response;
}

//output
function response($response){
echo json_encode(array("status"=>"200","data"=>$response));
 }
 ?>
