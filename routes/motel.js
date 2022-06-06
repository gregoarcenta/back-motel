const motelController = require("../controllers/motelController");

const router = require("express").Router();

router.route("/").get(motelController.index);

module.exports = router;
