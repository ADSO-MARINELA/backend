import { mensaje, consola } from "./message/mensajes.js"; // Importa las funciones de consola y los mensajes desde el módulo 'mensajes.js'
import server from "./server.js"; // Importa la instancia del servidor desde el módulo 'server.js'

// Configura el servidor para escuchar en el puerto especificado
server.listen(server.get("port"), () => {
  // Usa la función 'consola' para imprimir un mensaje en la consola
  consola(
    "AccesoPuerto", // Tipo de mensaje
    `${mensaje.puerto} http://localhost:${server.get("port")}` // Mensaje a imprimir
  );
});
