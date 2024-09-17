import { Router } from "express"; // Importa el Router de Express para definir rutas
import { verifyToken } from "../middleware/oauth.js";
import { crearAdmin, logueoAdmin, validarToken } from "../controllers/controller.admin.js";

const rutaAdmin = Router(); // Crea una nueva instancia del Router

// Define una ruta POST en '/admin' para crear un nuevo usuario
rutaAdmin.post("/admin", crearAdmin);
//login
rutaAdmin.post("/loginadmin", logueoAdmin);
//Verificar y Válidar Token
rutaAdmin.post("/oauth", verifyToken, validarToken)

export default rutaAdmin;