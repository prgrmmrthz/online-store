<?php
$connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");
// File name
$filename = $_FILES['file']['name'];
$productId=$_POST['productId'];

// Valid file extensions
$valid_extensions = array("jpg","jpeg","png","pdf");

// File extension
$extension = pathinfo($filename, PATHINFO_EXTENSION);

// Check extension
if(in_array(strtolower($extension),$valid_extensions) ) {

   // Upload file
   if(move_uploaded_file($_FILES['file']['tmp_name'], "uploads/".$filename)){

        echo $productId ;
       
        $conn = new mysqli('localhost', 'root', '', 'capstone');
        // Check connection
        if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
        }

        $sql = "UPDATE products SET pix='$filename' WHERE id=".$productId;

        if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
        } else {
        echo "Error updating record: " . $conn->error;
        }

        $conn->close();

   }else{
      echo 0;
   }
}else{
   echo 0;
}

exit;
?>