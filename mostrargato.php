<?php
require_once 'conexion.php';

try {
    $sql = "SELECT g.*, d.nombre_completo AS dueno, GROUP_CONCAT(r.nombre_raza SEPARATOR ', ') AS razas
            FROM gatos g
            LEFT JOIN dueños d ON g.id_dueño = d.id
            LEFT JOIN gato_raza gr ON g.id = gr.gato_id
            LEFT JOIN raza r ON gr.raza_id = r.id
            GROUP BY g.id
            ORDER BY g.id DESC";

    $stmt = $pdo->query($sql);
    $gatos = $stmt->fetchAll();
} catch (PDOException $e) {
    $gatos = [];
    $error = $e->getMessage();
}
?>

<?php include 'header.php'; ?>

<style>
    :root {
        --color-morado-oscuro: #800d96;
        --color-letras: #ffffff;
        --color-borde: #b366e6;
    }

    body {
        font-family: 'Arial', sans-serif;
        color: var(--color-letras);
        padding: 20px;
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

    .titulo-seccion {
        text-align: center;
        margin: 40px 0;
    }

    .titulo-seccion h1 {
        color: #ff0000;
        font-size: 40px;
        text-shadow: 2px 2px #000;
        margin-bottom: 5px;
    }

    .btn-nuevo {
        display: inline-block;
        background-color: var(--color-morado-oscuro);
        color: #fff;
        padding: 10px 20px;
        border-radius: 8px;
        text-decoration: none;
        border: 1px solid white;
        margin-bottom: 20px;
    }

    .btn-nuevo:hover {
        background-color: #c33999;
        color: #fff;
    }

    .cards-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
        padding: 20px 0;
    }

    .x-card {
        background-color: rgba(128, 13, 150, 0.85);
        border: 2px solid var(--color-borde);
        border-radius: 15px;
        overflow: hidden;
        transition: transform 0.3s ease;
        box-shadow: 0 10px 20px rgba(0,0,0,0.35);
    }

    .x-card:hover {
        transform: translateY(-8px);
        border-color: white;
    }

    .card-header {
        background-color: var(--color-morado-oscuro);
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid var(--color-borde);
    }

    .card-header h3 {
        margin: 0;
        color: #fff;
        font-size: 20px;
    }

    .card-img-container {
        width: 100%;
        height: 200px;
        background-color: #222;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    .card-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .card-body {
        padding: 16px;
        line-height: 1.5;
    }

    .card-stat {
        margin-bottom: 10px;
        border-bottom: 1px solid rgba(255,255,255,0.15);
        padding-bottom: 6px;
        font-size: 14px;
    }

    .stat-label {
        font-weight: bold;
        color: #f1b6f9;
        margin-right: 6px;
    }
</style>

<div class="container">
    <div class="titulo-seccion">
        <h1>Mostrar Gatos</h1>
        <h3>Unidad 2</h3>
    </div>

    <div style="text-align:center; margin-bottom: 20px;">
        <a href="gato.php" class="btn-nuevo">🐾 Ingresar nuevo gato</a>
    </div>

    <div class="cards-grid">
        <?php if(!empty($error)): ?>
            <p style="color:#ffdddd; text-align:center; grid-column:1/-1;">Error: <?php echo htmlspecialchars($error); ?></p>
        <?php endif; ?>

        <?php if(empty($gatos)): ?>
            <p style="text-align:center; grid-column:1/-1;">No se encontraron gatos registrados.</p>
        <?php else: ?>
            <?php foreach($gatos as $gato): ?>
                <div class="x-card">
                    <div class="card-header">
                        <h3><?php echo htmlspecialchars($gato['nombre']); ?></h3>
                    </div>

                    <div class="card-img-container">
                        <?php if(!empty($gato['imagen'])): ?>
                            <img class="card-img" src="data:image/jpeg;base64,<?php echo base64_encode($gato['imagen']); ?>" alt="Foto de <?php echo htmlspecialchars($gato['nombre']); ?>">
                        <?php else: ?>
                            <div style="color:#ffddff; font-style:italic;">Sin imagen</div>
                        <?php endif; ?>
                    </div>

                    <div class="card-body">
                        <div class="card-stat"><span class="stat-label">Nacimiento:</span><?php echo htmlspecialchars($gato['fecha_nacimiento'] ?: 'Desconocido'); ?></div>
                        <div class="card-stat"><span class="stat-label">Edad:</span>
                            <?php
                                if(!empty($gato['fecha_nacimiento'])) {
                                    $fecha_nac = new DateTime($gato['fecha_nacimiento']);
                                    $hoy = new DateTime();
                                    $edad = $hoy->diff($fecha_nac);
                                    echo $edad->y . ' años';
                                } else {
                                    echo 'Desconocida';
                                }
                            ?>
                        </div>
                        <div class="card-stat"><span class="stat-label">Tamaño:</span><?php echo htmlspecialchars($gato['tamaño']); ?></div>
                        <div class="card-stat"><span class="stat-label">Dueño:</span><?php echo htmlspecialchars($gato['dueno'] ?? 'Sin dueño'); ?></div>
                        <div class="card-stat"><span class="stat-label">Razas:</span><?php echo htmlspecialchars($gato['razas'] ?: 'Mestizo'); ?></div>
                        <?php if(!empty($gato['biografia'])): ?>
                            <div class="card-stat" style="border-bottom:none;"><span class="stat-label">Biografía:</span><small><?php echo htmlspecialchars($gato['biografia']); ?></small></div>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>

</body>
</html>
