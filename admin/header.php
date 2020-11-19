
<?php
    session_start();
    if(!isset($_SESSION['loggedin']) || !isset($_SESSION['accesslevel']) || $_SESSION['accesslevel'] != 2) {
        
        header('Location: http://localhost/capstone');
        exit();
    }
?>