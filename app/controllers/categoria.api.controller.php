<?php

require_once 'app/models/categoria.model.php';
require_once 'app/views/json.view.php';

class CategoriaApiController
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new CategoriaModel();
        $this->view = new JSONView();
    }

    public function getCategorias($req, $res)
    {
        $filtrarOferta = null;

        if (isset($req->query->oferta)) {
            $filtrarOferta = $req->query->oferta;
        }

        $orderBy = false;
        if (isset($req->query->orderBy))
            $orderBy = $req->query->orderBy;

        $categorias = $this->model->getCategorias($filtrarOferta, $orderBy);

        return $this->view->response($categorias);
    }

    public function getCategoria($req, $res)
    {
        $id = $req->params->id;

        // obtengo la tarea de la DB
        $categoria = $this->model->getCategoria($id);

        if (!$categoria) {
            return $this->view->response("No existe esa categoria", 404);
        }

        return $this->view->response($categoria);
    }

    public function addCategoria($req, $res)
    {
        if (empty($req->body->nombre) || empty($req->bodydescripcion) || empty($req->body->oferta)) {
            return $this->view->response("Datos incompletos", 400);
        }

        $nombre = $req->body->nombre;
        $descripcion = $req->body->descripcion;
        $oferta = $req->body->oferta;



        $id = $this->model->addCategoria($nombre, $descripcion, $oferta);

        if (!$id) {
            return $this->view->response("Error al crear categoria", 500);
        }

        $categoria = $this->model->getCategoria($id);
        return $this->view->response($categoria, 201);
    }

    public function deleteCategoria($req, $res)
    {
        $id = $req->params->id;
        $categoria = $this->model->getCategoria($id);

        if (!$categoria) {
            return $this->view->response("No existe esa categoria", 404);
        }

        $this->model->removeCategoria($id);
        $this->view->response("Categoria eliminada");
    }

    public function editCategoria($req, $res)
    {
        $id = $req->params->id;
        $categoria = $this->model->getCategoria($id);

        if (!$categoria) {
            return $this->view->response("No existe esa categoria", 404);
        }

        if (empty($req->body->nombre) || empty($req->bodydescripcion) || empty($req->body->oferta)) {
            return $this->view->response("Datos incompletos", 400);
        }

        $nombre = $req->body->nombre;
        $descripcion = $req->body->descripcion;
        $oferta = $req->body->oferta;

        $this->model->editCategoria($id, $nombre, $descripcion, $oferta);

        $categoria = $this->model->getCategoria($id);
        $this->view->response($categoria, 200);
    }
}
