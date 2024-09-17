import { Router } from "express"; // Importa el Router de Express para definir rutas
import { listarOrden } from "../controllers/controller.ordenes.js"; // Importa la función listarOrden desde el controlador de órdenes

const rutaOrdenes = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/orden' que utiliza la función listarOrden para manejar las solicitudes
rutaOrdenes.get("/orden", listarOrden);

export default rutaOrdenes; // Exporta la instancia del Router para su uso en otros módulos
