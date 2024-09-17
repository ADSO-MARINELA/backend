import express from "express"; // Importa el módulo Express para crear un servidor
import cors from "cors"; // Importa el middleware CORS para manejar solicitudes de origen cruzado
import morgan from "morgan";
import path from "path";
import { fileURLToPath } from "url";
import { dirname } from 'path';
import ruta from "./routes/index.js"; // Importa las rutas desde el archivo index.js en la carpeta routes

// Configura Express
const server = express(); // Crea una instancia de una aplicación Express
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Servir archivos estáticos (CSS, JS, y HTML)
server.use(express.static(path.join(__dirname, "../../frondRestaurant/src/public")));

// middleware
server.use(morgan('dev'));
server.use(cors()); // Aplica el middleware CORS a todas las rutas de la aplicación
server.use(express.json()); // Permite que el servidor maneje solicitudes con cuerpo JSON
server.use(express.urlencoded({ extended : true }));

// Rutas
server.use("/", ruta); // Monta las rutas importadas en el endpoint raíz

server.set("views", path.join(__dirname, '../../frondRestaurant/src/views'));

server.set("port", process.env.PORT || 3000); // Establece el puerto en el que el servidor escuchará las solicitudes

export default server; // Exporta el servidor para que pueda ser utilizado en otros módulos
