import colors from "colors"

export const consola = (tipo, mensajes)=>{
    switch (tipo) {
        case "AccesoPuerto":
            console.log(mensajes.bgRed);
            break;
        case "ErrorPuerto":
        console.log(mensajes.bgYellow);
            break;
    }
}
export const mensaje = {
    puerto: "Ejecutandose en el Puerto:",
}

export const Acceso = (req,res, status=200, mensaje="")=>{
    res.status(status).json({
        error: false,
        status: status,
        body: mensaje
    })
}
export const Error = (req, res,status=500, mensaje="")=>{
    res.status(status).json({
        error: true,
        status: status,
        body: mensaje
    })
}
