import colors from "colors"; // Importa el módulo colors para estilizar la salida en consola

// Función para imprimir mensajes en la consola con diferentes estilos según el tipo
export const consola = (tipo, mensajes) => {
    switch (tipo) {
        case "AccesoPuerto":
            // Imprime el mensaje con un fondo rojo si el tipo es "AccesoPuerto"
            console.log(mensajes.bgRed);
            break;
        case "ErrorPuerto":
            // Imprime el mensaje con un fondo amarillo si el tipo es "ErrorPuerto"
            console.log(mensajes.bgYellow);
            break;
    }
}

// Objeto que contiene mensajes predefinidos
export const mensaje = {
    puerto: "Ejecutandose en el Puerto:", // Mensaje para indicar el puerto en el que se está ejecutando el servidor
}

// Función para enviar una respuesta de éxito en formato JSON
export const Acceso = (req, res, status, mensaje) => {
    res.status(status).json({
        error: false, // Indica que no hubo error
        status: status, // Código de estado HTTP
        body: mensaje // Mensaje de respuesta
    });
}

// Función para enviar una respuesta de error en formato JSON
export const Error = (req, res, status, mensaje) => {
    res.status(status).json({
        error: true, // Indica que hubo un error
        status: status, // Código de estado HTTP
        body: mensaje // Mensaje de error
    });
}
