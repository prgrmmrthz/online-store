<?php
    $connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

    $method = $_SERVER['REQUEST_METHOD'];

    if($method == 'GET')
    {
    
     $query = "SELECT id,name FROM products ORDER BY id DESC";
    
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

    if($method == 'POST')
    {
     $classId= $_POST['classId'];
     //echo $classId;
     if($classId){
        $query = "SELECT id,name,description,price,pix FROM products where classification=".$classId." ORDER BY id DESC";
     }else{
        $query = "SELECT id,name,description,price,pix FROM products where sale=1 ORDER BY id DESC";
     }
     
    
     $statement = $connect->prepare($query);
     $statement->execute();
     $result = $statement->fetchAll();
     if($result){
        foreach($result as $row)
        {
        $output[] = array(
        'id'    => $row['id'],   
        'name'  => $row['name'],
        'description'  => $row['description'],
        'price'  => $row['price'],
        'pix'  => $row['pix']
        );
        }
     }else{
         $output=0;
     }
     header("Content-Type: application/json");
     echo json_encode($output);

    }

    if($method == 'PUT')
    {
        parse_str(file_get_contents("php://input"), $_PUT);
        $data = array(
        ':id'   => $_PUT['id'],
        ':pix' => $_PUT['pix']
        );
        $query = "
        UPDATE products
        SET 
            pix = :pix
        WHERE id = :id
        ";
        $statement = $connect->prepare($query);
        $statement->execute($data);
    }
?>