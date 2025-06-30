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
filmearthur.idfilmearthur as 'idfilmearthur',
filmearthur.generoarthur_idgeneroarthur as 'idgenero',
generoarthur.nome as 'genero',
filmearthur.duracao as 'duracao',
filmearthur.Nome as 'nomefilme',
filmearthur.CI as 'ci'
from filmearthur,generoarthur

where filmearthur.Generoarthur_idgeneroarthur=Generoarthur.idgeneroarthur
and filmearthur.Nome LIKE :nomefilme 
";

 $stmt = $conn->prepare($sql);
 $buscafilme='%'.$buscafilme.'%';
 $stmt->bindParam(':nomefilme', $buscafilme);
 $stmt->execute();
 $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
 if ($data) {
 foreach($data as $row) {
    echo'<tr><td>'.($row['idfilmearthur']).'</td>';
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







