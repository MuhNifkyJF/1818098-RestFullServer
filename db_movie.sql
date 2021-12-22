-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Des 2021 pada 09.46
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movie`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_coming_soon`
--

CREATE TABLE `tb_coming_soon` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `poster` text NOT NULL,
  `trailer` text NOT NULL,
  `sinopsis` text NOT NULL,
  `pemeran` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `tanggal_rilis` varchar(25) NOT NULL,
  `durasi` char(5) NOT NULL,
  `negara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_coming_soon`
--

INSERT INTO `tb_coming_soon` (`id`, `judul`, `poster`, `trailer`, `sinopsis`, `pemeran`, `genre`, `tanggal_rilis`, `durasi`, `negara`) VALUES
(1, 'The 355 (2022)', 'https://m.media-amazon.com/images/M/MV5BNzk4MDZhNTctMDA3OC00ODdkLWIyOWYtN2M0MzA3MDY5NDk1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX140_CR0,0,140,209_AL_.jpg', 'https://www.youtube.com/watch?v=SV0s2S9reT0', 'When a top-secret weapon falls into mercenary hands, a wild card CIA agent joins forces with three international agents on a lethal mission to retrieve it, while staying a step ahead of a mysterious woman who\'s tracking their every move.', 'Jessica Chastain, Lupita Nyong\'o, Diane Kruger, Penélope Cruz', 'Action , Crime , Thriller', '7 Januari 2022', '115', 'United States, USA'),
(2, 'Scream (2022)', 'https://m.media-amazon.com/images/M/MV5BM2E4ZGFmZTgtMDVkYS00ZTk0LWIzYWMtODk5OGVmYmEyMzEzXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UX140_CR0,0,140,209_AL_.jpg', 'https://www.youtube.com/watch?v=beToTslH17s', 'Twenty-five years after the original series of murders in Woodsboro, a new killer emerges, and Sidney Prescott must return to uncover the truth.', 'Jessica Chastain, Lupita Nyong\'o, Diane Kruger, Penélope Cruz', ' Horror , Mystery , Thriller', '14 Januari 2022', '114', 'United States'),
(3, 'Operation Fortune: Ruse de guerre (2022)', 'https://m.media-amazon.com/images/M/MV5BZGFmNmRlZmQtMDAyYy00NTJjLTg2ODQtZDI0OWE3M2I2NDcyXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_UY209_CR0,0,140,209_AL_.jpg', 'https://www.youtube.com/watch?v=W8Sqk1GcqxY', 'Twenty-five years after the original series of murders in Woodsboro, a new killer emerges, and Sidney Prescott must return to uncover the truth.', 'Cary Elwes, Jason Statham, Aubrey Plaza, Josh Hartnett', 'Action , Comedy ,Thriller', '21Januari 2022', '120', 'United States'),
(4, 'Morbius (2022)', 'https://m.media-amazon.com/images/M/MV5BYjlhNTA3Y2ItYjhiYi00NTBiLTg5MDMtZDJjMDZjNzVjNjJmXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_UX140_CR0,0,140,209_AL_.jpg', 'https://www.youtube.com/watch?v=oZ6iiRrz1SY', 'Biochemist Michael Morbius tries to cure himself of a rare blood disease, but he inadvertently infects himself with a form of vampirism instead.', 'Jared Leto, Michael Keaton, Adria Arjona, Jared Harris', 'Action , Adventure, Drama , Horror , Sci-Fi , Thriller', '28 Januari 2022', '90', 'United States'),
(5, 'Moonfall (2022)', 'https://m.media-amazon.com/images/M/MV5BN2NjM2JjNzctOGViYi00ZmYwLTliYTctZDQzMGIzYTY2ZDhiXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_UX140_CR0,0,140,209_AL_.jpg', 'https://www.youtube.com/watch?v=xx97DuHGr2o', 'In Moonfall, a mysterious force knocks the Moon from its orbit around Earth and sends it hurtling on a collision course with life as we know it. With mere weeks before impact and the world on the brink of annihilation, NASA executive and former astronaut Jo Fowler is convinced she has the key to saving us all - but only one astronaut from her past, Brian Harper and a conspiracy theorist K.C. Houseman believe her. These unlikely heroes will mount an impossible last-ditch mission into space, leaving behind everyone they love, only to find out that our Moon is not what we think it is.', 'Halle Berry, Patrick Wilson, John Bradley, Michael Peña', 'Action ,Adventure ,Fantasy ,Sci-Fi', '4 Februari 2022', '120', 'United States,United Kingdom,China');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_movie`
--

CREATE TABLE `tb_movie` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `poster` text NOT NULL,
  `trailer` text NOT NULL,
  `sinopsis` text NOT NULL,
  `pemeran` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `tahun_rilis` char(4) NOT NULL,
  `durasi` char(5) NOT NULL,
  `negara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_movie`
--

INSERT INTO `tb_movie` (`id`, `judul`, `poster`, `trailer`, `sinopsis`, `pemeran`, `genre`, `tahun_rilis`, `durasi`, `negara`) VALUES
(1, 'Ghostbusters: Afterlife (2021)', 'https://image.filemanager.work/poster/tt4513678.jpg', 'https://www.youtube.com/embed/BGq1chBbc30', 'When a single mom and her two kids arrive in a small town, they begin to discover their connection to the original Ghostbusters and the secret legacy their grandfather left behind.', 'Carrie Coon, Finn Wolfhard, Paul Rudd', 'Adventure, Box Office, Comedy, Fantasy, Science Fiction', '2021', '124', 'Amerika Serikat,Kanada'),
(2, 'Spider-Man: No Way Home (2021)', 'https://image.filemanager.work/poster/tt10872600.jpg', 'https://www.youtube.com/embed/iqyPvdsOWKk', 'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.', ' Benedict Cumberbatch, Tom Holland, Zendaya', 'Action, Adventure, Box Office, Science Fiction', '2021', '150', 'Amerika Serikat,Kanada'),
(3, 'Mortal Kombat Legends: Battle of the Realms (2021)', 'https://image.filemanager.work/poster/tt14901058.jpg', 'https://www.youtube.com/embed/hRRtd7Etato', 'The Earthrealm heroes must journey to the Outworld and fight for the survival of their homeland, invaded by the forces of evil warlord Shao Kahn, in the tournament to end all tournaments: the final Mortal Kombat.\n\n Action, Animation, Box Office, Fantasy', 'Grey Griffin, Ike Amadi, Jennifer Carpenter, Joel McHale', 'Action, Adventure, Box Office, Science Fiction', '2021', '80', 'Amerika Serikat'),
(4, 'Resident Evil: Welcome to Raccoon City (2021)', 'https://image.filemanager.work/poster/tt6920084.jpg', 'https://www.youtube.com/embed/4q6UGCyHZCI', 'Once the booming home of pharmaceutical giant Umbrella Corporation, Raccoon City is now a dying Midwestern town. The company’s exodus left the city a wasteland…with great evil brewing below the surface. When that evil is unleashed, the townspeople are forever…changed…and a small group of survivors must work together to uncover the truth behind Umbrella and make it through the night.', 'Grey Griffin, Ike Amadi, Jennifer Carpenter, Joel McHale', 'Action, Adventure, Box Office, Science Fiction', '2021', '113', ' Canada, Germany, United States'),
(5, 'The Card Counter (2021)', 'https://image.filemanager.work/poster/tt11196036.jpg', 'https://www.youtube.com/embed/7RvVT1cDiNc', 'William Tell just wants to play cards. His spartan existence on the casino trail is shattered when he is approached by Cirk, a vulnerable and angry young man seeking help to execute his plan for revenge on a military colonel. Tell sees a chance at redemption through his relationship with Cirk. But keeping Cirk on the straight-and-narrow proves impossible, dragging Tell back into the darkness of his past.\n\n', ' Oscar Isaac, Tiffany Haddish, Tye Sheridan', 'Action, Adventure, Box Office, Science Fiction', '2021', '111', 'China, United Kingdom, United States'),
(6, 'Jolt (2021)', 'https://image.filemanager.work/poster/tt10228134.jpg', 'https://www.youtube.com/embed/3BSSoD73TSk', 'Lindy is an acid-tongued woman with rage issues who controls her temper by shocking herself with an electrode vest. One day she makes a connection with Justin, who gives her a glimmer of hope for a shock-free future, but when he’s murdered she launches herself on a revenge-fueled rampage in pursuit of his killer.', 'Jai Courtney, Kate Beckinsale, Stanley Tucci', 'Action, Adventure, Box Office, Science Fiction', '2021', '91', 'United States'),
(7, 'Venom: Let There Be Carnage (2021)', 'https://image.filemanager.work/poster/tt7097896.jpg', 'https://www.youtube.com/embed/_s4qXyZOJSQ', 'After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.', 'Michelle Williams, Tom Hardy, Woody Harrelson', 'Action, Adventure, Box Office, Science Fiction', '2021', '97', 'Canada, United Kingdom, United States'),
(8, 'Dune: Part One (2021)', 'https://image.filemanager.work/poster/tt1160419.jpg', 'https://www.youtube.com/embed/n9xhJrPXop4', 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet’s exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity’s greatest potential-only those who can conquer their fear will survive.', 'Rebecca Ferguson, Timothée Chalamet, Zendaya', 'Action, Adventure, Box Office, Drama, Science Fiction', '2021', '155', 'Canada, United States'),
(9, 'Eternals (2021)', 'https://image.filemanager.work/poster/tt9032400.jpg', 'https://www.youtube.com/embed/0WVDKZJkGlY', 'The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.', ' Angelina Jolie, Gemma Chan, Richard Madden', 'Action, Adventure, Box Office, Science Fiction', '2021', '156', 'United Kingdom, United States'),
(10, 'Justice Society: World War II (2021)', 'https://image.filemanager.work/poster/tt13804084.jpg', 'https://www.youtube.com/embed/s4xXbGFhEFg', 'When the Flash finds himself dropped into the middle of World War II, he joins forces with Wonder Woman and her top-secret team known as the Justice Society of America.', 'Chris Diamantopoulos, Liam McIntyre, Matt Bomer, Omid Abtahi, Stana Katic', 'Animation, Box Office, Science Fiction, War', '2021', '84', 'United States, USA'),
(11, 'Red Notice (2021)', 'https://image.filemanager.work/poster/tt7991608.jpg', 'https://www.youtube.com/embed/T6l3mM7AWew', 'An Interpol-issued Red Notice is a global alert to hunt and capture the world’s most wanted. But when a daring heist brings together the FBI’s top profiler and two rival criminals, there’s no telling what will happen.', 'Dwayne Johnson, Gal Gadot, Ryan Reynolds, Tom Choi', 'Action, Box Office, Comedy, Crime, Thriller', '2021', '118', 'United States'),
(12, 'Space Jam: A New Legacy (2021)', 'https://image.filemanager.work/poster/tt3554046.jpg', 'https://www.youtube.com/embed/olXYZOsXw_o', 'When LeBron and his young son Dom are trapped in a digital space by a rogue A.I., LeBron must get them home safe by leading Bugs, Lola Bunny and the whole gang of notoriously undisciplined Looney Tunes to victory over the A.I.’s digitized champions on the court. It’s Tunes versus Goons in the highest-stakes challenge of his life.', 'Cedric Joe, Don Cheadle, Jim Cummings, LeBron James, Sonequa Martin-Green, Zendaya', 'Animation, Box Office, Comedy, Family, Science Fiction', '2021', '115', 'United States, USA');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_coming_soon`
--
ALTER TABLE `tb_coming_soon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_movie`
--
ALTER TABLE `tb_movie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_coming_soon`
--
ALTER TABLE `tb_coming_soon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_movie`
--
ALTER TABLE `tb_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
