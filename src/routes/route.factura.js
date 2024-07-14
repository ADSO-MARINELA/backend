import { Router } from "express";
import { crearFactura } from "../controllers/controller.factura";

const rutaFactura = Router();

rutaFactura.post("/factura", crearFactura);

export default rutaFactura;