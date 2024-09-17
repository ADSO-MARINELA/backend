import { Router } from "express";
import { dashboard, inicio } from "../controllers/controller.login.js";

const rutaLogin = Router();

// Ruta principal para el login
rutaLogin.get("/", inicio);
rutaLogin.get("/dashboard", dashboard)

export default rutaLogin;
