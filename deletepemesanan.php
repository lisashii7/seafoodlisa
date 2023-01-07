<?php
include 'function.php';
if(isset($_GET['pemesanan_id'])){
    $pemesanan_id=$_GET['pemesanan_id'];

    $sql="delete from pemesanan where pemesanan_id=$pemesanan_id";
    $result=mysqli_query($db,$sql);
    if($result){
        header('location:pemesanan.php?pesan=sukses_hapus');
    }else {
        die(mysqli_connect_error($db));
    }
}
?>