const homeAdminController = {
    homeAdmin:(req,res) => {
        res.render('adminpage.ejs');
    },
    create:(req,res) => {
        res.render('create.ejs');
    },
}

module.exports = homeAdminController;