<?php
include 'conectabanco.php';
echo'
<html>
<h2>Listagem de Filmes</h2>
<table border=2>
    <tr>
        <th>ID Sessão</th>
        <th>ID Sala</th>
        <th>ID Filme</th>
        <th>Nome</th>
        <th>Data</th>
        <th>Hora</th>
        <th>Valor</th>
        <th>Dublado</th>
        <th>Legendado</th>
        <th>Libras</th>
    </tr>
';
 
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT sessao.idsessao, salaarthur.idsalaarthur, filmearthur.idfilmearthur, sessao.Nome, sessao.DataSessao, sessao.HoraSessao, sessao.Valor, sessao.Legendado, sessao.Libras
FROM sessao, filmearthur, salaarthur
WHERE sessao.filmearthur_idfilmearthur=filmearthur.idfilmearthur
AND sessao.salaarthur_idsalaarthur=salaarthur.idsalaarthur';
 $data = $conn->query($sql);
 foreach($data as $row)
 {
   echo'<tr><td> '.($row[0]).'</td>';
   echo'<td>'.($row[1]).'</td>';
   echo'<td>'.($row[2]).'</td>';
   echo'<td>'.($row[3]).'</td>';
   echo'<td>'.($row[4]).'</td>';
   echo'<td>'.($row[5]).'</td>';
   echo'<td>'.($row[6]).'</td>';
   echo'<td>'.($row[7]).'</td>';
   echo'<td>'.($row[8]).'</td>';
   echo'<td>'.($row[9]).'</td></tr>';
   
 }
 echo'</table>
 </html>';
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
