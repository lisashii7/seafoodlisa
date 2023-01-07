<?php include 'function.php';?>

<?php
	$ambilID = $_GET['pemesanan_id'];
	$queryEdit = mysqli_query($db, "SELECT * FROM pemesanan  
    INNER JOIN pegawai ON pemesanan.id_pegawai=pemesanan.id_pegawai
    INNER JOIN calon_konsumen ON calon_konsumen.id_calon_konsumen=pemesanan.id_calon_konsumen WHERE pemesanan_id=$ambilID");
    $pemesananAmbil   = mysqli_fetch_array($queryEdit);
?>

<?php
if ( mysqli_num_rows($queryEdit) < 1){
    die("Data yang anda edit tidak tersedia, cek kembali data anda");
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

    <title>Update Pemesanan</title>
</head>

<body>
    <br>
    <br>
    <center><h3>Update Pemesanan</h3></center>
    <div class="container my-5">
        <form method="post" action="updatepemesanan.php">
            <div class="form-group">
                <label>NAMA PEGAWAI</label>
                <input type="hidden" name="pemesanan_id" value="<?php echo $pemesananAmbil['pemesanan_id'];?>">
                <div>
                    <input type="text" name="nama_pegawai" class="form-control" value="<?php echo $pemesananAmbil['nama_pegawai'];?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>NAMA CALON KONSUMEN</label>
                <div>
                    <input type="text" name="nama_calon_konsumen" class="form-control" value="<?php echo $pemesananAmbil['nama_calon_konsumen'];?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>TANGGAL PEMESANAN</label>
                <div>
                    <input type="datetime" name="tgl_pemesanan" class="form-control" value="<?php echo date($pemesananAmbil['tgl_pemesanan']);?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>STATUS PEMESANAN</label>
                <div>
                    <?php $selectCat = $pemesananAmbil['status_pemesanan']; ?>
                                                <select name="status_pemesanan" id="status_pemesanan" class="form-control">
                                                    <option <?php echo ($selectCat == 'menunggu konfirmasi') ? "selected": ""?>>menunggu konfirmasi</option>
                                                    <option <?php echo ($selectCat == 'Ditolak') ? "selected": ""?>>Ditolak</option>
                                                    <option <?php echo ($selectCat == 'Diterima') ? "selected": ""?>>Diterima</option>
                                                </select>
                </div>
            </div></br>

            <button type="submit" class="btn btn-primary"  name="updPemesanan">Update</button>

        </form>
    </div>


</body>

</html>