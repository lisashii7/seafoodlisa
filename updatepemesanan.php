<!-- INI UPDATE -->

<?php
include 'function.php';
if(isset($_POST['updPemesanan'])){
    $id = $_POST['pemesanan_id'];
    $status_pemesanan=$_POST['status_pemesanan'];

    $sql= "UPDATE pemesanan SET status_pemesanan='$status_pemesanan' WHERE pemesanan_id='$id'";
    $result=mysqli_query($db, $sql);

    if($result){
        header("Location:pemesanan.php?pesan=update_sukses");
    }
}
?>