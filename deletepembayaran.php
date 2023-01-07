<?php
include 'function.php';
if(isset($_GET['id_pembayaran'])){
    $id_pembayaran=$_GET['id_pembayaran'];

    $sql="delete from pembayaran where id_pembayaran=$id_pembayaran";
    $result=mysqli_query($db,$sql);
    if($result){
        header('location:pembayaran.php?pesan=sukses_hapus');
    }else {
        die(mysqli_connect_error($db));
    }
}
?>