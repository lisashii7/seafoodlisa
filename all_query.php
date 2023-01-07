<!-- // DISINI KUMPULAN QUERYNYA -->


<?php include 'function.php';?>

<!-- JOIN FOR PENAWARAN -->

<?php
	$joinPenawaran = mysqli_query($db, "SELECT * FROM penawaran 
	INNER JOIN pegawai ON penawaran.id_pegawai=pegawai.id_pegawai");
?>


<!-- JOIN FOR PEMESANAN -->
<?php
	$joinPemesanan = mysqli_query($db, "SELECT * FROM pemesanan  
    INNER JOIN pegawai ON pemesanan.id_pegawai=pemesanan.id_pegawai
    INNER JOIN calon_konsumen ON calon_konsumen.id_calon_konsumen=pemesanan.id_calon_konsumen");
?>


<!-- JOIN FOR PEMBAYARAN -->
<?php
	$joinPembayaran = mysqli_query($db, "SELECT * FROM pembayaran 
	INNER JOIN pegawai ON pegawai.id_pegawai=pembayaran.id_pegawai");
?>
