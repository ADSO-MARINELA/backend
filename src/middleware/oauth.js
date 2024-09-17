import jwt from "jsonwebtoken";
import { config } from "dotenv";
config();

export const verifyToken = async (req, res, next) => {
    const token = req.headers['x-access-token'];

    if (!token) {
        return res.status(403).json({ error: true, message: 'No se proporciona ningún token' });
    }

    try {
        const decoded = await jwt.verify(token, process.env.TOKEN_PRIVATEKEY);
        req.user = decoded;
        next();
    } catch (e) {
        console.error("Error al verificar el token:", e.message); // Agrega más información de depuración
        return res.status(401).json({ error: true, message: 'Token inválido', details: e.message });
    }
};
