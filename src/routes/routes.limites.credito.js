import { Router } from "express";

const rutaLimites = Router();

rutaLimites.post("/limites", () => {
  console.log("crear");
});
rutaLimites.put("/limites", () => {
  console.log("modificar");
});
rutaLimites.delete("/limites", () => {
  console.log("eliminar");
});

export default rutaLimites;
