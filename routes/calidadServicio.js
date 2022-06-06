const router = require("express").Router();

const calidadServicioController = require("../controllers/calidadServicioController");

router.route("/sync-motel").get(calidadServicioController.syncMotelToDatamart);
router.route("/datamart-data").get(calidadServicioController.datamartData);

module.exports = router;
