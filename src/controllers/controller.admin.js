/**
 * Este es el controlador de admin
 * @module ctr-administrador
 */

import bcrypt from "bcrypt";
import { pool } from "../config/database.restaurante.mysql.js";
import { config } from "dotenv";
import jwt from "jsonwebtoken";
import { Acceso, Error } from "../message/mensajes.js";
config();

/**
 * Esta funcion sirve para crear usuario nuevos
 * @param {object} req captura peticiones en HTML
 * @param {object} res envia  peticiones en HTML
 */
const crearAdmin = async (req, res) => {
  const { nombre, usuario, clave } = req.body;

  if (!nombre || !usuario || !clave) {
    return res
      .status(400)
      .json({ success: false, error: "Todos los campos son obligatorios." });
  }

  try {
    const hash = await bcrypt.hash(clave, 2);
    const respuesta = await pool.query(
      `CALL SP_CREAR_ADMIN('${nombre}', '${usuario}', '${hash}');`
    );

    if (respuesta[0].affectedRows === 1) {
      return res.status(201).json({
        success: true,
        message: "Usuario creado exitosamente, ¡Yá puedes Iniciar Sesión!",
      });
    } else {
      return res
        .status(400)
        .json({ success: false, error: "No se pudo agregar el nuevo usuario" });
    }
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      success: false,
      error: "Error en el servidor, por favor inténtalo de nuevo más tarde.",
    });
  }
};

/**
 * Esta funcion sirve para loguearse
 * @param {object} req captura peticiones en HTML
 * @param {object} res envia  peticiones en HTML
 */
const logueoAdmin = async (req, res) => {
  const { usuario, clave } = req.body;
  try {
    const respuesta = await pool.query(`CALL SP_BUSCAR_ADMIN('${usuario}')`);
    if (respuesta[0][0] == 0) {
      Error(req, res, 404, "Usuario no existe");
      return;
    }
    const match = await bcrypt.compare(clave, respuesta[0][0][0].CLAVE);
    if (!match) {
      return res.status(401).json({ error: true, message: "Clave errada" });
    }

    let payload = {
      usuario: usuario,
      nombre: respuesta[0][0][0].NOMBRE,
    };
    let token = await jwt.sign(payload, process.env.TOKEN_PRIVATEKEY, {
      expiresIn: process.env.TOKEN_EXPIRES_IN,
    });

    Acceso(req, res, 200, { token });
  } catch (e) {
    console.error(e); // Agrega esto para depurar
    Error(
      req,
      res,
      500,
      "Error en el servidor, por favor inténtalo de nuevo más tarde"
    );
  }
};

const validarToken = (req, res) => {
  const token = req.headers["x-access-token"]?.split(" ")[1];
  if (!token) {
    return res
      .status(401)
      .json({ error: true, message: "No se proporciona ningún token" });
  }

  try {
    const decoded = jwt.verify(token, process.env.TOKEN_PRIVATEKEY);
    return res
      .status(200)
      .json({ error: false, message: "Token válido", data: decoded });
  } catch (err) {
    return res.status(401).json({ error: true, message: "Token inválido" });
  }
};

export { crearAdmin, logueoAdmin, validarToken };
