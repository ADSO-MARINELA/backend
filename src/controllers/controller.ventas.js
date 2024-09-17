import { pool } from "../config/database.restaurante.mysql.js"; // Importa el pool de conexiones MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde el archivo .env

// Controlador para listar todas las ventas
export const listarVentas = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_VENTAS para obtener todas las ventas
    const respuesta = await pool.query(`CALL SP_LISTAR_VENTAS()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};
