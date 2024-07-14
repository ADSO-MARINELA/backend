import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const listarOrden = async (req, res) => {
  try {
    const respuesta = await pool.query(`CALL SP_LISTAR_ORDEN()`);
    res.json({ respuesta: respuesta[0][0] });
    return respuesta[0];
  } catch (error) {
    console.error(error);
    return { error: error };
  }
};
