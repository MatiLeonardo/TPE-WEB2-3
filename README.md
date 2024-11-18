# TPE-PARTE3: API Categorias de productos

¡Bienvenido a la API de Categorias de productos! Esta API proporciona acceso a datos detallados de categorias almacenadas en nuestra base de datos.

## Equipo
- **Miembro B:** Matías Leonardo Gomez

## Endpoints

### Listado de Categorias
Cada categoria se presenta en el siguiente formato:

{
    "id": "2",
    "nombre": "teclados",
    "descripcion": "descripcion",
    "oferta": "1"
}

#### GET:/categoria

Este endpoint lista las categorias.

Ordenamiento

    Query Params:
        ?oferta=true: Devuelve aquellas categorias que se encuentran en oferta.
        ?orderBy=nombre o ?orderBy=descripcion: Filtra de manera ascendente dependiendo el campo elegido.


EJEMPLO COMPLETO DE LISTADO CON TODOS SUS FILTROS
GET:/api/categorias/?oferta=true&orderBy=nombre


#### GET:/categorias/:ID
Este endpoint muestra la información de una categoria especificada por su ID.

    GET:/categoria/:ID
    Obtiene la información de una categoria específica mediante su ID.

#### POST:/categorias
Añade una nuevo categoria a la base de datos.

Datos requeridos en el body:
{
    "id": "2",
    "nombre": "teclados",
    "descripcion": "descripcion",
    "oferta": "1"
}


#### PUT:/categorias/:ID
Modifica los datos de una categoria especificada por su ID.


Datos requeridos en el body:
{
    "id": "2",
    "nombre": "teclados",
    "descripcion": "descripcion",
    "oferta": "1"
}

En caso de no pasar algún dato (por ejemplo, la descripcion), dara un error.

Ejemplo: PUT:/api/categorias/2


#### DELETE:/categorias/:ID
Elimina una categoria de la base de datos, especificada por su ID.

Ejemplo: DELETE:/api/categorias/2