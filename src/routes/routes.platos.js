import { Router } from "express"; // Importa el Router de Express para definir rutas
import {
  eliminarPlato, // Función para eliminar un plato
  listarPlatos, // Función para listar todos los platos
  modificarPlato // Función para modificar un plato
} from "../controllers/controller.platos.js"; // Importa las funciones desde el controlador de platos

const rutaPlatos = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/plato' para listar todos los platos
rutaPlatos.get("/plato", listarPlatos);

// Define una ruta PUT en '/plato' para modificar un plato existente
rutaPlatos.put("/plato", modificarPlato);

// Define una ruta DELETE en '/plato' para eliminar un plato
rutaPlatos.delete("/plato", eliminarPlato);

export default rutaPlatos; // Exporta la instancia del Router para su uso en otros módulos
