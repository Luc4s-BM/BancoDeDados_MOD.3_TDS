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
sessao.filmelucas_idfilmelucas,
filmelucas.nome,
sessao.salalucas_idsalalucas,
cinemalucas.cidade,
sessao.nome,
sessao.datasessao,
sessao.HoraSessao
from sessao, salalucas, filmelucas,cinemalucas
where sessao.filmelucas_idfilmelucas = filmelucas.idfilmelucas
and sessao.salalucas_idsalalucas = salalucas.idsalalucas
and salalucas.cinemalucas_idcinemalucas = cinemalucas.idcinemalucas';
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
