<?php 
    include_once('config.php');


        $sql = "SELECT id,name from classification";
        $result = $conn->query($sql);
        

        if ($result->num_rows > 0) {
            $posts_arr=array();
            $posts_arr=array();
            while($row=$result->fetch_assoc()){
                $post_item=array(
                    'id'=>$row['id'],
                    'name'=>$row['name']
                );
                array_push($posts_arr, $post_item);
            }
            echo json_encode($posts_arr);
        } else {
            echo "0 results";
        }
        $conn->close();
?>