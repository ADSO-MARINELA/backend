import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const listarVentas = async (req, res) => {
  try {
    const respuesta = await pool.query(`CALL SP_LISTAR_VENTAS()`);
    res.json({ respuesta: respuesta[0][0] });
    return respuesta[0];
  } catch (error) {
    console.error(error);
    return { error: error };
  }
};
