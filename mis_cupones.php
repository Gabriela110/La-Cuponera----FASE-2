<?php
session_start();
include "db.php"; 


if (!isset($_SESSION['id_empresa'])) {
    echo "Debes iniciar sesión como empresa.";
    exit;
}

$id_empresa = $_SESSION['id_empresa'];

$query = "SELECT * FROM ofertas WHERE id_empresa = $id_empresa ORDER BY id_oferta DESC";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Error SQL: " . mysqli_error($conn));
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Cupones</title>
    <link rel="stylesheet" href="../css/estilo.css"> <!-- TU CSS -->
    <style>
        
        .contenedor {
            width: 90%;
            margin: 40px auto;
            background: #ffffff22;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            color: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th {
            background: #003366;
            padding: 12px;
            color: #fff;
        }

        td {
            padding: 12px;
            background: #ffffffcc;
            color: #000;
            border-bottom: 1px solid #00336655;
        }

        tr:hover td {
            background: #ffffffee;
        }

        .no-cupones {
            text-align: center;
            padding: 15px;
            background: #003366;
            margin-top: 20px;
            border-radius: 8px;
        }
    </style>
</head>

<body>
<header>
    <h1>Panel Empresa</h1>
</header>

<div class="contenedor">
    <h2>Mis Cupones</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Precio Regular</th>
                <th>Precio Oferta</th>
                <th>Inicio</th>
                <th>Fin</th>
                <th>Cantidad</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>

        <?php
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>".$row['id_oferta']."</td>";
                echo "<td>".$row['titulo']."</td>";
                echo "<td>$".$row['precio_regular']."</td>";
                echo "<td>$".$row['precio_oferta']."</td>";
                echo "<td>".$row['fecha_inicio']."</td>";
                echo "<td>".$row['fecha_fin']."</td>";
                echo "<td>".$row['cantidad_cupones']."</td>";
                echo "<td>".$row['estado']."</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='8' class='no-cupones'>No tienes cupones registrados.</td></tr>";
        }
        ?>

        </tbody>
    </table>
</div>

</body>
</html>
