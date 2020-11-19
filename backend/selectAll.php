<?php
    $connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

    $method = $_SERVER['REQUEST_METHOD'];
    
    if($method == 'GET')
    {
     $query = "SELECT * FROM classification ORDER BY id DESC";
    
     $statement = $connect->prepare($query);
     $statement->execute();
     $result = $statement->fetchAll();
     foreach($result as $row)
     {
      $output[] = array(
       'id'    => $row['id'],   
       'name'  => $row['name'],
      );
     }
     header("Content-Type: application/json");
     echo json_encode($output);
    }
?>