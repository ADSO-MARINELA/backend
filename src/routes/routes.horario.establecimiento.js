import { Router } from "express"; // Importa el Router de Express para definir rutas
import {
  crearHorario, // Función para crear un horario
  eliminarHorario, // Función para eliminar un horario
  modificarHorario, // Función para modificar un horario
  listarHorario // Función para listar todos los horarios
} from "../controllers/controller.horario.establecimiento.js"; // Importa las funciones desde el controlador de horarios del establecimiento

const rutaHorariose = Router(); // Crea una nueva instancia del Router

// Define una ruta POST en '/horario' para crear un nuevo horario
rutaHorariose.post("/horario", crearHorario);

// Define una ruta PUT en '/horario' para modificar un horario existente
rutaHorariose.put("/horario", modificarHorario);

// Define una ruta DELETE en '/horario/:id' para eliminar un horario basado en el ID
rutaHorariose.delete("/horario/:id", eliminarHorario);

// Define una ruta GET en '/horario' para listar todos los horarios
rutaHorariose.get("/horario", listarHorario);

export default rutaHorariose; // Exporta la instancia del Router para su uso en otros módulos
