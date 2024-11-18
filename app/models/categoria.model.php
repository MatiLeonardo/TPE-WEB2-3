<?php
include_once 'config.php';

class CategoriaModel
{

    private $db;

    public function __construct()
    {

        $this->db = new PDO(
            "mysql:host=" . DB_HOST .
                ";dbname=" . DB_NAME . ";charset=utf8",
            DB_USER,
            DB_PASS
        );
        $this->_deploy();
    }

    function _deploy()
    {
        $query = $this->db->query('SHOW TABLES LIKE "categoria"');
        $tables = $query->fetchAll();
        if (count($tables) == 0) {
            $sql = <<<END
        CREATE TABLE `categoria` (
            `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
            `nombre` varchar(100) DEFAULT NULL,
            `descripcion` int(11) NOT NULL,
            `oferta` tinyint(1) NOT NULL,
            PRIMARY KEY (`id_categoria`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
END;
            $this->db->query($sql);

            $this->addCategoria('Mouse', 'Descripción 1', 0);
            $this->addCategoria('procesador', 'Descripción 2', 1);
        }
    }





    function getCategorias($filtrarOferta = null, $orderBy = false)
    {
        $sql = 'SELECT * FROM categoria';

        if ($filtrarOferta != null) {
            if ($filtrarOferta == 'true')
                $sql .= ' WHERE oferta = 1';
            else
                $sql .= ' WHERE oferta = 0';
        }

        if ($orderBy) {
            switch ($orderBy) {
                case 'nombre':
                    $sql .= ' ORDER BY nombre';
                    break;
                case 'descripcion':
                    $sql .= ' ORDER BY descripcion';
                    break;
            }
        }

        $query = $this->db->prepare($sql);
        $query->execute();
        $categorias = $query->fetchAll(PDO::FETCH_OBJ);

        return $categorias;
    }

    function getCategoria($id)
    {
        $query = $this->db->prepare('SELECT * from categoria WHERE id_categoria = ?');
        $query->execute([$id]);
        $categoria = $query->fetch(PDO::FETCH_OBJ);

        return $categoria;
    }

    function getProductosPorCategoria($id)
    {
        $query = $this->db->prepare('SELECT * FROM producto JOIN categoria ON producto.id_categoria = categoria.id_categoria WHERE categoria.id_categoria = ?');
        $query->execute([$id]);
        $productos = $query->fetchAll(PDO::FETCH_OBJ);

        return $productos;
    }

    function addCategoria($nombre, $descripcion, $oferta)
    {
        $query = $this->db->prepare('INSERT INTO categoria (nombre, descripcion, oferta) VALUES (?, ?, ?)');
        $query->execute([$nombre, $descripcion, $oferta]);

        return $this->db->lastInsertId();
    }

    function removeCategoria($id)
    {
        $query = $this->db->prepare('DELETE FROM categoria WHERE id_categoria = ?');
        $query->execute([$id]);
    }

    function editCategoria($id, $nombre, $descripcion, $oferta)
    {
        $query = $this->db->prepare('UPDATE categoria SET nombre = ?, descripcion = ?, oferta = ? WHERE id_categoria = ?');
        $realizado = $query->execute([$nombre, $descripcion, $oferta, $id]);

        return $realizado;
    }
}
