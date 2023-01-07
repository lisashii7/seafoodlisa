
//UPDATE nama pegawai
DELIMITER$$
CREATE TRIGGER update_nama_pegawai
BEFORE UPDATE 
ON pegawai
FOR EACH ROW 
BEGIN
INSERT INTO penawaran
SET id_pegawai=new.id_pegawai;
END$$
DELIMITER;

//DELETE id pengiriman
DELIMITER $$

CREATE TRIGGER before_pengiriman_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO pengiriman(no_resi,id_pegawai ,status_pengiriman)
    VALUES(OLD.no_resi,OLD.id_pegawai ,OLD.status_pengiriman);
END$$    

DELIMITER ;

//STORED PROCEDURE
CREATE PROCEDURE SelectAllResi
AS
SELECT * FROM pengiriman
GO;

EXEC SelectAllResi;
CREATE PROCEDURE SelectAllResi @status_pengiriman NVARCHAR(30)
AS
SELECT * FROM pengiriman WHERE status_pengiriman = @status_pengiriman
GO;

EXEC SelectAllResi @status_pengiriman = ‘transit';
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 13, 2022 at 04:59 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cobabaru`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(4) NOT NULL,
  `id_jenis` int(2) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `stok_barang` int(11) DEFAULT NULL,
  `berat_barang` varchar(5) DEFAULT NULL,
  `harga_jual` float(8,2) DEFAULT NULL,
  `gambar_barang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_jenis`, `nama_barang`, `stok_barang`, `berat_barang`, `harga_jual`, `gambar_barang`) VALUES
(6780, 21, 'Baju Dress', 706, '300g', 100000.00, 'gambar 1'),
(6781, 22, 'Slingback', 76, '1000g', 860000.00, 'gambar 2'),
(6782, 23, 'Apel', 100, '50gr', 5000.00, 'gambar 3'),
(6783, 24, 'Nescafe', 34, '50ml', 5000.00, 'gambar 4'),
(6784, 25, 'Chitato', 653, '70gr', 8000.00, 'gambar 5');

-- --------------------------------------------------------

--
-- Table structure for table `calon_konsumen`
--

CREATE TABLE `calon_konsumen` (
  `id_calon_konsumen` int(6) NOT NULL,
  `id_negara` int(4) NOT NULL,
  `nama_calon_konsumen` varchar(50) NOT NULL,
  `email_calon_konsumen` varchar(100) NOT NULL,
  `tgl_penawaran_terakhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calon_konsumen`
--

INSERT INTO `calon_konsumen` (`id_calon_konsumen`, `id_negara`, `nama_calon_konsumen`, `email_calon_konsumen`, `tgl_penawaran_terakhir`) VALUES
(111173, 31, 'Faiq Muntasi', 'Faiq.Muntasi@mail.com', '2021-12-01'),
(111174, 61, 'Ghaffaruddin Mahud', 'Ghaffaruddin.Mahud@gmail.com', '2013-12-09'),
(111175, 62, 'Danita Pramesti', 'Danitapramesti@gmail.com', '2017-08-22'),
(111176, 82, 'Danilla Sarah', 'Danillasarah@gmail.com', '2017-02-20'),
(111177, 966, 'Elvina Selena', 'Elvinaselena@gmail.com', '2012-12-10');

-- --------------------------------------------------------

--
-- Table structure for table `detail_jns_dok`
--

CREATE TABLE `detail_jns_dok` (
  `id_jenis_dokumen` int(2) NOT NULL,
  `no_resi` int(20) NOT NULL,
  `no_dokumen` int(5) NOT NULL,
  `tgl_dokumen_diterima` date NOT NULL,
  `file_path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_jns_dok`
--

INSERT INTO `detail_jns_dok` (`id_jenis_dokumen`, `no_resi`, `no_dokumen`, `tgl_dokumen_diterima`, `file_path`) VALUES
(91, 1973613916, 886541, '2022-01-14', 'berat barang 20kg'),
(92, 1973613917, 886542, '2022-01-15', 'berat barang 10kg'),
(93, 1973613918, 886543, '2022-01-15', 'berat barang 10kg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_katalog`
--

