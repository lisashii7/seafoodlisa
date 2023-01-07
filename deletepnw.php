<?php
include 'function.php';
if(isset($_GET['id_penawaran'])){
    $id_penawaran=$_GET['id_penawaran'];

    $sql="delete from penawaran where id_penawaran=$id_penawaran";
    $result=mysqli_query($db,$sql);
    if($result){
        header('location:penawaran.php?pesan=sukses_hapus');
    }else {
        die(mysqli_connect_error($db));
    }
}
?>