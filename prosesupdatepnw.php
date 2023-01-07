<!-- INI UPDATE -->

<?php
include 'function.php';
if(isset($_POST['updPenawaran'])){
    $id = $_POST['id_penawaran'];
    $id_katalog=$_POST['id_katalog'];
    $id_pegawai=$_POST['id_pegawai'];
    $tgl_penawaran=$_POST['tgl_penawaran'];

    $sql= "UPDATE penawaran SET id_katalog='$id_katalog', id_pegawai='$id_pegawai', tgl_penawaran='$tgl_penawaran' WHERE id_penawaran='$id'";
    $result=mysqli_query($db, $sql);

    if($result){
        header("Location:penawaran.php?pesan=update_sukses");
    }
}
?>