import { Router } from "express";

const rutaVentas = Router();

rutaVentas.get("/ventas", () => {
  console.log("listar");
});
rutaVentas.get("/ventas/:id", () => {
  console.log("mostrar");
});
rutaVentas.post("/ventas", () => {
  console.log("crear");
});
rutaVentas.put("/ventas", () => {
  console.log("modificar");
});
rutaVentas.delete("/ventas", () => {
  console.log("eliminar");
});

export default rutaVentas;
