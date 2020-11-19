<?php
$servername = "localhost";
$username = "root";
$password = "";
$db = "capstone";

// Create connection
$conn = new mysqli($servername, $username, $password, $db);

// Check connection
if (mysqli_connect_error()) {
  die("Connection failed: " . $conn->connect_error);
}
?> 