<?php
// nawiazujemy polaczenie
$connection = @mysqli_connect('localhost', 'kamil', 'kamil123')
// w przypadku niepowodzenia wyświetlamy komunikat
or die('Brak połączenia'); 
// połączenie nawiązane ;-)
echo "Udało się połaczyc z serwerem!<br />";
// nawiązujemy połączenie z bazą danych 
$user = 'kamil';
$pass = 'kamil123';
$db = 'sznajdrowicz_komis_samochodowy';
echo "Zalogowales sie jako ".$user."<br>";
$db = new mysqli('localhost', $user, $pass, $db) or die("Nie mozesz sie polaczyc z baza danych");
// połączenie nawiązane ;-)
echo "Udało się polaczyć z baza danych!<br /><br />";
echo "<br >Dowiedz sie do jakiego pracownika zostales przydzielony: <br >";
$wynik = mysqli_query($db,"SELECT klienci.imie,pracownicy.imie,pracownicy.nazwisko, pracownicy.telefon FROM klienci,pracownicy WHERE klienci.id_klienta = pracownicy.id_pracownika AND klienci.imie = 'Kamil'") or die('Błąd zapytania'); 
while($row = mysqli_fetch_array($wynik)){
  echo "Imie oraz nazwisko twojego pracownika: " . $row['imie'] . " " . $row['nazwisko'];
  echo "<br />";
echo "Telefon: " . $row['telefon'];
 echo "<br />";
  }

$wynik = mysqli_query($db,"SELECT klienci.id_klienta,auta.nazwa,auta.model, auta.pojemnosc FROM klienci,auta WHERE klienci.id_klienta = auta.id_klienta AND klienci.imie = 'Kamil'") or die('Błąd zapytania'); 
while($row = mysqli_fetch_array($wynik)){
  echo "Twoje auto to: " . $row['nazwa'] . " " . $row['model']. " " . $row['pojemnosc'];
  echo "<br />";
  }

echo "<br >Wstawianie tabel: <br >";
 $wynik = mysqli_query($db,"INSERT INTO `klienci`(`id_klienta`, `imie`, `nazwisko`, `adres`, `telefon`, `id_pracownika`) VALUES (NULL,'Test','Testowy','Kalisz ul. Mostowa2','368135690','2')") or die('Nie masz uprawnień do dodawania klientów'); 
if($wynik == true){
  echo "Dodałes klienta!";
  echo "<br />";
}else{
echo "Klient nie został dodany!";
echo "<br />";
}


mysqli_close($db);

?> 