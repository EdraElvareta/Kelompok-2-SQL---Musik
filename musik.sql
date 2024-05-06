-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Bulan Mei 2024 pada 11.31
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` char(5) NOT NULL,
  `id_artis` char(5) DEFAULT NULL,
  `judul_album` text DEFAULT NULL,
  `tahun` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `id_artis`, `judul_album`, `tahun`) VALUES
('02250', '01250', 'Lover', '2019'),
('02251', '01251', 'The 2000 Greatest', '2016'),
('02253', '01252', 'Musim yang Baik', '2014');

-- --------------------------------------------------------

--
-- Struktur dari tabel `artis`
--

CREATE TABLE `artis` (
  `id_artis` char(5) NOT NULL,
  `nama_artis` varchar(50) NOT NULL,
  `genre` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artis`
--

INSERT INTO `artis` (`id_artis`, `nama_artis`, `genre`) VALUES
('01250', 'Taylor Swift', 'Pop'),
('01251', 'Dewa', 'Indonesian Rock'),
('01252', 'Sheila On 7', 'Indonesian Pop');

-- --------------------------------------------------------

--
-- Struktur dari tabel `label_rekaman`
--

CREATE TABLE `label_rekaman` (
  `id_label` char(5) NOT NULL,
  `id_album` char(5) NOT NULL,
  `nama_label` varchar(50) DEFAULT NULL,
  `tahun_berdiri` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `label_rekaman`
--

INSERT INTO `label_rekaman` (`id_label`, `id_album`, `nama_label`, `tahun_berdiri`) VALUES
('04250', '02250', 'Republic', '1995'),
('04251', '02251', 'Team Record', '-'),
('04252', '02253', 'Sony Music Entertainment Indonesia', '1998');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lagu`
--

CREATE TABLE `lagu` (
  `id_lagu` char(5) NOT NULL,
  `id_album` char(5) NOT NULL,
  `judul_lagu` varchar(50) NOT NULL,
  `durasi` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lagu`
--

INSERT INTO `lagu` (`id_lagu`, `id_album`, `judul_lagu`, `durasi`) VALUES
('03250', '02250', 'Lover', '3:14'),
('03251', '02251', 'Kangen', '4:38'),
('03252', '02253', 'Dan', '4:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `id_artis` (`id_artis`);

--
-- Indeks untuk tabel `artis`
--
ALTER TABLE `artis`
  ADD PRIMARY KEY (`id_artis`);

--
-- Indeks untuk tabel `label_rekaman`
--
ALTER TABLE `label_rekaman`
  ADD PRIMARY KEY (`id_label`),
  ADD KEY `id_album` (`id_album`);

--
-- Indeks untuk tabel `lagu`
--
ALTER TABLE `lagu`
  ADD PRIMARY KEY (`id_lagu`),
  ADD KEY `id_album` (`id_album`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_artis`) REFERENCES `artis` (`id_artis`);

--
-- Ketidakleluasaan untuk tabel `label_rekaman`
--
ALTER TABLE `label_rekaman`
  ADD CONSTRAINT `label_rekaman_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`);

--
-- Ketidakleluasaan untuk tabel `lagu`
--
ALTER TABLE `lagu`
  ADD CONSTRAINT `lagu_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
