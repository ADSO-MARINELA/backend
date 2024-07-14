import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const crearFactura = async (req, res) => {
  const {
    id_orden,
    id_usuario,
    id_categoria,
    id_plato,
    fecha,
    id_metodo,
    total,
    id_modalidad,
  } = req.body;
  try {
    const respuesta = await pool.query(
      `CALL SP_CREAR_FACTURA(?,?,?,?,?,?,?,?)`,
      [
        id_orden,
        id_usuario,
        id_categoria,
        id_plato,
        fecha,
        id_metodo,
        total,
        id_modalidad,
      ]
    );
    res.json({ respuesta: "la factura ha sido creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "la factura no ha sido creado" });
    console.log(error);
  }
};
