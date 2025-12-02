<?php
session_start();
include 'db.php';

// PROTECCIÓN: solo empresas pueden entrar
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'empresa') {
    header("Location: login.php");
    exit();
}

$mensaje = "";
$id_empresa = $_SESSION['id_empresa'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $titulo = $_POST['titulo'];
    $precio_regular = $_POST['precio_regular'];
    $precio_oferta = $_POST['precio_oferta'];
    $fecha_inicio = $_POST['fecha_inicio'];
    $fecha_fin = $_POST['fecha_fin'];
    $fecha_limite = $_POST['fecha_limite'];
    $cantidad = $_POST['cantidad'];
    $descripcion = $_POST['descripcion'];

    // Inserción
    $sql = "INSERT INTO ofertas 
            (id_empresa, titulo, precio_regular, precio_oferta, fecha_inicio, fecha_fin, fecha_limite_canje, cantidad_cupones, descripcion)
            VALUES 
            ($id_empresa, '$titulo', '$precio_regular', '$precio_oferta', '$fecha_inicio', '$fecha_fin', '$fecha_limite', '$cantidad', '$descripcion')";

    if ($conn->query($sql)) {
        $mensaje = "Cupón creado exitosamente.";
    } else {
        $mensaje = "Error al crear el cupón: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Empresa</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

<header>
    <h1>Panel de Empresa</h1>
    <nav>
        <a href="panel_empresa.php">Crear Cupón</a>
        <a href="mis_cupones.php">Mis Cupones</a>
        <a href="logout.php">Salir</a>
    </nav>
</header>

<main>
    <div class="form-container form-small">
        <form method="POST">
            <h2>Crear Cupón</h2>

            <label>Título del cupón:</label>
            <input type="text" name="titulo" required>

            <label>Precio regular:</label>
            <input type="number" step="0.01" name="precio_regular" required>

            <label>Precio oferta:</label>
            <input type="number" step="0.01" name="precio_oferta" required>

            <label>Fecha inicio:</label>
            <input type="date" name="fecha_inicio" required>

            <label>Fecha fin:</label>
            <input type="date" name="fecha_fin" required>

            <label>Fecha límite para canje:</label>
            <input type="date" name="fecha_limite" required>

            <label>Cantidad de cupones:</label>
            <input type="number" name="cantidad" required>

            <label>Descripción:</label>
            <textarea name="descripcion" required style="height: 70px; border-radius: 6px; padding: 8px;"></textarea>

            <button type="submit">Crear Cupón</button>

            <?php if ($mensaje != "") echo "<p class='mensaje'>$mensaje</p>"; ?>
        </form>
    </div>
</main>

</body>
</html>

