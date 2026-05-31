<?php
$username = "root";
$password = ""; 
$server = "localhost";
$database = "gatitos";

$conexion = new mysqli($server, $username, $password, $database);

if($conexion->connect_error){
    die("Conexión fallida: " . $conexion->connect_error);
}

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $nombre_real = $conexion->real_escape_string($_POST["nombre_real"]);
    $personaje = $conexion->real_escape_string($_POST["personaje"]);
    $altura = $conexion->real_escape_string($_POST["altura"]);
    $peso = $conexion->real_escape_string($_POST["peso"]);
    $poderes = $conexion->real_escape_string($_POST["poderes"]);
    $sexo = $conexion->real_escape_string($_POST["sexo"]);
    $debilidad = $conexion->real_escape_string($_POST["debilidad"]);
    $creacion = $conexion->real_escape_string($_POST["creacion"]);
    $biografia = $conexion->real_escape_string($_POST["biografia"]);
    $imagen_blob = null;
    if(isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK){
        $tmpName = $_FILES['imagen']['tmp_name'];
        $imagen_blob = $conexion->real_escape_string(file_get_contents($tmpName));
    }

    $sql = "INSERT INTO personajes (`nombre real`, personaje, altura, peso, poderes, sexo, debilidad, creacion, biografia";
    if($imagen_blob !== null){
        $sql .= ", imagen";
    }
    $sql .= ") VALUES ('$nombre_real', '$personaje', '$altura', '$peso', '$poderes', '$sexo', '$debilidad', '$creacion', '$biografia'";
    if($imagen_blob !== null){
        $sql .= ", '$imagen_blob'";
    }
    $sql .= ")";
    
    if($conexion->query($sql) === TRUE){
        echo "<p style='text-align:center; color: #00ff00; font-weight: bold;'>Nuevo personaje creado con éxito.</p>";
    } else {
        echo "<p style='text-align:center; color: #ff0000; font-weight: bold;'>Error: " . $conexion->error . "</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Primera página</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- Bootstrap 3 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <!-- Fuente -->
    <link href="https://fonts.cdnfonts.com/css/zachary" rel="stylesheet">

    <style>
        :root {
            --color-de-fondo: #e53bf4;
            --color-de-letras: #c33999;
            --color-de-barra: #A31621;
            --color-de-botones: #800d96;
            --color-extra: #DB222A;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--color-de-letras); 
            color: #ffffff; 
        }

        h1 {
            color: var(--color-extra); 
            text-align: center;
        }

        form {
            width: 50%;
            margin: auto;
            position: relative;
            z-index: 1; 
            margin-bottom: 50px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #ffffff;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="file"],
        textarea {
            width: 100%; 
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid yellow; 
            border-radius: 5px;
            background-color: #1f1f1f;
            color: #ffffff;
            box-sizing: border-box; 
        }

        table td img {
            max-width: 80px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        input[type="submit"] {
            background-color: pink;
            color: #f580e9;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            margin-bottom: 30px;
        }

        input[type="submit"]:hover {
            background-color: #ff69b4;
        }

     
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #9932cc;
            font-size: 10px;
        }

        table th {
            background-color: #800d96;
            color: #ffffff;
            padding: 10px;
            text-align: left;
            font-weight: bold;
            border: 1px solid #6a0dad;
        }

        table td {
            padding: 8px;
            border: 1px solid #b366e6;
            color: #ffffff;
        }

        table tr:nth-child(even) {
            background-color: #8a2be2;
        }

        table tr:hover {
            background-color: #7d1b8c;
        }
      
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: url('patata.jpg') center/cover no-repeat;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-default">
  <div class="container">

            <div class="navbar-header">
      <a class="navbar-brand" href="index.html">Inicio</a>
    </div>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="nav navbar-nav">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            Unidad 1 <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="mostrar.php">Mostrar Datos</a></li>
            <li><a class="dropdown-item" href="mterdatos.php">Meter Datos</a></li>
            <li><a class="dropdown-item" href="pan.html">pan</a></li>
          </ul>
        </li>                    <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            Unidad 2 <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="relaciones01.php">Relaciones 1</a></li>
            <li><a class="dropdown-item" href="relaciones02.php">Relaciones 2</a></li>
            <li><a class="dropdown-item" href="gato.php">Relaciones 3</a></li>
            <li><a class="dropdown-item" href="mostrargato.php">Mostrar Gatos</a></li>
            <li><a class="dropdown-item" href="capturadatosrelacionados.php">Capturar Datos Relacionados</a></li>
            <li><a class="dropdown-item" href="capturadatosrelacionados - copia.php">Capturar Datos Relacionados - Copia</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            Unidad 3 <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="pokedex.html">Pokedex</a></li>
            <li><a class="dropdown-item" href="pelicula.html">Películas</a></li>
            <li><a class="dropdown-item" href="sailor.html">Sailor moon</a></li>
          </ul>
        </li>
      </ul>
    </div>

  </div>
</nav>
 <h1> Base de datos de personajes</h1>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
        <label for="nombre_real">Nombre real:</label>
        <input type="text" name="nombre_real" required><br>

        <label for="personaje">Personaje:</label>
        <input type="text" name="personaje" required><br>

        <label for="altura">Altura:</label>
        <input type="text" name="altura" required><br>

        <label for="peso">Peso:</label>
        <input type="text" name="peso" required><br>

        <label for="poderes">Poderes:</label>
        <input type="text" name="poderes" required><br>

        <label for="sexo">Sexo:</label>
        <input type="text" name="sexo" required><br>

        <label for="debilidad">Debilidad:</label>
        <input type="text" name="debilidad" required><br>

        <label for="creacion">Creación:</label>
        <input type="date" name="creacion" required><br>

        <label for="biografia">Biografía:</label>
        <textarea name="biografia" required></textarea><br>

        <label for="imagen">Imagen:</label>
        <input type="file" name="imagen" accept="image/*"><br>

        <input type="submit" value="Guardar Datos">
    </form>

    <?php
    // Mostrar todos los datos de la base de datos
    $sql = "SELECT * FROM personajes";
    $result = $conexion->query($sql);

    if ($result && $result->num_rows > 0) {
        echo "<table>";
        echo "<tr>
                <th>Nombre Real</th>
                <th>Personaje</th>
                <th>Altura</th>
                <th>Peso</th>
                <th>Poderes</th>
                <th>Sexo</th>
                <th>Debilidad</th>
                <th>Creación</th>
                <th>Biografía</th>
                <th>Imagen</th>
              </tr>";
        
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['nombre real']) . "</td>";
            echo "<td>" . htmlspecialchars($row['personaje']) . "</td>";
            echo "<td>" . htmlspecialchars($row['altura']) . "</td>";
            echo "<td>" . htmlspecialchars($row['peso']) . "</td>";
            echo "<td>" . htmlspecialchars($row['poderes']) . "</td>";
            echo "<td>" . htmlspecialchars($row['sexo']) . "</td>";
            echo "<td>" . htmlspecialchars($row['debilidad']) . "</td>";
            echo "<td>" . htmlspecialchars($row['creacion']) . "</td>";
            echo "<td>" . htmlspecialchars($row['biografia']) . "</td>";
           
            if(!empty($row['imagen'])){
                $mime = 'image/jpeg'; 
                echo "<td><img src='data:$mime;base64," . base64_encode($row['imagen']) . "' width='80' alt='foto'></td>";
            } else {
                echo "<td>–</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p style='text-align:center; color: #ff0000; font-weight: bold;'>Error en la consulta: " . $conexion->error . "</p>";
    }

    $conexion->close();
    ?>

</body>
</html>