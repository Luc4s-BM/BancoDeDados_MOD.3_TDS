<?php
$username='root';
$password='';
$dbname='cinema123';
$host='localhost';
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
?>

