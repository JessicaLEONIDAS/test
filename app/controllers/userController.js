

const userController ={
    signup:(req,res) => {
        res.render('signup.ejs');
    },

    signin:(req,res) => {
        res.render('login.ejs');
    },
    homepage:(req,res) => {
        res.render('userpage.ejs');
    },

}


module.exports =userController;
