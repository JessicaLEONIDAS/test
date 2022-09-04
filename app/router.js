const express = require('express');

const router = express.Router();


//on récupère le controller
const userController =require('./controllers/userController');
const homeController =require('./controllers/homeController');
const servController =require('./controllers/servController');
const adminController =require('./controllers/adminController');
const homeAdminController =require('./controllers/homeAdmin');
const createController =require('./controllers/homeAdmin');

const usController =require('./controllers/usController');


//on définit la route
router.get("/signup", userController.signup);
router.get("/login", userController.signin);
router.get("/", homeController.home);
router.get("/services", servController.services);
router.get("/admin", adminController.admin);
router.get("/homeadmin", homeAdminController.homeAdmin);
router.get("/create", createController.create);
router.get("/contact", usController.contact);
router.get("/userpage", userController.homepage);

router.use((req,res)=>{
    res.status(404).render("404.ejs");
})

// router.post("/login", userController.login);
// router.post("/signup", userController.login);

// router.get("/logout", userController.logout);



//on export le router
module.exports = router;