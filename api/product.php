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
	$query = mysqli_query($dbconnect,"select * from product ".$where);
	while($data = mysqli_fetch_assoc($query)){
		$response[] = array("id"=>$data['id'],"categories_id"=>$data['categories_id'],"name"=>$data['name'],"mrp"=>$data['mrp'],"price"=>$data['price'],"qty"=>$data['qty'],"image"=>$data['image'],"short_desc"=>$data['short_desc'],"description"=>$data['description'],"meta_title"=>$data['meta_title'],"meta_desc"=>$data['meta_desc'],"meta_keyword"=>$data['meta_keyword'],"status"=>$data['status']);
	}
	return $response;

}
function doPost(){
	if (@$_POST){
		$dbconnect = mysqli_connect("localhost","root","","ecom");
		$query = mysqli_query($dbconnect,"INSERT INTO product (id,categories_id,name,mrp,price,qty,image,short_desc,description,meta_title,meta_desc,meta_keyword,status) values('".$_POST['id']."','".$_POST['categories_id']."','".$_POST['name']."','".$_POST['mrp']."','".$_POST['price']."','".$_POST['qty']."','".$_POST['image']."','".$_POST['short_desc']."','".$_POST['description']."','".$_POST['meta_title']."','".$_POST['meta_desc']."','".$_POST['meta_keyword']."','".$_POST['status']."')");
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
		$query = mysqli_query($dbconnect,"DELETE from product where id='".$_GET['id']."'");
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
		$query 	   = mysqli_query($dbconnect,"UPDATE product SET 
							categories_id = '".$_PUT['categories_id']."',
							name = '".$_PUT['name']."',
							mrp = '".$_PUT['mrp']."',
							price = '".$_PUT['price']."',
							qty = '".$_PUT['qty']."',
							image = '".$_PUT['image']."',
							short_desc = '".$_PUT['short_desc']."',
							description = '".$_PUT['description']."',
							meta_title = '".$_PUT['meta_title']."',
							meta_desc = '".$_PUT['meta_desc']."',
							meta_keyword = '".$_PUT['meta_keyword']."',
							status = '".$_PUT['status']."'
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
