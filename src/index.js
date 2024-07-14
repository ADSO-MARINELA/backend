import { mensaje, consola } from "./message/mensajes.js";
import server from "./server.js"

server.listen(server.get("port"),()=> {
    consola("AccesoPuerto",
    `${mensaje.puerto} http://localhost:${server.get("port")}`)
})