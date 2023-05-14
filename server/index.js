const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
app.use(express.json());
app.use(cors());

app.use(authRouter);

mongoose.connect("mongodb://localhost:27017").then(()=>{
    console.log("connection successful");
}).catch(e=> {
    console.log(e);
})

app.listen(PORT, () => {
    console.log(`server running on ${PORT}`);
});
