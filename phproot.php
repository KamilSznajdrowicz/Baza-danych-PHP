<?php
// nawiazujemy polaczenie
$connection = @mysqli_connect('localhost', 'root', '')
// w przypadku niepowodzenia wyświetlamy komunikat
or die('Brak połączenia'); 
// połączenie nawiązane ;-)
echo "Udało się połaczyc z serwerem!<br />";
// nawiązujemy połączenie z bazą danych 
$user = 'root';
$pass = '';
$db = 'sznajdrowicz_komis_samochodowy';
echo "Zalogowales sie jako ".$user."<br>";
$db = new mysqli('localhost', $user, $pass, $db) or die("Nie mozesz sie polaczyc z baza danych");
// połączenie nawiązane ;-)
echo "Udało się polaczyć z baza danych!<br>";



$wynik = mysqli_query($db,"SELECT * FROM pracownicy") or die('Błąd zapytania'); 
echo "<table cellpadding=\"6\" border=1> <tr><th>Id</th><th>Imię</th><th>Nazwisko</th><th>Adres</th><th>Telefon</th><th>Pesel</th></tr>";
while($row = mysqli_fetch_array($wynik))
{
echo "<tr>";
echo "<td>".$row['id_pracownika'] . "</td>"; 
echo "<td>".$row['imie'] . "</td>"; 
echo "<td>".$row['nazwisko']."</td>";
echo "<td>".$row['adres']."</td>";
echo "<td>".$row['telefon']."</td>";
echo "<td>".$row['pesel']."</td>";
echo "</tr>";
}
echo "<br ><br >Pracownicy: <br >";
$wynik = mysqli_query($db,"SELECT * FROM klienci") or die('Błąd zapytania'); 
 echo "<table cellpadding=\"6\" border=1> <tr><th>Id</th><th>Imię</th><th>Nazwisko</th><th>Adres</th><th>Telefon</th><th>Id Pracownika</th></tr>";
while($row = mysqli_fetch_array($wynik))
{
echo "<tr>";
echo "<td>".$row['id_klienta'] . "</td>"; 
echo "<td>".$row['imie'] . "</td>"; 
echo "<td>".$row['nazwisko']."</td>";
echo "<td>".$row['adres']."</td>";
echo "<td>".$row['telefon']."</td>";
echo "<td>".$row['id_pracownika']."</td>";
echo "</tr>";
}
echo "<br >Klienci: <br >";
$wynik = mysqli_query($db,"SELECT * FROM stanowiska") or die('Błąd zapytania'); 
 echo "<table cellpadding=\"4\" border=1> <tr><th>Id</th><th>Ranga</th><th>Stanowisko</th><th>Id Pracownika</th></tr>";
while($row = mysqli_fetch_array($wynik))
{
echo "<tr>";
echo "<td>".$row['id_stanowiska'] . "</td>"; 
echo "<td>".$row['ranga'] . "</td>"; 
echo "<td>".$row['stanowisko']."</td>";
echo "<td>".$row['id_pracownika'] . "</td>"; 
echo "</tr>";
}
echo "<br >Stanowiska: <br >";

$wynik = mysqli_query($db,"SELECT * FROM auta") or die('Błąd zapytania'); 
 echo "<table cellpadding=\"6\" border=1> <tr><th>Id</th><th>Nazwa</th><th>Model</th><th>Rok</th><th>Pojemność</th><th>Id klienta</th></tr>";
while($row = mysqli_fetch_array($wynik))
{
echo "<tr>";
echo "<td>".$row['id_auta'] . "</td>"; 
echo "<td>".$row['nazwa'] . "</td>"; 
echo "<td>".$row['model']."</td>";
echo "<td>".$row['rok']."</td>";
echo "<td>".$row['pojemnosc']."</td>";
echo "<td>".$row['id_klienta']."</td>";
echo "</tr>";
}
echo "<br >Dodawanie klientów: <br >";



 $wynik = mysqli_query($db,"INSERT INTO `klienci`(`id_klienta`, `imie`, `nazwisko`, `adres`, `telefon`, `id_pracownika`) VALUES (NULL,'Pati','Jelen','Kostrzyna','321654987','2')") or die('Nie masz uprawnień do dodawania klientów'); 
if($wynik == true){
  echo "Dodałes klienta!";
  echo "<br />";
}else{
echo "Klient nie został dodany!";
echo "<br />";
}
echo "<br >Stanowiska: <br >";
mysqli_close($db);
?> 