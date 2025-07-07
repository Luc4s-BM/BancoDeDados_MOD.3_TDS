<?php
include 'conectabanco.php';
try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT count(*) FROM cinemalucas ";
    $res = $conn->query($sql);
    $count = $res->fetchColumn();
    print "Encontrados " .  $count . " cinemas" . '<br>';
} catch(PDOException $e) {
    echo 'ERROR: ' . $e->getMessage();
}
?>