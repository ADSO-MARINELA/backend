import { config } from "dotenv";
import { listarPlatos } from "../controllers/controller.platos.js";
import { listarUsuario } from "../controllers/controller.usuarios.js";
import { listarOrden } from "../controllers/controller.ordenes.js";
import { listarPersonal } from "../controllers/controller.personal.js";
import { listarHorarioP } from "../controllers/controller.horarios.personal.js";
import { listarQuincena } from "../controllers/controller.quincena.js";
import { listarVentas } from "../controllers/controller.ventas.js";
import { listarHorario } from "../controllers/controller.horario.establecimiento.js";
config();

export const inicio = (req, res)=>{
    const url = process.env.BACKEND_URL;
    const opciones = {
        url : url
        };
    res.render("login.html", opciones);
}

export const dashboard = async (req, res) => {
    try {
        const respuesta = await listarUsuario(req, res);
        const platos = await listarPlatos(req, res);
        const ordenes = await listarOrden(req, res);
        const Hestablecimiento = await listarHorario(req, res);
        const Hpersonal = await listarHorarioP(req, res);
        const personal = await listarPersonal(req, res);
        const quincena = await listarQuincena(req, res);
        const ventas = await listarVentas(req, res);

        res.render("dashboard.html", { 
            usuarios: respuesta[0],
            platos: platos[0],
            ordenes: ordenes[0],
            horarioE: Hestablecimiento[0],
            horarioP: Hpersonal[0],
            personal: personal[0],
            quincena: quincena[0],
            ventas: ventas[0],
        });
    } catch (error) {
        // Renderiza la pantalla de error en caso de que algo falle
        res.status(500).render("error.html", { message: "Hubo un problema al cargar el dashboard. Por favor, intenta de nuevo más tarde." });
    }
};
