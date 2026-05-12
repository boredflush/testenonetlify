<?php

$host = "sql12.freesqldatabase.com";
$db   = "SEU_DATABASE";
$user = "SEU_USUARIO";
$pass = "SUA_SENHA";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erro: " . $conn->connect_error);
}
?>