CREATE TABLE `detail_katalog` (
  `id_katalog` int(6) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `jmlh_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_katalog`
--

INSERT INTO `detail_katalog` (`id_katalog`, `id_barang`, `jmlh_barang`) VALUES
(330101, 6780, 3),
(330202, 6781, 7),
(330303, 6782, 2),
(330404, 6783, 5),
(330405, 6784, 9);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemesanan`
--

CREATE TABLE `detail_pemesanan` (
  `pemesanan_id` int(8) NOT NULL,
  `id_barang` int(4) NOT NULL,
  `sub_total` float(8,2) NOT NULL,
  `total_berat` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pemesanan`
--

INSERT INTO `detail_pemesanan` (`pemesanan_id`, `id_barang`, `sub_total`, `total_berat`) VALUES
(12345671, 6780, 78000.00, '1kg'),
(12345672, 6781, 91000.00, '500g'),
(12345673, 6782, 32300.00, '2kg'),
(12345674, 6783, 5900.00, '750g'),
(12345675, 6784, 9500.00, '1kg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penawaran`
--

CREATE TABLE `detail_penawaran` (
  `id_penawaran` int(8) NOT NULL,
  `id_calon_konsumen` int(6) NOT NULL,
  `status_penawaran` int(11) NOT NULL,
  `balasan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_penawaran`
--

INSERT INTO `detail_penawaran` (`id_penawaran`, `id_calon_konsumen`, `status_penawaran`, `balasan`) VALUES
(1118762, 111173, 1, 'baguss'),
(1118763, 111174, 2, 'baguss banget'),
(1118764, 111175, 3, 'baguss'),
(1118765, 111176, 4, 'baguss banget nice'),
(1118766, 111177, 5, 'baguss');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(2) NOT NULL,
  `nama_jabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(41, 'Manager'),
(42, 'Pegawai Kasir'),
(43, 'Sales'),
(44, 'Pramuniaga'),
(45, 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` int(2) NOT NULL,
  `nama_jenis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `nama_jenis`) VALUES
(21, 'Pakaian Anak'),
(22, 'Tas'),
(23, 'Buah-buahan'),
(24, 'Minuman'),
(25, 'Makanan Ringan');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_dokumen`
--

CREATE TABLE `jenis_dokumen` (
  `id_jenis_dokumen` int(2) NOT NULL,
  `nama_dokumen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_dokumen`
--

INSERT INTO `jenis_dokumen` (`id_jenis_dokumen`, `nama_dokumen`) VALUES
(91, 'packing album'),
(92, 'packing kardus'),
(93, 'packing poster'),
(94, 'packing dokumen'),
(95, 'packing bubble wrap');

-- --------------------------------------------------------

--
-- Table structure for table `katalog_barang`
--

CREATE TABLE `katalog_barang` (
  `id_katalog` int(6) NOT NULL,
  `nama_katalog` varchar(30) NOT NULL,
  `file_katalog` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `katalog_barang`
--

INSERT INTO `katalog_barang` (`id_katalog`, `nama_katalog`, `file_katalog`) VALUES
(330101, 'Pakaian', 'Cetak'),
(330202, 'Tas', 'Cetak'),
(330303, 'Buah', 'Digital'),
(330404, 'Minuman', 'Digital'),
(330505, 'Makanan Ringan', 'Digital'),
(330506, 'bisnis', 'cetak');

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE `negara` (
  `id_negara` int(4) NOT NULL,
  `nama_negara` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `negara`
--

INSERT INTO `negara` (`id_negara`, `nama_negara`) VALUES
(31, 'Belanda'),
(61, 'Australia'),
(62, 'Indonesia'),
(82, 'Korea Selatan'),
(966, 'Saudi Arabia');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(4) NOT NULL,
  `id_jabatan` int(2) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `telp_pegawai` varchar(15) NOT NULL,
  `email_pegawai` varchar(50) NOT NULL,
  `alamat_pegawai` varchar(50) NOT NULL,
  `jk_pegawai` varchar(2) NOT NULL,
  `pass_pegawai` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_jabatan`, `nama_pegawai`, `telp_pegawai`, `email_pegawai`, `alamat_pegawai`, `jk_pegawai`, `pass_pegawai`, `status`) VALUES
(3130, 41, 'Robert Joe', '0001167', 'robert_joe@mail.com', 'bojonegoro 5', '1', '11123', 'aktif'),
(3131, 42, 'Siti Hafidha', '000011873', 'siti.h@gmail.com', 'kudus gg \r\nmawar', '0', '01281u8', 'aktif'),
(3132, 43, 'Ayik Lathifatul', '087182379', 'ayiklat@gmail.com', 'simomulyo baru', '0', '8887677381', 'aktif'),
(3133, 44, 'Yayak Whie', '0876762171', 'whieyayak@gmail.com', 'gubeng \r\nkertajaya', '0', '987hhhhh', 'aktif'),
(3134, 45, 'Febryansa King', '0876276372', 'kingg@gmail.com', 'Manyar \r\nkertoajo', '1', 'uuujiiik', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(8) NOT NULL,
  `id_pegawai` int(4) NOT NULL,
  `pemesanan_id` int(8) NOT NULL,
  `tgl_pembayaran` datetime NOT NULL,
  `bukti_pembayaran` varchar(100) NOT NULL,
  `jenis_pembayaran` varchar(20) NOT NULL,
  `status_pembayaran` varchar(20) NOT NULL,
  `total_pembayaran` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pegawai`, `pemesanan_id`, `tgl_pembayaran`, `bukti_pembayaran`, `jenis_pembayaran`, `status_pembayaran`, `total_pembayaran`) VALUES
(76321961, 3130, 12345671, '2021-12-22 20:15:34', 'Debit', 'shopeepay', 'lunas', 350000.00),
(76321962, 3131, 12345672, '2021-08-15 20:17:56', 'Cash', 'Dana', 'pending', 450000.00),
(76321963, 3132, 12345673, '2021-12-22 13:18:43', 'Debit', 'Dana', 'lunas', 20000.00),
(76321964, 3133, 12345674, '2019-08-11 16:20:02', 'paylater', 'BNI', 'pending', 160000.00),
(76321965, 3134, 12345675, '2021-04-24 20:21:34', 'Cash', 'COD', 'lunas', 64000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `pemesanan_id` int(8) NOT NULL,
  `id_pegawai` int(4) NOT NULL,
  `id_calon_konsumen` int(6) NOT NULL,
  `id_penawaran` int(8) NOT NULL,
  `tgl_pemesanan` datetime NOT NULL,
  `status_pemesanan` varchar(30) NOT NULL,
  `alamat_pengiriman` varchar(100) NOT NULL,
  `total_harga` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`pemesanan_id`, `id_pegawai`, `id_calon_konsumen`, `id_penawaran`, `tgl_pemesanan`, `status_pemesanan`, `alamat_pengiriman`, `total_harga`) VALUES
(12345671, 3130, 111173, 1118762, '2021-12-22 13:10:28', 'menunggu konfirmasi', 'kebraon indah permai H6', 42000.00),
(12345672, 3131, 111174, 1118763, '2021-12-22 20:10:42', 'Ditolak', 'pondok maritim', 13000.00),
(12345673, 3132, 111175, 1118764, '2017-08-16 08:12:36', 'Diterima', 'griya kebraon', 26000.00),
(12345674, 3133, 111176, 1118765, '2018-08-19 17:13:33', 'Ditolak', 'graha family', 14000.00),
(12345675, 3134, 111177, 1118766, '2015-06-28 20:16:56', 'Diterima', 'bogangin baru XI-12', 44000.00);

-- --------------------------------------------------------

--
-- Table structure for table `penawaran`
--

CREATE TABLE `penawaran` (
  `id_penawaran` int(8) NOT NULL,
  `id_katalog` int(6) NOT NULL,
  `id_pegawai` int(4) NOT NULL,
  `tgl_penawaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penawaran`
--

INSERT INTO `penawaran` (`id_penawaran`, `id_katalog`, `id_pegawai`, `tgl_penawaran`) VALUES
(1118762, 330101, 3132, '2021-12-01'),
(1118763, 330202, 3134, '2018-04-20'),
(1118764, 330303, 3130, '2025-03-05'),
(1118765, 330404, 3131, '2022-03-23'),
(1118766, 330405, 3133, '2016-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `no_resi` int(20) NOT NULL,
  `id_pegawai` int(4) NOT NULL,
  `id_pembayaran` int(8) NOT NULL,
  `status_pengiriman` varchar(30) NOT NULL,
  `tgl_pengiriman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`no_resi`, `id_pegawai`, `id_pembayaran`, `status_pengiriman`, `tgl_pengiriman`) VALUES
(1973613916, 3132, 76321962, 'sudah diterima', '2021-12-15'),
(1973613917, 3134, 76321965, 'perjalanan', '2021-12-01'),
(1973613918, 3130, 76321961, 'sudah diterima', '2021-12-03'),
(1973613919, 3131, 76321963, 'transit', '2021-12-20'),
(1973613920, 3133, 76321964, 'transit', '2021-11-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `calon_konsumen`
--
ALTER TABLE `calon_konsumen`
  ADD PRIMARY KEY (`id_calon_konsumen`);

--
-- Indexes for table `detail_jns_dok`
--
ALTER TABLE `detail_jns_dok`
  ADD PRIMARY KEY (`id_jenis_dokumen`);

--
-- Indexes for table `detail_katalog`
--
ALTER TABLE `detail_katalog`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indexes for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD PRIMARY KEY (`pemesanan_id`);

--
-- Indexes for table `detail_penawaran`
--
ALTER TABLE `detail_penawaran`
  ADD PRIMARY KEY (`id_penawaran`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  ADD PRIMARY KEY (`id_jenis_dokumen`);

--
-- Indexes for table `katalog_barang`
--
ALTER TABLE `katalog_barang`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indexes for table `negara`
--
ALTER TABLE `negara`
  ADD PRIMARY KEY (`id_negara`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`pemesanan_id`);

--
-- Indexes for table `penawaran`
--
ALTER TABLE `penawaran`
  ADD PRIMARY KEY (`id_penawaran`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`no_resi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6785;

--
-- AUTO_INCREMENT for table `calon_konsumen`
--
ALTER TABLE `calon_konsumen`
  MODIFY `id_calon_konsumen` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111178;

--
-- AUTO_INCREMENT for table `detail_jns_dok`
--
ALTER TABLE `detail_jns_dok`
  MODIFY `id_jenis_dokumen` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `detail_katalog`
--
ALTER TABLE `detail_katalog`
  MODIFY `id_katalog` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330406;

--
-- AUTO_INCREMENT for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  MODIFY `pemesanan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12345676;

--
-- AUTO_INCREMENT for table `detail_penawaran`
--
ALTER TABLE `detail_penawaran`
  MODIFY `id_penawaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118767;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  MODIFY `id_jenis_dokumen` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `katalog_barang`
--
ALTER TABLE `katalog_barang`
  MODIFY `id_katalog` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330507;

--
-- AUTO_INCREMENT for table `negara`
--
ALTER TABLE `negara`
  MODIFY `id_negara` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=967;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3135;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76321966;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `pemesanan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12345676;

--
-- AUTO_INCREMENT for table `penawaran`
--
ALTER TABLE `penawaran`
  MODIFY `id_penawaran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118767;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `no_resi` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1973613921;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
