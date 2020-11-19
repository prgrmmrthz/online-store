<?php
    $connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

    $method = $_SERVER['REQUEST_METHOD'];
    
    if($method == 'GET')
    {
    session_start();
     $query = "SELECT firstName,lastName,email,contact FROM users where id=".$_SESSION['userId'];
    
     $statement = $connect->prepare($query);
     $statement->execute();
     $result = $statement->fetchAll();
     if($result){
        foreach($result as $row)
        {
         $output[] = array(
          'firstName'    => $row['firstName'],   
          'lastName'  => $row['lastName'],
          'email'  => $row['email'],
          'contact'  => $row['contact']
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