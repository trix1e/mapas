<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $servername = "localhost";
  $username = "root";
  $password = "";
  $database = "agrov";

  // Crear conexión
  $conn = new mysqli($servername, $username, $password, $database);

  // Verificar la conexión
  if ($conn->connect_error) {
    die("Error al conectar a la base de datos: " . $conn->connect_error);
  }

  // Obtener los datos del formulario
  $usuario = $_POST['inputUsuario'];
  $contrasena = $_POST['inputContrasena'];
  $nombre = $_POST['inputNombre'];
  $direccion = $_POST['inputDireccion'];
  $numero = $_POST['inputNumero'];
  $rol = $_POST['inputRol'];
  $fecha = $_POST['inputFecha'];

  // Crear la consulta SQL para insertar los datos en la tabla
  $sql = "INSERT INTO usuarios (usuario, contraseña, nombre_completo, direccion, telefono, rol, fecha_creacion) VALUES ('$usuario', '$contrasena', '$nombre', '$direccion', '$numero', '$rol', '$fecha')";

  if ($conn->query($sql) === TRUE) {
    echo "Datos insertados correctamente en la tabla usuarios.";
    header("location:index.php");

  } else {
    echo "Error al insertar los datos: " . $conn->error;
  }

  // Cerrar la conexión
  $conn->close();
}
?>
