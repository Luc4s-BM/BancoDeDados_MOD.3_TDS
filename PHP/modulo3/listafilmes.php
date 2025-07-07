<?php
include 'conectabanco.php';
echo'
<html>
<h2>Listagem de Filmes</h2>
<table border=2>
    <tr aling="center">
        <th>ID Filme</thaling=>
        <th>Gênero</thing=>
        <th>Nome</th>
        <th>Duração</th>
        <th>Classif. Indicativa</th>
    </tr>
';
 
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT filmelucas.idfilmelucas, filmelucas.nome, generolucas.nome, filmelucas.duracao, filmelucas.ci FROM filmelucas, generolucas WHERE filmelucas.generolucas_idgenerolucas=generolucas.idgenerolucas ';
 $data = $conn->query($sql);
 foreach($data as $row)
 {
   echo'<td> '.($row[0]).'</td>';
   echo'<td> '.($row[1]).'</td>';
   echo'<td> '.($row[2]).'</td>';
   echo'<td> '.($row[3]).'</td>';
   echo'<td> '.($row[4]).'</td></tr>';  
 }
 echo'</table>
 </html>';
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
