<?php 
    include_once('config.php');

    ob_start();
    session_start();
    if(isset($_POST['username']) && isset($_POST['pword'])){
        $username=$_POST['username'];
        $pword=$_POST['pword'];

        $sql = "SELECT id,accesslevel from users where username='{$username}' and password='{$pword}'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_row();
            $_SESSION['loggedin'] = true;
            $_SESSION['accesslevel'] =$row[1];
            $_SESSION['username'] = $username;
            $_SESSION['userId'] = $row[0];
            if($row[1]==1){
                header("Location: http://localhost/capstone/store/");
                die();
            }elseif($row[1]==2){
                header("Location: http://localhost/capstone/admin/");
            }
        } else {
            echo "0 results";
        }
        $conn->close();
    }
?>