import { Router } from "express"; // Importa el Router de Express para definir rutas
import { listarVentas } from "../controllers/controller.ventas.js"; // Importa la función para listar ventas desde el controlador

const rutaVentas = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/venta' para listar todas las ventas
rutaVentas.get("/venta", listarVentas);

export default rutaVentas; // Exporta la instancia del Router para su uso en otros módulos
