<?php
include'function.php';
if(isset($_POST['svPenawwaran'])){
    $id_katalog=$_POST['id_katalog'];
    $id_pegawai=$_POST['id_pegawai'];
    $tgl_penawaran=$_POST['tgl_penawaran'];

    $sql="insert into 'penawaran' (id_kategori, id_pegawai,tgl_penawaran) values('$id_kategori', '$id_pegawai','$tgl_penawaran')";
    $result=mysqli_query($db,$sql);
    if($result){
        echo "data inserted sukses";
    }
}
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>Tambah Penawaran</title>
</head>

<body>
    <br>
    <br>
    <center><h3>Tambah Penawaran</h3></center>
    <div class="container my-5">
        <form method="post">
            <div class="form-group">
                <label>Id katalog</label>
                <input type="text" class="form-control" placeholder="Masukkan id katalog" name="id_katalog" autocomplete="off">
            </div>
            <div class="form-group">
                <label>Id pegawai</label>
                <input type="text" class="form-control" placeholder="Masukkan id pegawai" name="id_pegawai" autocomplete="off">
            </div>
            <div class="form-group">
                <label>Tgl penawatan</label>
                <input type="text" class="form-control" placeholder="Masukkan tanggal" name="tgl_penawaran" autocomplete="off">
            </div>
            <button type="submit" class="btn btn-primary"  name="svPenawwaran">Submit</button>
    </div>


</body>

</html>