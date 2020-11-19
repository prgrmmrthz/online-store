<?php

//fetch_data.php

$connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

$method = $_SERVER['REQUEST_METHOD'];

if($method == "POST")
{
  session_start();
  //pproduct int,puser int
  $product= $_POST['product'];
  $user= $_SESSION['userId'];

 $sql = "CALL addToCart(".$product.",".$user.")";
 $q = $connect->query($sql);
 $q->setFetchMode(PDO::FETCH_ASSOC);
 //echo $q;
}
?>