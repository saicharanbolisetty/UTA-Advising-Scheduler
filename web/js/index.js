//$("#scheduleBtn").button();
//$("#loginBtn").button().click(function(){});
$("#loginBtn").on('click', function () {
    var cookie = document.cookie;
    var cookies = cookie.split(";");
    var pairs;
    var checked = "";
    var email = "";
    for (var index = 0; index < cookies.length; index++) {
        pairs = cookies[index].split("=");
        if ( pairs[0] == "email" ) {
            email = pairs[1];
            checked = "checked";
        }
    }
    
    bootbox.dialog({
        title: "Login",
        message: "<form role='form' id='loginform' method='POST' action='LoginValidation.jsp' onsubmit='return validate();'>"
                + "<div class='form-group'>"
                + "<label for='username'>Username</label>"
                + "<input class='form-control' type='text' name='username' id='username' value='" + email + "'>"
                + "</div>"
                + "<div class='form-group'>"
                + "<label for='password'>Password</label>"
                + "<input class='form-control' type='password' name='password' id='password' value=''>"
                + "<label for='saveuser'>Save user name</label>"
                + "<input class='form-control' type='checkbox' name='saveuser' id='saveuser' " + checked + ">"
                + "</div>"
                + "</form>"
//                + "<input type='submit' value='Login' id='loginBtn2' class='btn btn-default'>"
        ,
        buttons: {
            success: {
                label: "Login",
                className: "btn-primary",
                callback: function () {
                    document.getElementById("loginform").submit();
                }
            }
        }

    });
});

$("#requestBtn").on('click', function () {
    bootbox.dialog({
        title: "Request Account",
        message: "<form role='form' id='requestform' method='POST' action='RequestAccount.jsp'>"
                + "<div class='form-group'>"
                + "<label for='email'>Email</label>"
                + "<input class='form-control' type='text' name='email' id='email' value=''>"
                + "</div>"
                + "</form>"
        ,
        buttons: {
            success: {
                label: "Request Account",
                className: "btn-primary",
                callback: function () {
                    document.getElementById("requestform").submit();
                }
            }
        }

    });
});
$("#leftAccordion").accordion({heightStyle: content});
$("#rightAccordion").accordion({heightStyle: content});


function validate() {
    var username = document.forms["loginform"]["username"].value;
    var password = document.forms["loginform"]["password"].value;
    
    if (username === null || username === "") {
        $("#username").notify("Please enter your username", "error",
                {elementPosition: 'bottom center',
                    globalPosition: 'bottom center'})
        return false;
    }

    if (password === null || password === "") {
        $("#password").notify("Please enter your password", "error",
                {elementPosition: 'bottom center',
                    globalPosition: 'bottom center'})
        return false;
    }
}