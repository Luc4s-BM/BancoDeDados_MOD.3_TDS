<?php
// Conexão PDO
include 'conectabanco.php';

// Consulta para preencher o combobox
$stmt = $conn->query("SELECT idgenerolucas, Nome FROM generolucas");
$generos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Verifica o envio do formulário
$selecionado = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['genero'])) {
    $selecionado = $_POST['genero'];
}
?>

<meta charset="utf-8">
<form method="post" action="">
    <label for="categoria">Escolha um Gênero:</label>
    <select name="genero" id="genero">
        <option value="">-- Selecione --</option>
        <?php foreach ($generos as $genero): ?>
            <option value="<?= $genero['idgenerolucas'] ?>" <?= $genero['idgenerolucas'] == $selecionado ? 'selected' : '' ?>>
                <?= htmlspecialchars($genero['Nome']) ?>
            </option>
        <?php endforeach; ?>
    </select>
    <button type="submit">Enviar</button>
</form>

<?php if ($selecionado): ?>
    <p>Você selecionou Gênero ID: <strong><?= htmlspecialchars($selecionado) ?></strong></p>

<?php
$sql = "SELECT * FROM filmelucas WHERE generolucas_idgenerolucas = :idgenero";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':idgenero', $selecionado);
$stmt->execute();
$resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($resultados):
?>
    <table border="1">
        <tr>
            <th>ID Filme</th>
            <th>Nome</th>
            <th>Duração</th>
            <th>Classificação Indicativa</th>
        </tr>
        <?php foreach ($resultados as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['idfilmelucas']) ?></td>
                <td><?= htmlspecialchars($row['Nome']) ?></td>
                <td><?= htmlspecialchars($row['Duracao']) ?></td>
                <td><?= htmlspecialchars($row['CI']) ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php else: ?>
    <p>Nenhum resultado encontrado para o gênero selecionado.</p>
<?php endif; ?>
<?php endif; ?>
