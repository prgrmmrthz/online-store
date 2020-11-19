
<?php
    session_start();
    if(!isset($_SESSION['loggedin']) || !isset($_SESSION['accesslevel'])) {
        
        header('Location: http://localhost/capstone');
        exit();
    }
?>