<?php
include 'conectabanco.php';

echo '
<html>
<h3>Listagem de Salas dos Cinemas</h3>

    <table border = 2>
        <tr>
            <th>Id Sala </th>
            <th>Nome</th>
            <th>Capacidade</th>
            <th>Cinema</th>
            <th>Cidade</th>
        </tr>
';

try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT salalucas.idsalalucas,
 salalucas.nome,
 salalucas.capacidade,
 cinemalucas.nome,
 cinemalucas.cidade
 FROM cinemalucas, salalucas
 WHERE salalucas.cinemalucas_idcinemalucas=cinemalucas.idcinemalucas ';
 $data = $conn->query($sql);
 foreach($data as $row) {
    echo'<td>'.($row[0]).'</td>';
    echo'<td>'.($row[1]).'</td>';
    echo'<td>'.($row[2]).'</td>';
    echo'<td>'.($row[3]).'</td>';
    echo'<td>'.($row[4]).'</td></tr>';
 }
echo'</table> </html>';
 
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
