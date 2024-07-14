import { Router } from "express";
import { crearHorario, eliminarHorario, modificarHorario } from "../controllers/controller.horario.establecimiento";

const rutaHorariosEstablecimiento = Router();

rutaHorariosEstablecimiento.post("/horario",crearHorario);
rutaHorariosEstablecimiento.put("/horario", modificarHorario);
rutaHorariosEstablecimiento.delete("/horario", eliminarHorario);

export default rutaHorariosEstablecimiento;
