<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "agrov";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si se ha enviado un formulario de edición
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $usuario = $_POST["usuario"];
    $contraseña = $_POST["contraseña"];
    $nombre_completo = $_POST["nombre_completo"];
    $direccion = $_POST["direccion"];
    $telefono = $_POST["telefono"];
    $rol = $_POST["rol"];

    // Actualizar los datos del usuario en la base de datos
    $sql = "UPDATE usuarios SET usuario='$usuario', contraseña='$contraseña', nombre_completo='$nombre_completo', direccion='$direccion', telefono='$telefono', rol='$rol' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Usuario actualizado correctamente";
    } else {
        echo "Error al actualizar el usuario: " . $conn->error;
    }
}

// Obtener el ID del usuario a editar desde la URL
$id = $_GET["id"];

// Obtener los datos del usuario de la base de datos
$sql = "SELECT * FROM usuarios WHERE id=$id";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $usuario = $row["usuario"];
    $contraseña = $row["contraseña"];
    $nombre_completo = $row["nombre_completo"];
    $direccion = $row["direccion"];
    $telefono = $row["telefono"];
    $rol = $row["rol"];
} else {
    echo "No se encontró el usuario";
    exit();
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Resto de etiquetas <head> -->
</head>
<body class="sb-nav-fixed">
    <!-- Resto del contenido HTML -->

    <h2>Editar Usuario</h2>
    <form action="" method="POST">
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario" value="<?php echo $usuario; ?>">
        <!-- Resto de campos para editar los datos -->
        <button type="submit">Guardar cambios</button>
    </form>

    <!-- Resto del contenido HTML -->

</body>
</html>

<?php
// Cerrar la conexión a la base de datos
$conn->close();
?>
