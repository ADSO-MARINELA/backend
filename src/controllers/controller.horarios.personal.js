import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const crearHorarioP = async (req, res) => {
  const { dia, entrada, salida } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_CREAR_HORARIO(?,?,?)`, [
      dia,
      entrada,
      salida,
    ]);
    res.json({ respuesta: "El horario ha sido creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El horario no ha sido creado" });
    console.log(error);
  }
};

export const modificarHorarioP = async (req, res) => {
  const { id, dia, entrada, salida } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_MODIFICAR_HORARIO(?,?,?,?)`, [
      id,
      dia,
      entrada,
      salida,
    ]);
    res.json({ respuesta: "El usuario ha sido modificado Exitosamente!" });
  } catch (error) {
    res.json({ error: "el usuario no ha sido modificado" });
    console.log(error);
  }
};
