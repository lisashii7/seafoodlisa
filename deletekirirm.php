<?php
include 'function.php';
if(isset($_GET['deleteid'])){
    $no_resi=$_GET['deleteid'];

    $sql="delete from 'pengiriman' where id=$no_resi";
    $result=mysqli_query($db,$sql);
    if($result){
        header('location:pengiriman.php');
    }else {
        die(mysqli_connect_error($db));
    }
}
?>