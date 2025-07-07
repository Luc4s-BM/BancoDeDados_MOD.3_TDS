
<?php
// ConexÃ£o PDO
include 'conectabanco.php';

// Consulta para preencher o combobox
$stmt = $conn->query("SELECT idcinemalucas, Nome FROM cinemalucas");
$generos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Verifica o envio do formulÃ¡rio
$selecionado = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['cinema'])) {
    $selecionado = $_POST['cinema'];
}
?>

<!-- FormulÃ¡rio - magica para o botão  -->
<meta charset="utf-8">
<form method="post" action="">
    <label for="categoria">Escolha um GÃªnero:</label>
    <select name="cinema" id="cinema">
        <option value="">-- Selecione --</option>
        <?php foreach ($generos as $cinema): ?>
            <option value="<?= $cinema['idcinemalucas'] ?>" <?= $cinema['idcinemalucas'] == $selecionado ? 'selected' : '' ?>>
                <?= htmlspecialchars($cinema['Nome']) ?>
            </option>
        <?php endforeach; ?>
    </select>
    <button type="submit">Enviar</button>
</form>

<php if ($selecionado): ?>
    <p>VocÃª selecionou GÃªnero ID: <strong><?= htmlspecialchars($selecionado) ?></strong></p>

    <table border =1>
        <tr>
            <th>ID Sala</th>
            <th>Nome</th>
            <th>Capacidade</th>
        </tr>
    
<?php

$sql = "SELECT * FROM salalucas WHERE cinemalucas_idcinemalucas =:idcinemalucas";
  if ($selecionado) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':idcinemalucas', $selecionado);
        $stmt->execute();
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC); 
         echo '<h2>Resultados</h2><ul>';
            foreach ($resultados as $row) {
                echo'<tr> <td>'.($row['idsalalucas']).'</td>';
                echo'<td>'.($row['Nome']).'</td>';
                echo'<td>'.($row['Capacidade']).'</td></tr>';
            }echo'</table>';
        } else {
            echo "<p>Nenhum resultado encontrado.</p>";
        }
    
 endif; ?>