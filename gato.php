<?php
require_once 'conexion.php';
?>
<?php include 'header.php'; ?>

<div class="container-form">
    <form action="proceso.php" method="POST" enctype="multipart/form-data">
        <h2>🐾 Registrar Nuevo Gato</h2>

        <div class="form-group">
            <label for="nombre">Nombre del Gato:</label>
            <input type="text" id="nombre" name="nombre" required placeholder="Ej. Michi">
        </div>

        <div class="form-group">
            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
        </div>

        <div class="form-group">
            <label for="tamaño">Tamaño:</label>
            <select id="tamaño" name="tamaño" required>
                <option value="Pequeño">Pequeño</option>
                <option value="Mediano" selected>Mediano</option>
                <option value="Grande">Grande</option>
            </select>
        </div>

        <div class="form-group">
            <label for="raza">Raza Principal:</label>
            <select id="raza" name="raza" required>
                <option value="">Seleccione una raza</option>
                <?php
                $stmt_raza = $pdo->query("SELECT id, nombre_raza FROM raza");
                while ($row_raza = $stmt_raza->fetch()) {
                    echo "<option value='" . $row_raza['id'] . "'>" . $row_raza['nombre_raza'] . "</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label for="biografia">Biografía:</label>
            <textarea id="biografia" name="biografia" rows="3" placeholder="Cuéntanos algo del gato..."></textarea>
        </div>

        <div class="form-group">
            <label for="alergias">Alergias:</label>
            <input type="text" id="alergias" name="alergias" placeholder="Ninguna / Polen / Pescado">
        </div>

        <div class="form-group">
            <label for="imagen">Foto del Gato:</label>
            <input type="file" id="imagen" name="imagen" accept="image/*">
        </div>

        <div class="seccion-dueno">
            <div class="form-group">
                <label for="id_dueño">Seleccionar Dueño Existente:</label>
                <select id="id_dueño" name="id_dueño">
                    <option value="">-- Seleccione un dueño --</option>
                    <?php
                    $stmt_duenos = $pdo->query("SELECT id, nombre_completo FROM dueños");
                    while ($row = $stmt_duenos->fetch()) {
                        echo "<option value='" . $row['id'] . "'>" . $row['nombre_completo'] . "</option>";
                    }
                    ?>
                </select>
            </div>

            <small>✨ O registra un nuevo dueño abajo:</small>

            <div class="form-group">
                <label for="nombre_completo">Nombre Completo:</label>
                <input type="text" id="nombre_completo" name="nombre_completo" placeholder="Nombre del humano">
            </div>

            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono">
            </div>

            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion">
            </div>
        </div>

        <button type="submit" class="btn-submit">💾 Guardar Gato</button>
    </form>
</div>

</body>
</html>