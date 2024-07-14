import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const crearHorario = async (req, res) => {
  const { dia, inicio, salida } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_CREAR_HORARIO(?,?,?)`, [
      dia,
      inicio,
      salida,
    ]);
    res.json({ respuesta: "El horario ha sido creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El horario no ha sido creado" });
    console.log(error);
  }
};

export const modificarHorario = async (req, res) => {
  const { id, dia, inicio, salida } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_MODIFICAR_HORARIO(?,?,?,?)`, [
      id,
      dia,
      inicio,
      salida,
    ]);
    res.json({ respuesta: "El usuario ha sido modificado Exitosamente!" });
  } catch (error) {
    res.json({ error: "el usuario no ha sido modificado" });
    console.log(error);
  }
};

export const eliminarHorario = async (req, res) => {
  const { id_horario } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_ELIMINAR_HORARIO(?)`, [
      id_horario,
    ]);
    res.json({ respuesta: "El horario ha sido eliminado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El horario no ha sido eliminado" });
  }
};
