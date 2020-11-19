<?php
    $connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

    $method = $_SERVER['REQUEST_METHOD'];
    
    if($method == 'GET')
    {
    session_start();
     $query = "SELECT c.id,c.product as productId, c.quantity, p.name, p.pix, p.price  FROM cart c left join products p on p.id=c.product where user=".$_SESSION['userId'];
    
     $statement = $connect->prepare($query);
     $statement->execute();
     $result = $statement->fetchAll();
     if($result){
        foreach($result as $row)
        {
         $output[] = array(
          'id'    => $row['id'],   
          'name'  => $row['name'],
          'productId'  => $row['productId'],
          'quantity'  => $row['quantity'],
          'pix'  => $row['pix'],
          'price'  => $row['price']
         );
        }
     }else{
         $output=[];
     }
     header("Content-Type: application/json");
     echo json_encode($output);
    }//get

    if($method == "POST")
    {
        $query = "DELETE FROM cart WHERE id = ".$_POST["data"];
        $statement = $connect->prepare($query);
        $statement->execute();
    }//delete
?>