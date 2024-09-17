import { pool } from "../config/database.restaurante.mysql.js"; // Importa el pool de conexiones MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde el archivo .env

// Controlador para listar todos los platos
export const listarPlatos = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_PLATOS para obtener todos los platos
    const respuesta = await pool.query(`CALL SP_LISTAR_PLATOS()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para modificar un plato existente
export const modificarPlato = async (req, res) => {
  const { id, nombres, categoria, descripcion, precio, imagen, stock, rentabilidad } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_MODIFICAR_PLATO con los parámetros proporcionados
    const respuesta = await pool.query(`CALL SP_MODIFICAR_PLATO(?,?,?,?,?,?,?,?)`, [
      id,
      nombres,
      categoria,
      descripcion,
      precio,
      imagen,
      stock,
      rentabilidad
    ]);
    res.json({ respuesta: "El plato ha sido modificado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El plato no ha sido modificado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para eliminar un plato
export const eliminarPlato = async (req, res) => {
  const { id_plato } = req.body; // Extrae el id del plato del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_ELIMINAR_PLATO con el id proporcionado
    const respuesta = await pool.query(`CALL SP_ELIMINAR_PLATO(?)`, [
      id_plato,
    ]);
    res.json({ respuesta: "El plato ha sido eliminado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El plato no ha sido eliminado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};
