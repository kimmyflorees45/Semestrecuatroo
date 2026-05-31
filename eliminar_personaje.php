<?php
$username ="root";
$password ="";
$server ="localhost";
$database ="michis";

$conexion = new mysqli($server, $username, $password, $database);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    // 1. Borrar relaciones con superpoderes
    $stmt1 = $conexion->prepare("DELETE FROM personajesuperpoder WHERE personajeID = ?");
    $stmt1->bind_param("i", $id);
    $stmt1->execute();
    $stmt1->close();

    // 2. Borrar relaciones con cómics
    $stmt2 = $conexion->prepare("DELETE FROM personajecomic WHERE personajeID = ?");
    $stmt2->bind_param("i", $id);
    $stmt2->execute();
    $stmt2->close();

    // 3. Borrar el personaje
    $stmt3 = $conexion->prepare("DELETE FROM personajes WHERE personajeID = ?");
    $stmt3->bind_param("i", $id);
    $stmt3->execute();
    $stmt3->close();
}

$conexion->close();
header("Location: relaciones01.php");
exit();
?>
