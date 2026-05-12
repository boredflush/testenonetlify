<?php

$host = "sql12.freesqldatabase.com";
$db   = "sql10826582";
$user = "sql10826582";
$pass = "McS5X3rsQu";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erro: " . $conn->connect_error);
}
?>
