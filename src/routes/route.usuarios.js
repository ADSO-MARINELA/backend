import { Router } from "express";
import {
  crearUsuario,
  eliminarUsuario,
  listarFiados,
  listarPagos,
  listarUsuario,
  modificarUsuario,
  mostrarUsuario,
} from "../controllers/controller.usuarios";

const rutaUsuarios = Router();

rutaUsuarios.get("/usuario", listarUsuario);
rutaUsuarios.get("/usuario/:id", mostrarUsuario);
rutaUsuarios.post("/usuario", crearUsuario);
rutaUsuarios.put("/usuario", modificarUsuario);
rutaUsuarios.delete("/usuario", eliminarUsuario);
rutaUsuarios.get("/fiados", listarFiados);
rutaUsuarios.get("/pagos", listarPagos);
// rutaUsuarios.post("/loginusuario", logueoUsuario);
// //Validar token
// rutaUsuarios.post("/oauth", verifytoken, validarToken);

export default rutaUsuarios;
