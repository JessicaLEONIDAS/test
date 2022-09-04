require('dotenv').config();

const express = require('express');


const router = require('./app/router');


const app = express();
const PORT = process.env.PORT || 3009;


app.set('view engine', 'ejs');
app.set('views', './app/views');
app.engine('ejs', require('ejs').__express);


//middlewear en charge des ressources statiques
app.use("/static", express.static('./static/'));

app.use(express.json());

//mise en place du router
app.use(router);

//on ajoute un middlewear pour la gestion des 404
// app.use((req, res)=>{
//     res.status(404).render("404");
// });

app.listen(PORT, () =>{
    console.log(`Listen on http://localhost:${PORT}`);
});
