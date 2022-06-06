const { Sequelize } = require("sequelize");
require("dotenv").config();

const DM_NAME = process.env.DM_NAME;
const DM_HOST = process.env.DM_HOST;
const DM_USER = process.env.DM_USER;
const DM_PASS = process.env.DM_PASS;

const dm = new Sequelize(DM_NAME, DM_USER, DM_PASS, {
  host: DM_HOST,
  dialect: "mysql",
});

const connectDM = async () => {
  try {
    await dm.authenticate();
    console.log("Conexión con datamart establecida");
  } catch (error) {
    console.error("Error al conectarse al datamart", error);
  }
};

module.exports = {
  dm,
  connectDM,
};
