<?php
include 'function.php';
if (isset($_POST['submit'])) {
    $id_katalog = $_POST['id_katalog'];
    $id_pegawai = $_POST['id_pegawai'];
    $tgl_penawaran = $_POST['tgl_penawaran'];

    $sql = "insert into penawaran(id_katalog,id_pegawai,tgl_penawaran) values('$id_katalog','$id_pegawai','$tgl_penawaran')";

    $result = mysqli_query($db, $sql);

    if ($result) {
        header("Location:penawaran.php?pesan=sukses");
    }
}
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>SEAFOOD</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
</head>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>Tambah Penawaran</title>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.php">SEAFOOD</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Menu</div>
                        <a class="nav-link" href="index.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            <b>Penawaran</b>
                        </a>
                        <a class="nav-link" href="pemesanan.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Pemesanan
                        </a>
                        <a class="nav-link" href="pembayaran.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Pembayaran
                        </a>
                        <a class="nav-link" href="pengiriman.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Pengiriman
                        </a>

            </nav>

        </div>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Tambah Penawaran</h1>
                    <form method="post">
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <label>Id katalog</label>
                                    <div>
                                        <select name="id_katalog" id="id_katalog" class="form-control">
                                            <?php
                                            include 'function.php';
                                            $getIDKatalog = mysqli_query($db, "SELECT * FROM detail_katalog");
                                            while ($selectKatalog = mysqli_fetch_array($getIDKatalog)) {
                                            ?>
                                                <option value="<?php echo $selectKatalog['id_katalog']; ?>">
                                                    <?php echo $selectKatalog['id_katalog']; ?></option>
                                            <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Nama pegawai</label>
                                <div>
                                    <select name="id_pegawai" id="id_pegawai" class="form-control">
                                        <?php
                                        include 'function.php';
                                        $getPegawai = mysqli_query($db, "SELECT * FROM pegawai");
                                        while ($selectPegawai = mysqli_fetch_array($getPegawai)) {
                                        ?>
                                            <option value="<?php echo $selectPegawai['id_pegawai']; ?>">
                                                <?php echo $selectPegawai['nama_pegawai']; ?></option>
                                        <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Tgl penawaran</label>
                                <input type="date" class="form-control" placeholder="Masukkan tanggal" name="tgl_penawaran" id="tgl_penawaran">
                            </div>
                            <button type="submit" class="btn btn-primary" name="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>

</body>

</html>