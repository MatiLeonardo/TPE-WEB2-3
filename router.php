<?php
require_once 'libs/router.php';

$router = new Router();


$router->addRoute('categorias', 'GET', 'CategoriaApiController', 'getCategorias');
$router->addRoute('categorias', 'POST', 'CategoriaApiController', 'addCategoria');
$router->addRoute('categorias/:ID', 'GET', 'CategoriaApiController', 'getCategoria');
$router->addRoute('categorias/:ID', 'DELETE', 'CategoriaApiController', 'deleteCategoria');
$router->addRoute('categorias/:ID', 'PUT', 'CategoriaApiController', 'editCategoria');



$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
