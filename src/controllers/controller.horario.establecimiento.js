import { pool } from "../config/database.restaurante.mysql.js"; // Importa la conexión al pool de MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa el módulo dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde un archivo .env

// Controlador para crear un nuevo horario
export const crearHorario = async (req, res) => {
  const { dia, apertura, cierre } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Ejecuta el procedimiento almacenado SP_CREAR_HORARIO con los parámetros proporcionados
    const respuesta = await pool.query(`CALL SP_CREAR_HORARIO(?,?,?)`, [dia, apertura, cierre]);
    res.json({ respuesta: "El horario ha sido creado Exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido creado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para modificar un horario existente
export const modificarHorario = async (req, res) => {
  const { id, dia, apertura, cierre } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Ejecuta el procedimiento almacenado SP_MODIFICAR_HORARIO con los parámetros proporcionados
    const respuesta = await pool.query(`CALL SP_MODIFICAR_HORARIO(?,?,?,?)`, [id, dia, apertura, cierre]);
    res.json({ respuesta: "El horario ha sido modificado Exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido modificado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para eliminar un horario
export const eliminarHorario = async (req, res) => {
  const id_horario = req.params.id; // Extrae el id del horario de los parámetros de la URL
  console.log(req.params); // Imprime los parámetros de la solicitud para depuración
  try {
    // Ejecuta el procedimiento almacenado SP_ELIMINAR_HORARIO con el id proporcionado
    const respuesta = await pool.query(`CALL SP_ELIMINAR_HORARIO(?)`, [id_horario]);
    res.json({ respuesta: "El horario ha sido eliminado Exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido eliminado" }); // Envía una respuesta de error al cliente
  }
};

// Controlador para listar todos los horarios
export const listarHorario = async (req, res) => {
  try {
    // Ejecuta el procedimiento almacenado SP_LISTAR_HORARIO para obtener todos los horarios
    const respuesta = await pool.query(`CALL SP_LISTAR_HORARIO()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la lista de horarios al cliente
    return respuesta[0]; // Devuelve la respuesta obtenida
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};
