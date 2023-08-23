<?php
// Establecer la conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Agrov";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar si la conexión fue exitosa
if ($conn->connect_error) {
    die("Error en la conexión a la base de datos: " . $conn->connect_error);
}

// Obtener la lista de usuarios de la base de datos
$sql = "SELECT * FROM usuarios";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>



    <title>Lista de Usuarios</title>
</head>
<body>
    <h2>Lista de Usuarios</h2>
    <table>
        <tr>
            <th>Usuario</th>
            <th>Nombre Completo</th>
            <th>Dirección</th>
            <th>Número de Teléfono</th>
            <th>Rol</th>
            <th>Acciones</th>
        </tr>
        <?php
        if ($result->num_rows > 0) {
            // Mostrar los usuarios en la tabla
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["usuario"] . "</td>";
                echo "<td>" . $row["nombre_completo"] . "</td>";
                echo "<td>" . $row["direccion"] . "</td>";
                echo "<td>" . $row["telefono"] . "</td>";
                echo "<td>" . $row["rol"] . "</td>";
                echo "<td>";
                echo "<a href='editar.php?id=" . $row["id"] . "'>Editar</a> | ";
                echo "<a href='eliminar.php?id=" . $row["id"] . "'>Eliminar</a>";
                echo "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='6'>No hay usuarios registrados</td></tr>";
        }
        ?>
    </table>
</body>
</html>

<?php
// Cerrar la conexión
$conn->close();
?>
