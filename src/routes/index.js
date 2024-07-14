import { Router } from "express";
import rutaAnotaciones from "../routes/route.anotaciones.js";
import rutaHorariosEstablecimiento from "./routes.horario.establecimiento.js";
import rutaOrdenes from "../routes/route.ordenes.js";
import rutaUsuarios from "../routes/route.usuarios.js";
import rutaLimites from "./routes.limites.credito.js";
import rutaPersonal from "./routes.personal.js";
import rutaPlatos from "./routes.platos.js";
import rutaVentas from "./routes.ventas.js";
import rutaQuincena from "./route.quincena.js";

const ruta = Router();

ruta.use("/anotaciones", rutaAnotaciones)
ruta.use("/horarios", rutaHorariosEstablecimiento)
ruta.use("/ordenes", rutaOrdenes)
ruta.use("/usuarios", rutaUsuarios)
ruta.use("/limites", rutaLimites)
ruta.use("/personal", rutaPersonal)
ruta.use("/platos", rutaPlatos)
ruta.use("/ventas", rutaVentas)
ruta.use("/quincenas", rutaQuincena)

export default ruta;