<?php
include 'conectabanco.php';
$buscafilme = isset($_POST['nomefilme']) ? $_POST['nomefilme'] : '';
?>

<html>
<head>
    <title>Consulta filmes por Nome</title>
</head>
<body>
    <form method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nomefilme" name="nomefilme" required>
        <button type="submit">Consultar</button>
    </form>
    
    <h1>Consulta de Filmes</h1>
    <table border="2">
        <tr>
            <th>Id Filme</th>
            <th>Nome Filme</th>
            <th>Gênero Filme</th>
            <th>Duração Filme</th>
            <th>CI Filme</th>
        </tr>
        </body>
</html>

        <?php
        if (!empty($buscafilme)) {
            $sql = "SELECT filmearthur.idfilmearthur as 'idfilme', filmearthur.genero_arthur_idgeneroarthur as 'idgenero', generoarthur.nome as 'genero', filmearthur.duracao as 'duracao', filmearthur.nome as 'nomefilme', filmearthur.ci as 'ci' FROM filmearthur, generoarthur WHERE filmearthur.generoarthur_idgeneroarthur = generoarthur.idgeneroarthur and filmearthur.nome LIKE :nomefilme";
            $stmt = $conn->prepare($sql);
            $buscafilme = '%' . $buscafilme . '%';
            $stmt->bindParam(':nomefilme', $buscafilme);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            if ($data) {
                foreach ($data as $row) {
                    echo '<tr>';
                    echo '<td>' .($row['idfilmearthur']).'</td>';
                    echo '<td>' . ($row['generoarthur_idgeneroarthur']).'</td>';
                    echo '<td>' . ($row['Nome']).'</td>';
                    echo '<td>' . ($row['Duracao']).'</td>';
                    echo '<td>' . ($row['CI']).'</td></tr>';
                    echo '</tr>';
                }
            } else {
                echo "<tr><td colspan='5'>Nenhum resultado encontrado.</td></tr>";
            }
        }
        ?>
    </table>
