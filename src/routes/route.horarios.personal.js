import { Router } from "express"; // Importa el Router de Express para definir rutas modularizadas
import {
  crearHorarioP,
  modificarHorarioP,
  listarHorarioP,
  eliminarHorarioP,
} from "../controllers/controller.horarios.personal.js"; // Importa los controladores para manejar las rutas

const rutaHorariosp = Router(); // Crea una instancia de un Router para definir rutas específicas

// Define una ruta POST para crear un horario personal
rutaHorariosp.post("/horariop", crearHorarioP);

// Define una ruta PUT para modificar un horario personal existente
rutaHorariosp.put("/horariop", modificarHorarioP);

// Define una ruta GET para listar horarios personales
rutaHorariosp.get("/horariop", listarHorarioP);

// Define una ruta DELETE para eliminar un horario personal
rutaHorariosp.delete("/horariop", eliminarHorarioP);

export default rutaHorariosp; // Exporta el router para que pueda ser utilizado en otros módulos
