import { Router } from "express";
import { listarQuincena } from "../controllers/controller.quincena";

const rutaQuincena = Router();

rutaQuincena.get("/quincena", listarQuincena);

export default rutaQuincena;
