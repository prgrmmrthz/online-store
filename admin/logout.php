<?php
session_start();
unset($_SESSION["loggedin"]);
unset($_SESSION["username"]);
unset($_SESSION["accesslevel"]);
header("Location: ../login.php");
?>