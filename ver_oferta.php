<?php
session_start();
include 'db.php';


if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'cliente') {
    header("Location: login.php");
    exit();
}

$id = $_GET['id'];
$sql = "SELECT * FROM ofertas WHERE id_oferta = $id";
$res = $conn->query($sql);
$oferta = $res->fetch_assoc();
?>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>

<div class="form-container">
    <h2><?php echo $oferta['titulo']; ?></h2>

    <p>Precio oferta: $<?php echo $oferta['precio_oferta']; ?></p>
    <p>Descripción: <?php echo $oferta['descripcion']; ?></p>

    <a href="comprar.php?id=<?php echo $id; ?>">
        <button>Comprar Cupón</button>
    </a>
</div>

</body>
</html>
