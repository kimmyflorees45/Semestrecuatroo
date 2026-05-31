<?php
$rel = isset($_GET['rel']) ? intval($_GET['rel']) : null;
$pageTitle = $rel ? "Registro de datos relacionales $rel" : "Capturar datos relacionados";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><?php echo htmlspecialchars($pageTitle); ?></title>
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

         form 
        {
            background: rgba(0,0,0,0.7);
            padding: 40px;
            border-radius: 15px;
            color: #fff;
            max-width: 600px;
            margin: 40px auto;
            text-align: left;
            font-size: 18px;
        }
        form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: none;
            color: #000;
        }
        form input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: var(--color-de-botones);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 20px;
            cursor: pointer;
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
    <title> Kimberly Barrera Flores</title>
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
<div class="container">
    <h1 style="text-align:center; margin-top: 30px; color: #fff;">
        <?php echo htmlspecialchars($pageTitle); ?>
    </h1>
</div>
<form action="ingresar_datos.php" method="post">
    <div class="form-group">
        <input type="hidden" name="relacion" value="<?php echo htmlspecialchars($rel); ?>">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <label for="alias">Alias:</label>
        <input type="text" id="alias" name="alias" required><br>

        <label for="fechacreacion">Fecha de Creación:</label>
        <input type="text" id="fechacreacion" name="fechacreacion" required><br>

        <label for="descripcion">Descripción:</label>
        <input type="text" id="descripcion" name="descripcion" required><br>

        <label for="comics">Cómics:</label>
        <input type="text" id="comics" name="comics" placeholder="Ej: Spider-Man, X-Men" required><br>  

        <label for="superpoderes">Superpoderes:</label>
        <input type="text" id="superpoderes" name="superpoderes" placeholder="Ej: Volar, Superfuerza" required> <br>

        <input type="submit" value="Guardar">
        <input type="reset" value="Borrar">
    </div>
</form>


</body>
</html>