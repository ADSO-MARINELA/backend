import express from "express"
import ruta from "./routes/index.js"
import rutaAnotaciones from "./routes/route.anotaciones.js";
import rutaHorariosEstablecimiento from "./routes/routes.horario.establecimiento.js";
import rutaOrdenes from "./routes/route.ordenes.js";
import rutaUsuarios from "./routes/route.usuarios.js";

const server = express();

server.use(express.json());

server.use("/", ruta);

server.set("port", process.env.PORT || 3000);

export default server;