<?php
include 'conectabanco.php';
echo'
<html>
<h2>Listagem de cinemas</h2>
<table border=2>
    <tr aling="center">
        <th>ID Cinema</thaling=>
        <th>Nome</thing=>
        <th>Cidade</th>
    </tr>
';
 
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT * FROM cinemalucas ';
 $data = $conn->query($sql);
 foreach($data as $row)
 {
   echo'<td> '.($row[0]).'</td>';
   echo'<td> '.($row[1]).'</td>';
   echo'<td> '.($row[2]).'</td></tr>';
 }
 echo'</table>
 </html>';
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
