<!-- INI UPDATE -->

<?php
include 'function.php';
if(isset($_POST['updPembayaran'])){
    $id = $_POST['id_pembayaran'];
    $status_pembayaran=$_POST['status_pembayaran'];

    $sql= "UPDATE pembayaran SET status_pembayaran='$status_pembayaran' WHERE id_pembayaran='$id'";
    $result=mysqli_query($db, $sql);

    if($result){
        header("Location:pembayaran.php?pesan=update_sukses");
    }
}
?>