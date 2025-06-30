<?php
include 'conectabanco.php';
echo'
<html>
<h2>Listagem de Filmes</h2>
<table border=2>
    <tr aling="center">
        <th>ID Gênero</th>
        <th>Nome</th>
    </tr>
';
 
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT generoarthur.idgeneroarthur, generoarthur.nome FROM generoarthur';
 $data = $conn->query($sql);
 foreach($data as $row)
 {
   echo'<tr><td> '.($row[0]).'</td>';
   echo'<td> '.($row[1]).'</td></tr>';
 }
 echo'</table>
 </html>';
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
