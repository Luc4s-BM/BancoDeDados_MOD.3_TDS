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
 $sql='SELECT salaarthur.idsalaarthur,
 salaarthur.nome,
 salaarthur.capacidade,
 cinemaarthur.nome,
 cinemaarthur.cidade
 FROM cinemaarthur, salaarthur
 WHERE salaarthur.cinemaarthur_idcinemaarthur=cinemaarthur.idcinemaarthur ';
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
