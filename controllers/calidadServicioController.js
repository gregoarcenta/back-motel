const { QueryTypes } = require("sequelize");

const { dm } = require("../db/connectionDM");
const { db } = require("../db/connectionDB");

const syncMotelToDatamart = async (req, res) => {
  try {
    let templateServicio = "INSERT INTO `dim_servicio` VALUES ";
    let templateCalificacion = "INSERT INTO `dim_calificacion` VALUES ";
    let templateTiempo = "INSERT INTO `dim_tiempo` VALUES ";
    let templateHecho = "INSERT INTO `hec_calidad_servicio` VALUES ";

    await dm.query("delete from hec_calidad_servicio", {
      type: QueryTypes.DELETE,
    });
    await dm.query("delete from dim_servicio", { type: QueryTypes.DELETE });
    await dm.query("delete from dim_calificacion", { type: QueryTypes.DELETE });
    await dm.query("delete from dim_tiempo", { type: QueryTypes.DELETE });

    const servicios = await db.query(
      "SELECT servicios.id_servicio, nombre_servicio, cliente.nombrecliente, calificacion, desc_calificacion, idreservaciones, fechadereservacion FROM cliente, servicios, calificacion, reservaciones, calificacion_servicio WHERE cliente.idcliente = calificacion_servicio.id_cliente AND servicios.id_servicio = calificacion_servicio.id_servicio AND calificacion.calificacion = calificacion_servicio.id_calificacion AND reservaciones.idreservaciones = calificacion_servicio.id_reserva",
      {
        type: QueryTypes.SELECT,
      }
    );

    //Llenar tabla servicios
    servicios.forEach((dm, index) => {
      if (index === servicios.length - 1) {
        templateServicio += `(${index + 1}, '${dm.nombre_servicio}')`;
        return;
      }
      templateServicio += `(${index + 1}, '${dm.nombre_servicio}'),`;
    });

    //Llenar tabla calificacion
    servicios.forEach((dm, index) => {
      if (index === servicios.length - 1) {
        templateCalificacion += `(${index + 1}, '${dm.desc_calificacion}', ${
          dm.calificacion
        })`;
        return;
      }
      templateCalificacion += `(${index + 1}, '${dm.desc_calificacion}', ${
        dm.calificacion
      }),`;
    });

    //Llenar tabla tiempo
    servicios.forEach((dm, index) => {
      if (index === servicios.length - 1) {
        templateTiempo += `(${index + 1}, '${dm.fechadereservacion}')`;
        return;
      }
      templateTiempo += `(${index + 1}, '${dm.fechadereservacion}'),`;
    });

    //Llenar tabla hecho
    servicios.forEach((dm, index) => {
      if (index === servicios.length - 1) {
        templateHecho += `(${index + 1}, ${index + 1}, ${index + 1}, ${
          index + 1
        })`;
        return;
      }
      templateHecho += `(${index + 1}, ${index + 1}, ${index + 1}, ${
        index + 1
      }),`;
    });

    await dm.query(templateServicio, { type: QueryTypes.INSERT });
    await dm.query(templateCalificacion, { type: QueryTypes.INSERT });
    await dm.query(templateTiempo, { type: QueryTypes.INSERT });
    await dm.query(templateHecho, { type: QueryTypes.INSERT });

    res.status(200).json({ message: "Datamart Sincronizado" });
  } catch (error) {
    console.log(error);
  }
};

const datamartData = async (req, res) => {
  try {
    const calidad_servicios = await dm.query(
      "SELECT dim_servicio.id_servicio, nombre_servicio, calificacion as id_calificacion, pon_calificacion, desc_calificacion, dim_tiempo.id_tiempo, fecha_visita FROM dim_servicio, dim_calificacion, dim_tiempo, hec_calidad_servicio WHERE dim_servicio.id_servicio = hec_calidad_servicio.id_servicio AND dim_calificacion.calificacion = hec_calidad_servicio.id_calificacion AND dim_tiempo.id_tiempo = hec_calidad_servicio.id_tiempo",
      { type: QueryTypes.SELECT }
    );

    res.status(200).json(calidad_servicios);
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  syncMotelToDatamart,
  datamartData,
};
