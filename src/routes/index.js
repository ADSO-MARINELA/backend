import { Router } from "express"; // Importa el Router de Express para crear rutas modularizadas
import rutaHorariosEstablecimiento from "./routes.horario.establecimiento.js"; // Importa el router para rutas relacionadas con los horarios del establecimiento
import rutaPersonal from "./routes.personal.js"; // Importa el router para rutas relacionadas con el personal
import rutaPlatos from "./routes.platos.js"; // Importa el router para rutas relacionadas con los platos
import rutaVentas from "./routes.ventas.js"; // Importa el router para rutas relacionadas con las ventas
import rutaQuincena from "./route.quincena.js"; // Importa el router para rutas relacionadas con la quincena
import rutaUsuarios from "./route.usuarios.js"; // Importa el router para rutas relacionadas con los usuarios
import rutaHorariosp from "./route.horarios.personal.js"; // Importa el router para rutas relacionadas con los horarios personales
import rutaOrdenes from "./route.ordenes.js"; // Importa el router para rutas relacionadas con las órdenes
import rutaAdmin from "./route.admin.js";
import rutaLogin from "./route.login.js";

const ruta = Router(); // Crea una instancia de un Router para definir las rutas principales

// Asocia cada sub-router a una ruta base específica
ruta.use("/horarios", rutaHorariosEstablecimiento); // Rutas para gestionar los horarios del establecimiento
ruta.use("/usuarios", rutaUsuarios); // Rutas para gestionar los usuarios
ruta.use("/administrador", rutaAdmin) // Rutas para gestionar los Administradores
ruta.use("/personal", rutaPersonal); // Rutas para gestionar el personal
ruta.use("/platos", rutaPlatos); // Rutas para gestionar los platos
ruta.use("/ventas", rutaVentas); // Rutas para gestionar las ventas
ruta.use("/quincenas", rutaQuincena); // Rutas para gestionar la quincena
ruta.use("/horariosp", rutaHorariosp); // Rutas para gestionar los horarios personales
ruta.use("/ordenes", rutaOrdenes); // Rutas para gestionar las órdenes
//Rutas views
ruta.use("/", rutaLogin);

export default ruta; // Exporta el router principal para que pueda ser utilizado en otros módulos
