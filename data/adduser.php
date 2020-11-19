<?php
	include('../config.php');

	if(isset($_POST['submit'])){

		$fname = $_POST['fname'];
		$lname = $_POST['lname'];
		$username = $_POST['uname'];
		$pword = $_POST['pword'];

		$sql = mysqli_query($conn, "INSERT INTO users(username,password,firstName,lastName) VALUES ('$username','$pword','$fname','$lname') ");

		if($sql){
			header("Location: ../index.php");
		}else{
			echo "ERROR: Registration not successful.";
		}
	}
?>