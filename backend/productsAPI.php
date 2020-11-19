<?php

//fetch_data.php

$connect = new PDO("mysql:host=localhost;dbname=capstone", "root", "");

$method = $_SERVER['REQUEST_METHOD'];

if($method == 'GET')
{
 $data = array(
  ':name'   => "%" . $_GET['name'] . "%",
  ':price'  => $_GET['price'],
  ':classification'  => $_GET['classification'],
  ':description'  => $_GET['description'],
  ':sale'  => $_GET['sale']
 );
 $query = "SELECT * FROM products";


 $statement = $connect->prepare($query);
 $statement->execute($data);
 $result = $statement->fetchAll();
 foreach($result as $row)
 {
  $output[] = array(
   'id'    => $row['id'],   
   'name'  => $row['name'],
   'price'  => $row['price'],
   'classification'  => $row['classification'],
   'description'  => $row['description'],
   'sale'  => $row['sale']
  );
 }
 header("Content-Type: application/json");
 echo json_encode($output);
}

if($method == "POST")
{
 $data = array(
  ':name'  => $_POST['name'],
    ':price'  => $_POST['price'],
   ':classification'  => $_POST['classification'],
   ':description'  => $_POST['description'],
   ':sale'  => $_POST['sale']
 );

 $query = "INSERT INTO products (name,price,classification,description,sale) VALUES (:name,:price,:classification,:description,:sale)";
 $statement = $connect->prepare($query);
 $statement->execute($data);
}

if($method == 'PUT')
{
 parse_str(file_get_contents("php://input"), $_PUT);
 $data = array(
  ':id'   => $_PUT['id'],
  ':name' => $_PUT['name'],
  ':price'  => $_PUT['price'],
  ':classification'  => $_PUT['classification'],
  ':description'  => $_PUT['description'],
  ':sale'  => $_PUT['sale']
 );
 $query = "
 UPDATE products
 SET name = :name,
 price = :price,
 classification = :classification,
 description = :description,
 sale = :sale
 WHERE id = :id
 ";
 $statement = $connect->prepare($query);
 $statement->execute($data);
}

if($method == "DELETE")
{
 parse_str(file_get_contents("php://input"), $_DELETE);
 $query = "DELETE FROM products WHERE id = '".$_DELETE["id"]."'";
 $statement = $connect->prepare($query);
 $statement->execute();
}

?>