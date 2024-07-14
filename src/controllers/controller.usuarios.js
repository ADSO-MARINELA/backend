import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
config();

export const mostrarUsuario = async (req, res) => {
  const { id } = req.params;
  try {
    const respuesta = await pool.query(`CALL SP_MOSTRAR_USUARIO("${id}")`);
    res.json({ respuesta: respuesta[0][0] });
  } catch (error) {
    res.json({ error: error });
  }
};

export const listarFiados = async (req, res) => {
  try {
    const respuesta = await pool.query(`CALL SP_LISTAR_FIADOS()`);
    res.json({ respuesta: respuesta[0][0] });
    return respuesta[0];
  } catch (error) {
    console.error(error);
    return { error: error };
  }
};

export const listarPagos = async (req, res) => {
  try {
    const respuesta = await pool.query(`CALL SP_LISTAR_PAGOS()`);
    res.json({ respuesta: respuesta[0][0] });
    return respuesta[0];
  } catch (error) {
    console.error(error);
    return { error: error };
  }
};

export const listarUsuario = async (req, res) => {
  try {
    const respuesta = await pool.query(`CALL SP_LISTAR_USUARIO()`);
    res.json({ respuesta: respuesta[0][0] });
    return respuesta[0];
  } catch (error) {
    console.error(error);
    return { error: error };
  }
};

export const crearUsuario = async (req, res) => {
  const {
    nombre,
    documento,
    correo,
    clave,
    celular,
    direccion,
    rol,
    fk_credito,
    inicia,
    vence,
    estado,
  } = req.body;
  try {
    const respuesta = await pool.query(
      `CALL SP_CREAR_USUARIO (?,?,?,?,?,?,?,?)`,
      [
        nombre,
        documento,
        correo,
        clave,
        celular,
        direccion,
        rol,
        fk_credito,
        inicia,
        vence,
        estado,
      ]
    );
    res.json({ respuesta: "El usuario ha sido creado Exitosamente!" });
  } catch (error) {
    res.json({ error: "el usuario no ha sido creado" });
    console.log(error);
  }
};

export const modificarUsuario = async (req, res) => {
  const {
    id,
    nombre,
    documento,
    correo,
    clave,
    celular,
    direccion,
    rol,
    fk_credito,
    inicia,
    vence,
    estado,
  } = req.body;
  try {
    const respuesta = await pool.query(
      `CALL SP_MODIFICAR_USUARIO(?,?,?,?,?,?,?,?,?)`,
      [
        id,
        nombre,
        documento,
        correo,
        clave,
        celular,
        direccion,
        rol,
        fk_credito,
        inicia,
        vence,
        estado,
      ]
    );
    res.json({ respuesta: "El usuario ha sido modificado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El usuario no ha sido modificado" });
    console.log(error);
  }
};

export const eliminarUsuario = async (req, res) => {
  const { id_usuarios } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_ELIMINAR_USUARIO(?)`, [
      id_usuarios,
    ]);
    res.json({ respuesta: "El usuario ha sido eliminado Exitosamente!" });
  } catch (error) {
    res.json({ error: "El usuario no ha sido eliminado" });
  }
};
