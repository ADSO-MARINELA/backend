import { Router } from "express";
import { listarOrden } from "../controllers/controller.ordenes";

const rutaOrdenes = Router();

rutaOrdenes.get("/orden", listarOrden);

export default rutaOrdenes;
