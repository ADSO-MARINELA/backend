import { pool } from "../config/database.restaurante.mysql.js"; // Importa el pool de conexiones MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde el archivo .env

// Controlador para crear un nuevo registro de personal
export const crearPersonal = async (req, res) => {
  const { nombre, documento, celular, tipos, fecha, estado } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_CREAR_PERSONAL con los parámetros proporcionados
    const respuesta = await pool.query(`CALL SP_CREAR_PERSONAL(?,?,?,?,?,?)`, [
      nombre,
      documento,
      celular,
      tipos,
      fecha,
      estado,
    ]);
    res.json({ respuesta: "El personal ha sido creado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El personal no ha sido creado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para modificar un registro de personal existente
export const modificarPersonal = async (req, res) => {
  const { id, nombre, documento, celular, tipos, fecha, estado } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_MODIFICAR_PERSONAL con los parámetros proporcionados
    const respuesta = await pool.query(
      `CALL SP_MODIFICAR_PERSONAL(?,?,?,?,?,?,?)`,
      [id, nombre, documento, celular, tipos, fecha, estado]
    );
    res.json({ respuesta: "El personal ha sido modificado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El personal no ha sido modificado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para listar todos los registros de personal
export const listarPersonal = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_PERSONAL para obtener todos los registros de personal
    const respuesta = await pool.query(`CALL SP_LISTAR_PERSONAL()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para eliminar un registro de personal
export const eliminarPersonal = async (req, res) => {
  const id_personal = req.params.id; // Extrae el id del personal de los parámetros de la URL
  console.log(req.params); // Imprime los parámetros de la solicitud para depuración

  try {
    // Llama al procedimiento almacenado SP_ELIMINAR_PERSONAL con el id proporcionado
    const respuesta = await pool.query(`CALL SP_ELIMINAR_PERSONAL(?)`, [
      id_personal,
    ]);
    res.json({ respuesta: "El personal ha sido eliminado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El personal no ha sido eliminado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};
