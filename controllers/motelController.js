const { QueryTypes } = require("sequelize");
const { db } = require("../db/connectionDB");

const index = async (req, res) => {
  const clientes = await db.query("SELECT * FROM `cliente`", {
    type: QueryTypes.SELECT,
  });
  res.json(clientes);
};

module.exports = {
  index,
};
