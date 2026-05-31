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
            padding: 20px;
        }

        h1 { color: var(--color-extra); text-align: center; }
        h3 { color: #ffffff; text-align: center; margin-bottom: 20px; }

        .navbar { background-color: #C8A2C8 !important; border: none; }
        .navbar-brand, .navbar-nav > li > a { color: #4B0082 !important; font-weight: bold; }
        .navbar-nav > li > a:hover { background-color: #B57EDC !important; }

        table { border-collapse: collapse; width: 95%; background-color: #9932cc; margin: 20px auto; color: #fff; border-radius: 8px; overflow: hidden; font-size: 13px; }
        th { background-color: #800d96; color: white; padding: 15px; text-align: left; border: 1px solid #6a0dad; }
        td { padding: 12px 15px; border: 1px solid #b366e6; color: #fff; }
        tr:nth-child(even) { background-color: #8a2be2; }
        tr:hover { background-color: #7d1b8c; }
        .biografia { font-style: italic; color: #eee; max-width: 200px; }
        .img-personaje { max-width: 80px; height: auto; display: block; margin: 0 auto; border-radius: 4px; }

        body::before {
            content: ""; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            z-index: -1; background: url('patata.jpg') center/cover no-repeat;
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
  </div>
</nav>
    <h1>Aquí voy a mostrar mi tabla</h1>
    <h3> Tabla de superheroes y algun gatito </h3>

    <?php
    $username ="root";
    $password ="";
    $server ="localhost";
    $database ="gatitos"; 
    
    $conexion = new mysqli($server, $username, $password, $database);

    if($conexion->connect_error){
        die("<div style='color:red;'>Conexión fallida: " . $conexion->connect_error . "</div>");
    }

    $sql ="SELECT * FROM personajes";
    $resultado = $conexion->query($sql);

    if($resultado->num_rows > 0){
        echo "<table>";
        echo "<tr>
                <th>ID</th>
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
        
        while($row = $resultado->fetch_assoc()){
            echo "<tr>";
            echo "<td>" . $row["id"] . "</td>";
            echo "<td>" . $row["nombre real"] . "</td>";
            echo "<td>" . $row["personaje"] . "</td>";
            echo "<td>" . $row["altura"] . " cm</td>";
            echo "<td>" . $row["peso"] . " kg</td>";
            echo "<td>" . $row["poderes"] . "</td>";
            echo "<td>" . $row["sexo"] . "</td>";
            echo "<td>" . $row["debilidad"] . "</td>";
            echo "<td>" . $row["creacion"] . "</td>";
            echo "<td class='biografia'>" . $row["biografia"] . "</td>";
            
            // Columna de Imagen corregida
            echo "<td>";
            if(!empty($row["imagen"])){
                echo '<img class="img-personaje" src="data:image/jpeg;base64,' . base64_encode($row["imagen"]) . '">';
            } else {
                echo "Sin imagen";
            }
            echo "</td>";

            echo "</tr>";
        }
        echo "</table>"; 
    } else {
        echo "<p>No se encontraron personajes registrados.</p>";
    }

    $conexion->close();
    ?>
</body>
</html>