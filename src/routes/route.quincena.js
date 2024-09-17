import { Router } from "express"; // Importa el Router de Express para definir rutas
import { listarQuincena } from "../controllers/controller.quincena.js"; // Importa la función listarQuincena desde el controlador de quincena

const rutaQuincena = Router(); // Crea una nueva instancia del Router

// Define una ruta GET en '/quincena' que utiliza la función listarQuincena para manejar las solicitudes
rutaQuincena.get("/quincena", listarQuincena);

export default rutaQuincena; // Exporta la instancia del Router para su uso en otros módulos
