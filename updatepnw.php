<?php include 'function.php';?>

<?php
	$ambilID = $_GET['id_penawaran'];
	$queryEdit = mysqli_query($db, "SELECT * FROM penawaran WHERE id_penawaran=$ambilID");
    $penawaranAmbil   = mysqli_fetch_array($queryEdit);
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

    <title>Update Penawaran</title>
</head>

<body>
    <br>
    <br>
    <center><h3>Update Penawaran</h3></center>
    <div class="container my-5">
        <form method="post" action="prosesupdatepnw.php">
            <div class="form-group">
                <label>Id katalog</label>
                <input type="hidden" name="id_penawaran" value="<?php echo $penawaranAmbil['id_penawaran'];?>">
                <div>
                    <select name="id_katalog" id="id_katalog" class="form-control">
                        <?php
                            include 'function.php';
                            $getIDKatalog = mysqli_query($db, "SELECT * FROM detail_katalog");
                            while ($selectKatalog = mysqli_fetch_array($getIDKatalog)){
                        ?>
                        <option value="<?php echo $selectKatalog['id_katalog']; ?>" >
                        <?php echo $selectKatalog['id_katalog']; ?></option>
                        <?php
                            }
                        ?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label>Id pegawai</label>
                <div>
                    <select name="id_pegawai" id="id_pegawai" class="form-control">
                        <?php
                            include 'function.php';
                            $getPegawai = mysqli_query($db, "SELECT * FROM pegawai");
                            while ($selectPegawai = mysqli_fetch_array($getPegawai)){
                        ?>
                        <option value="<?php echo $selectPegawai['id_pegawai']; ?>" >
                        <?php echo $selectPegawai['nama_pegawai']; ?></option>
                        <?php
                            }
                        ?>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label>Tgl penawatan</label>
                <input type="date" class="form-control" name="tgl_penawaran" id="tgl_penawaran">
            </div>
            <button type="submit" class="btn btn-primary"  name="updPenawaran">Submit</button>

        </form>
    </div>


</body>

</html>