import { pool } from "../config/database.restaurante.mysql.js"; // Importa el pool de conexiones MySQL desde la configuración de la base de datos
import { config } from "dotenv"; // Importa dotenv para manejar variables de entorno
config(); // Carga las variables de entorno desde el archivo .env

// Controlador para mostrar un usuario específico basado en el ID proporcionado en los parámetros de la URL
export const mostrarUsuario = async (req, res) => {
  const { id } = req.params; // Extrae el id del usuario de los parámetros de la URL
  try {
    // Llama al procedimiento almacenado SP_MOSTRAR_USUARIO con el ID proporcionado
    const respuesta = await pool.query(`CALL SP_MOSTRAR_USUARIO("${id}")`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
  } catch (error) {
    res.json({ error: error }); // Envía un objeto de error como respuesta JSON en caso de fallo
  }
};

// Controlador para listar todos los fiados
export const listarFiados = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_FIADOS para obtener todos los fiados
    const respuesta = await pool.query(`CALL SP_LISTAR_FIADOS()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para listar todos los pagos
export const listarPagos = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_PAGOS para obtener todos los pagos
    const respuesta = await pool.query(`CALL SP_LISTAR_PAGOS()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para listar todos los usuarios
export const listarUsuario = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_USUARIO para obtener todos los usuarios
    const respuesta = await pool.query(`CALL SP_LISTAR_USUARIO()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};

// Controlador para crear un nuevo usuario
export const crearUsuario = async (req, res) => {
  const {
    nombre,
    documento,
    celular,
    direccion,
    rol,
    limite,
    inicia,
    vence,
    estado,
  } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_CREAR_USUARIO con los parámetros proporcionados
    const respuesta = await pool.query(
      `CALL SP_CREAR_USUARIO (?,?,?,?,?,?,?,?,?)`,
      [
        nombre,
        documento,
        celular,
        direccion,
        rol,
        limite,
        inicia,
        vence,
        estado,
      ]
    );
    res.json({ respuesta: "El usuario ha sido creado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El usuario no ha sido creado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para modificar un usuario existente
export const modificarUsuario = async (req, res) => {
  const {
    id,
    nombre,
    documento,
    celular,
    direccion,
    rol,
    limite,
    inicia,
    vence,
    estado,
  } = req.body; // Extrae los datos necesarios del cuerpo de la solicitud
  try {
    // Llama al procedimiento almacenado SP_MODIFICAR_USUARIO con los parámetros proporcionados
    const respuesta = await pool.query(
      `CALL SP_MODIFICAR_USUARIO(?,?,?,?,?,?,?,?,?,?)`,
      [
        id,
        nombre,
        documento,
        celular,
        direccion,
        rol,
        limite,
        inicia,
        vence,
        estado,
      ]
    );
    res.json({ respuesta: "El usuario ha sido modificado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El usuario no ha sido modificado" }); // Envía una respuesta de error al cliente
    console.log(error); // Imprime el error en la consola para depuración
  }
};

// Controlador para eliminar un usuario
export const eliminarUsuario = async (req, res) => {
  // const { id_usuarios } = req.body; // Nota: Usando req.params en lugar de req.body para obtener el ID del usuario
  const id_usuarios = req.params.id; // Extrae el id del usuario de los parámetros de la URL
  console.log(req.params); // Imprime los parámetros de la solicitud para depuración

  try {
    // Llama al procedimiento almacenado SP_ELIMINAR_USUARIO con el id proporcionado
    const respuesta = await pool.query(`CALL SP_ELIMINAR_USUARIO(?)`, [
      id_usuarios,
    ]);
    res.json({ respuesta: "El usuario ha sido eliminado exitosamente!" }); // Envía una respuesta de éxito al cliente
  } catch (error) {
    res.json({ error: "El usuario no ha sido eliminado" }); // Envía una respuesta de error al cliente
  }
};

// Controlador para listar todos los clientes
export const listarCliente = async (req, res) => {
  try {
    // Llama al procedimiento almacenado SP_LISTAR_CLIENTE para obtener todos los clientes
    const respuesta = await pool.query(`CALL SP_LISTAR_CLIENTE()`);
    res.json({ respuesta: respuesta[0][0] }); // Envía la primera fila del resultado como respuesta JSON al cliente
    return respuesta[0]; // Devuelve el conjunto de resultados
  } catch (error) {
    console.error(error); // Imprime el error en la consola para depuración
    return { error: error }; // Devuelve un objeto de error
  }
};
