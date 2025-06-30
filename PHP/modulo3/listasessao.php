<?php
include 'conectabanco.php';
echo'
<html>
    <h3>Listagem sessão </h3>

    <table border =2 >
    <tr>
    <th>Id Sessão</th>
    <th>Id Filme</th>
    <th>Nome</th>
    <th>Id Sala</th>
    <th>Cidade</th>
    <th>Nome</th>
    <th>Data</th>
    <th>Horario</th>
    
    </tr>
</html>

';
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql=' SELECT sessao.idsessao,
sessao.filmearthur_idfilmearthur,
filmearthur.nome,
sessao.salaarthur_idsalaarthur,
cinemaarthur.cidade,
sessao.nome,
sessao.datasessao,
sessao.HoraSessao
from sessao, salaarthur, filmearthur,cinemaarthur
where sessao.filmearthur_idfilmearthur = filmearthur.idfilmearthur
and sessao.salaarthur_idsalaarthur = salaarthur.idsalaarthur
and salaarthur.cinemaarthur_idcinemaarthur = cinemaarthur.idcinemaarthur';
 $data = $conn->query($sql);
 foreach($data as $row) {
echo'<tr><td>'.($row[0]).'</td>';
echo'<td>'.($row[1]).'</td>';
echo'<td>'.($row[2]).'</td>';
echo'<td>'.($row[3]).'</td>';
echo'<td>'.($row[4]).'</td>';
echo'<td>'.($row[5]).'</td>';
echo'<td>'.($row[6]).'</td>';
echo'<td>'.($row[7]).'</td></tr>';
 }echo'</table></html>';
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
