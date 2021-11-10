-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Sty 2020, 22:25
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sznajdrowicz_komis_samochodowy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auta`
--

CREATE TABLE `auta` (
  `id_auta` int(3) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `model` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `rok` int(4) NOT NULL,
  `pojemnosc` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `id_klienta` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `auta`
--

INSERT INTO `auta` (`id_auta`, `nazwa`, `model`, `rok`, `pojemnosc`, `id_klienta`) VALUES
(1, 'AUDI', 'RS7', 2019, '4.0TFSI', 2),
(2, 'BMW', 'M5', 2018, '4.9 TSI', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(3) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `telefon` int(9) NOT NULL,
  `id_pracownika` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `adres`, `telefon`, `id_pracownika`) VALUES
(1, 'Kamil', 'Nygus', 'Olszyna ul. Wolna 85', 956123432, 2),
(2, 'Iza', 'Kowalska', 'Lubin ul. Polna 12', 123456321, 1),
(3, 'Jan', 'Kogut', 'Kowary ul. Podhale 4', 123456789, 1),
(4, 'Krystian', 'Kowalczyk', 'Madery 2c', 555000111, 1),
(13, 'Pati', 'Jelen', 'Kostrzyna', 321654987, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(3) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `adres` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `telefon` int(9) NOT NULL,
  `pesel` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `adres`, `telefon`, `pesel`) VALUES
(1, 'Andrzej', 'Nowak', 'Zapusta ul. Krajowa 5', 987654321, 83250483922),
(2, 'Tomasz', 'Kamel', 'Warszawa ul. Kwiatowa 5', 345678231, 82231673921);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

CREATE TABLE `stanowiska` (
  `id_stanowiska` int(3) NOT NULL,
  `ranga` int(2) NOT NULL,
  `stanowisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `id_pracownika` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`id_stanowiska`, `ranga`, `stanowisko`, `id_pracownika`) VALUES
(1, 1, 'Kierownik', 2),
(2, 2, 'Pracownik', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `auta`
--
ALTER TABLE `auta`
  ADD PRIMARY KEY (`id_auta`),
  ADD KEY `id_klienta` (`id_klienta`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`),
  ADD KEY `id_pracownika` (`id_pracownika`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indeksy dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`id_stanowiska`),
  ADD KEY `id_pracownika` (`id_pracownika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `auta`
--
ALTER TABLE `auta`
  MODIFY `id_auta` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  MODIFY `id_stanowiska` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `auta`
--
ALTER TABLE `auta`
  ADD CONSTRAINT `auta_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`);

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Ograniczenia dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD CONSTRAINT `stanowiska_ibfk_1` FOREIGN KEY (`id_pracownika`) REFERENCES `pracownicy` (`id_pracownika`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
