<?php
// Conexão PDO
include 'conectabanco.php';

// Consulta para preencher o combobox com as salas
$stmt = $conn->query("SELECT idsalaarthur, Nome FROM salaarthur");
$salas = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Verifica o envio do formulário
$selecionado = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['sala'])) {
    $selecionado = $_POST['sala'];
}
?>

<meta charset="utf-8">
<form method="post" action="">
    <label for="sala">Escolha uma Sala:</label>
    <select name="sala" id="sala">
        <option value="">-- Selecione --</option>
        <?php foreach ($salas as $sala): ?>
            <option value="<?= $sala['idsalaarthur'] ?>" <?= $sala['idsalaarthur'] == $selecionado ? 'selected' : '' ?>>
                <?= htmlspecialchars($sala['Nome']) ?>
            </option>
        <?php endforeach; ?>
    </select>
    <button type="submit">Enviar</button>
</form>

<?php if ($selecionado): ?>
    <p>Você selecionou a Sala ID: <strong><?= htmlspecialchars($selecionado) ?></strong></p>

<?php
$sql = "SELECT * FROM sessao WHERE salaarthur_idsalaarthur = :idsala";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':idsala', $selecionado);
$stmt->execute();
$resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($resultados):
?>
    <table border="1">
        <tr>
            <th>ID Filme</th>
            <th>Nome Sessão</th>
            <th>Duração</th>
            <th>Classificação Indicativa</th>
        </tr>
        <?php foreach ($resultados as $row): ?>
            <tr>
                <td><?= htmlspecialchars($row['idfilmearthur']) ?></td>
                <td><?= htmlspecialchars($row['Nome']) ?></td>
                <td><?= htmlspecialchars($row['Duracao']) ?></td>
                <td><?= htmlspecialchars($row['CI']) ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php else: ?>
    <p>Nenhum filme está passando nesta sala.</p>
<?php endif; ?>
<?php endif; ?>
