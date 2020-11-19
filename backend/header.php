<html>
<?php
    session_start();
    if(!isset($_SESSION['loggedin']) || !isset($_SESSION['accesslevel']) || $_SESSION['accesslevel'] != 2) {
        echo "<script type='text/javascript'>alert('You are not an Admin!');</script>";
        header('Location: http://localhost/capstone');
        exit();
    }
?>
</html>