<?php include 'function.php';?>

<?php
	$ambilID = $_GET['id_pembayaran'];
	$queryEdit = mysqli_query($db, "SELECT * FROM pembayaran 
    INNER JOIN pegawai ON pegawai.id_pegawai=pembayaran.id_pegawai WHERE id_pembayaran=$ambilID");
    $pembayaranAmbil   = mysqli_fetch_array($queryEdit);
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
        <form method="post" action="updatepembayaran.php">
            <div class="form-group">
                <label>NAMA PEGAWAI</label>
                <input type="hidden" name="id_pembayaran" value="<?php echo $pembayaranAmbil['id_pembayaran'];?>">
                <div>
                    <input type="text" name="nama_pegawai" class="form-control" value="<?php echo $pembayaranAmbil['nama_pegawai'];?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>TANGGAL PEMBAYARAN</label>
                <div>
                    <input type="datetime" name="tgl_pembayaran" class="form-control" value="<?php echo date($pembayaranAmbil['tgl_pembayaran']);?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>BUKTI PEMBAYARAN</label>
                <div>
                    <input type="text" name="bukti_pembayaran" class="form-control" value="<?php echo $pembayaranAmbil['bukti_pembayaran'];?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>JENIS PEMBAYARAN</label>
                <div>
                    <input type="text" name="jenis_pembayaran" class="form-control" value="<?php echo $pembayaranAmbil['jenis_pembayaran'];?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>TOTAL PEMBAYARAN</label>
                <div>
                    <input type="text" name="total_pembayaran" class="form-control" value="Rp. <?php echo number_format($pembayaranAmbil['total_pembayaran']);?>" disabled>
                </div>
            </div></br>

            <div class="form-group">
                <label>STATUS PEMBAYARAN</label>
                <div>
                    <?php $selectCat = $pembayaranAmbil['status_pembayaran']; ?>
                                                <select name="status_pembayaran" id="status_pembayaran" class="form-control">
                                                    <option <?php echo ($selectCat == 'lunas') ? "selected": ""?>>lunas</option>
                                                    <option <?php echo ($selectCat == 'pending') ? "selected": ""?>>pending</option>
                                                </select>
                </div>
            </div></br>

            <button type="submit" class="btn btn-primary"  name="updPembayaran">Update</button>

        </form>
    </div>


</body>

</html>