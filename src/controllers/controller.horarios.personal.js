import { pool } from "../config/database.restaurante.mysql.js"; // Importa el pool de conexiones MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde el archivo .env

// Controlador para crear un nuevo horario personal
export const crearHorarioP = async (req, res) => {
  const { dia, entrada, salida } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_CREAR_HORARIO_PERSONAL con los parámetros proporcionados
    const respuesta = await pool.query(
      `CALL SP_CREAR_HORARIO_PERSONAL(?,?,?)`,
      [dia, entrada, salida]
    );
    res.json({ respuesta: "El horario ha sido creado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido creado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para modificar un horario personal existente
export const modificarHorarioP = async (req, res) => {
  const { id, dia, entrada, salida } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_MODIFICAR_HORARIO_PERSONAL con los parámetros proporcionados
    const respuesta = await pool.query(
      `CALL SP_MODIFICAR_HORARIO_PERSONAL(?,?,?,?)`,
      [id, dia, entrada, salida]
    );
    res.json({ respuesta: "El horario ha sido modificado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido modificado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para listar todos los horarios personales
export const listarHorarioP = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_HORARIO_PERSONAL para obtener todos los horarios
    const respuesta = await pool.query(`CALL SP_LISTAR_HORARIO_PERSONAL()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la lista de horarios al cliente
    return respuesta[0]; // Devuelve la respuesta obtenida
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para eliminar un horario personal
export const eliminarHorarioP = async (req, res) => {
  const { id_horario } = req.body; // Extrae el id del horario del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_ELIMINAR_HORARIO_PERSONAL con el id proporcionado
    const respuesta = await pool.query(`CALL SP_ELIMINAR_HORARIO_PERSONAL(?)`, [
      id_horario,
    ]);
    res.json({ respuesta: "El horario ha sido eliminado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El horario no ha sido eliminado" }); // Envía una respuesta de error al cliente
  }
};
