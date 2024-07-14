import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const crearPersonal = async (req, res) => {
  const { nombre, documento, celular, tipo, fecha, estado } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_CREAR_PERSONAL(?,?,?)`, [
      nombre,
      documento,
      celular,
      tipo,
      fecha,
      estado,
    ]);
    res.json({ respuesta: "El personal ha sido creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "el personal no ha sido creado" });
    console.log(error);
  }
};

export const modificarPersonal = async (req, res) => {
  const { id, nombre, documento, celular, tipo, fecha, estado } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_MODIFICAR_PERSONAL(?,?,?,?)`, [
      id,
      nombre,
      documento,
      celular,
      tipo,
      fecha,
      estado,
    ]);
    res.json({ respuesta: "El personal ha sido modificado Exitosamente!" });
  } catch (error) {
    res.json({ error: "el personal no ha sido modificado" });
    console.log(error);
  }
};
