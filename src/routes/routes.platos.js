import { Router } from "express";

const rutaPlatos = Router();

rutaPlatos.get("/platos", () => {
  console.log("listar");
});

export default rutaPlatos;
