import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const crearLimite = async (req, res) => {
  const { fecha, limite } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_CREAR_LIMITE_CREDITO (?,?)`, [
      fecha,
      limite,
    ]);
    res.json({ respuesta: "El limite de credito se ha creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El limite de credito no ha sido creado" });
    console.log(error);
  }
};

export const modificarLimite = async (req, res) => {
  const { id, fecha, limite } = req.body;
  try {
    const respuesta = await pool.query(
      `CALL SP_MODIFICAR_LIMITE_CREDITO(?,?,?)`,
      [id, fecha, limite]
    );
    res.json({
      respuesta: "El limite de credito ha sido modificado Exitosamente!",
    });
  } catch (error) {
    res.json({ error: "El limite de credito no ha sido modificado" });
    console.log(error);
  }
};

export const eliminarLimite = async (req, res) => {
  const { id_credito } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_ELIMINAR_LIMITE_CREDITO(?)`, [
      id_credito,
    ]);
    res.json({
      respuesta: "El limite de credito se ha eliminado Exitosamente!",
    });
  } catch (error) {
    res.json({ error: "El limite de credito no ha sido eliminado" });
  }
};
