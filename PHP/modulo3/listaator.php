<?php
include 'conectabanco.php';
try {
 $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql='SELECT * FROM atorlucas ';
 $data = $conn->query($sql);
 foreach($data as $row)
 {
   echo'ID ator: '.($row[0]);
   echo' - Nome ator: '.($row[1]).'<br>';
 }
 
} catch(PDOException $e) {
 echo 'ERROR: ' . $e->getMessage();
}
 ?>
