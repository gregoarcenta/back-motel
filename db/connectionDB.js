const { Sequelize } = require("sequelize");
require("dotenv").config();

const DB_NAME = process.env.DB_NAME;
const DB_HOST = process.env.DB_HOST;
const DB_USER = process.env.DB_USER;
const DB_PASS = process.env.DB_PASS;

const db = new Sequelize(DB_NAME, DB_USER, DB_PASS, {
  host: DB_HOST,
  dialect: "mysql",
});

const connectDB = async () => {
  try {
    await db.authenticate();
    console.log("Se ha conectado correctamente a la base de datos");
  } catch (error) {
    console.error("Error al conectarse a la base de datos", error);
  }
};

module.exports = {
  db,
  connectDB,
};
