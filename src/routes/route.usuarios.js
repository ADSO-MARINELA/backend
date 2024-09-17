import { Router } from "express"; // Importa el Router de Express para definir rutas
import {
  crearUsuario, // Función para crear un usuario
  eliminarUsuario, // Función para eliminar un usuario
  listarFiados, // Función para listar fiados
  listarPagos, // Función para listar pagos
  listarUsuario, // Función para listar todos los usuarios
  modificarUsuario, // Función para modificar un usuario
  mostrarUsuario, // Función para mostrar un usuario específico
  listarCliente // Función para listar clientes
} from "../controllers/controller.usuarios.js"; // Importa las funciones desde el controlador de usuarios

const rutaUsuarios = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/usuario' para listar todos los usuarios
rutaUsuarios.get("/usuario", listarUsuario);

// Define una ruta GET en '/usuario/:id' para mostrar un usuario específico basado en el ID
rutaUsuarios.get("/usuario/:id", mostrarUsuario);

// Define una ruta POST en '/usuario' para crear un nuevo usuario
rutaUsuarios.post("/usuario", crearUsuario);

// Define una ruta PUT en '/usuario' para modificar un usuario existente
rutaUsuarios.put("/usuario", modificarUsuario);

// Define una ruta DELETE en '/usuario/:id' para eliminar un usuario basado en el ID
rutaUsuarios.delete("/usuario/:id", eliminarUsuario);

// Define una ruta GET en '/fiados' para listar fiados
rutaUsuarios.get("/fiados", listarFiados);

// Define una ruta GET en '/pagos' para listar pagos
rutaUsuarios.get("/pagos", listarPagos);

// Define una ruta GET en '/cliente' para listar clientes
rutaUsuarios.get("/cliente", listarCliente);

export default rutaUsuarios; // Exporta la instancia del Router para su uso en otros módulos
