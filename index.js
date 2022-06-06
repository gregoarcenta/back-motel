const express = require("express");
const cors = require("cors");
const { connectDB } = require("./db/connectionDB");
const { connectDM } = require("./db/connectionDM");

//Import routes
const calidadServicio = require("./routes/calidadServicio");

const app = express();
const port = 3000;

app.use(cors());

//conecction mysql
connectDB();
connectDM();

//routes
app.use("/", calidadServicio);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
