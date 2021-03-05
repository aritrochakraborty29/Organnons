<?php 
$con=mysqli_connect("localhost","root","","ecom");
// if($con){
// 	echo "db connect";
$response = array();
if($con){



	// For the admin_users

	// $sql = "select * from admin_users";
	// $result = mysqli_query($con,$sql);
	// if($result){
	// 	header("Content-Type: JSON");
	// 	$i=0;
	// 	while($row = mysqli_fetch_assoc($result)){
	// 		$response[$i]['id'] = $row['id'];
	// 		$response[$i]['username'] = $row['username'];
	// 		$response[$i]['password'] = $row['password'];
	// 		// $response[$i]['product'] = $row['product'];
	// 		// $response[$i]['users'] = $row['users'];
	// 		$i++;
	// 	}
	// 	echo json_encode($response,JSON_PRETTY_PRINT);
	// }





	//For the categories

	// $sql = "select * from categories";
	// $result = mysqli_query($con,$sql);
	// if($result){
	// 	header("Content-Type: JSON");
	// 	$i=0;
	// 	while($row = mysqli_fetch_assoc($result)){
	// 		$response[$i]['id'] = $row['id'];
	// 		$response[$i]['categories'] = $row['categories'];
	// 		$response[$i]['status'] = $row['status'];
	// 		// $response[$i]['product'] = $row['product'];
	// 		// $response[$i]['users'] = $row['users'];
	// 		$i++;
	// 	}
	// 	echo json_encode($response,JSON_PRETTY_PRINT);
	// }





	//For the contact_us

	// $sql = "select * from contact_us";
	// $result = mysqli_query($con,$sql);
	// if($result){
	// 	header("Content-Type: JSON");
	// 	$i=0;
	// 	while($row = mysqli_fetch_assoc($result)){
	// 		$response[$i]['id'] = $row['id'];
	// 		$response[$i]['name'] = $row['name'];
	// 		$response[$i]['email'] = $row['email'];
	// 		$response[$i]['mobile'] = $row['mobile'];
	// 		$response[$i]['comment'] = $row['comment'];
	// 		$response[$i]['added_on'] = $row['added_on'];
	// 		$i++;
	// 	}
	// 	echo json_encode($response,JSON_PRETTY_PRINT);
	// }





	//For the product

	$sql = "select * from product";
	$result = mysqli_query($con,$sql);
	if($result){
		header("Content-Type: JSON");
		$i=0;
		while($row = mysqli_fetch_assoc($result)){
			$response[$i]['id'] = $row['id'];
			$response[$i]['categories_id'] = $row['categories_id'];
			$response[$i]['name'] = $row['name'];
			$response[$i]['mrp'] = $row['mrp'];
			$response[$i]['price'] = $row['price'];
			$response[$i]['image'] = $row['image'];
			$response[$i]['short_desc'] = $row['short_desc'];
			$response[$i]['description'] = $row['description'];
			$response[$i]['meta_title'] = $row['meta_title'];
			$response[$i]['meta_desc'] = $row['meta_desc'];
			$response[$i]['meta_keyword'] = $row['meta_keyword'];
			$response[$i]['status'] = $row['status'];
			$i++;
		}
		echo json_encode($response,JSON_PRETTY_PRINT);
	}




	//For the users

	// $sql = "select * from users";
	// $result = mysqli_query($con,$sql);
	// if($result){
	// 	header("Content-Type: JSON");
	// 	$i=0;
	// 	while($row = mysqli_fetch_assoc($result)){
	// 		$response[$i]['id'] = $row['id'];
	// 		$response[$i]['name'] = $row['name'];
	// 		$response[$i]['password'] = $row['password'];
	// 		$response[$i]['email'] = $row['email'];
	// 		$response[$i]['mobile'] = $row['mobile'];
	// 		$response[$i]['added_on'] = $row['added_on'];
	// 		$i++;
	// 	}
	// 	echo json_encode($response,JSON_PRETTY_PRINT);
	// }

	
 }
 else{
 	echo "DataBase Connecion failed";
 }
 ?>
 