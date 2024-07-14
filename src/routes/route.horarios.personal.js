import { Router } from "express";
import {
  crearHorarioP,
  modificarHorarioP,
} from "../controllers/controller.horarios.personal";

const rutaHorarios = Router();

rutaHorarios.post("/horario", crearHorarioP);
rutaHorarios.put("/horario", modificarHorarioP);

export default rutaHorarios;
