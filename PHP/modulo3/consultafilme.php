<?php
include 'conectabanco.php';
$buscafilme = ($_POST['nomefilme']) ;
?>
<html>
<head>
 <title>Consulta filmes por Nome</title>
</head>
<body>
 <form method="post">
 <label for="nome">Nome:</label>
 <input type="text" id="nomefilme" name="nomefilme"
required>
 <button type="submit">Consultar</button>
 </form>
 <table border =2>
    <tr>
        <th>Id Filme</th>
        <th>Id Genero</th>
        <th>Nome do genero</th>
        <th>Nome</th>
        <th>Duração</th>
        <th>Class Indicativa</th>
</tr>

        </body>
</html>

<?php
if (!empty($buscafilme)) {
$sql = "SELECT 
filmelucas.idfilmelucas as 'idfilmelucas',
filmelucas.generolucas_idgenerolucas as 'idgenero',
generolucas.nome as 'genero',
filmelucas.duracao as 'duracao',
filmelucas.Nome as 'nomefilme',
filmelucas.CI as 'ci'
from filmelucas,generolucas

where filmelucas.Generolucas_idgenerolucas=Generolucas.idgenerolucas
and filmelucas.Nome LIKE :nomefilme 
";

 $stmt = $conn->prepare($sql);
 $buscafilme='%'.$buscafilme.'%';
 $stmt->bindParam(':nomefilme', $buscafilme);
 $stmt->execute();
 $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
 if ($data) {
 foreach($data as $row) {
    echo'<tr><td>'.($row['idfilmelucas']).'</td>';
    echo'<td>'.($row['idgenero']).'</td>';
    echo'<td>'.($row['genero']).'</td>';
    echo'<td>'.($row['nomefilme']).'</td>';
    echo'<td>'.($row['duracao']).'</td>';
    echo'<td>'.($row['ci']).'</td></tr>';

    

} echo'</table>';
 } else {
 echo "<p>Nenhum resultado encontrado.</p>";
 }
 }
?>







