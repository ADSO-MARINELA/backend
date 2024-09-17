import { Router } from "express"; // Importa el Router de Express para definir rutas
import {
  crearPersonal, // Función para crear un personal
  eliminarPersonal, // Función para eliminar un personal
  listarPersonal, // Función para listar todos los personales
  modificarPersonal // Función para modificar un personal
} from "../controllers/controller.personal.js"; // Importa las funciones desde el controlador de personal

const rutaPersonal = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/personall' para listar todos los personales
rutaPersonal.get("/personall", listarPersonal);

// Define una ruta POST en '/personall' para crear un nuevo personal
rutaPersonal.post("/personall", crearPersonal);

// Define una ruta PUT en '/personall' para modificar un personal existente
rutaPersonal.put("/personall", modificarPersonal);

// Define una ruta DELETE en '/personall/:id' para eliminar un personal basado en el ID
rutaPersonal.delete("/personall/:id", eliminarPersonal);

export default rutaPersonal; // Exporta la instancia del Router para su uso en otros módulos
