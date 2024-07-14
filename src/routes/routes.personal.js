import { Router } from "express";

const rutaPersonal = Router();

rutaPersonal.get("/personal", () => {
  console.log("listar");
});
rutaPersonal.post("/personal", () => {
  console.log("crear");
});
rutaPersonal.put("/personal", () => {
  console.log("modificar");
});

export default rutaPersonal;
