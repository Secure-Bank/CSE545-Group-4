<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forgot Password</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
        function validateForm()
        {       	
            var email=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if(!document.frm.email.value.match(email) || !document.frm.confirmemail.value.match(email))
            {
                alert("invalid email address");  
                   return false;
            }
            
            if(document.frm.email.value != document.frm.confirmemail.value)
           	{
           		alert("value of email and confirm email do not match");
           		return false;
           	}
            
           return true;
        }
    </script>
</head>
<body>
    <div class="topnav">
        <a href="#">Link</a>
        <a href="#">Link</a>
        <a href="#">Link</a>
    </div>
    <div class="content">
        <center><h1>Welcome to Sun Financial</h1></center>
        <div id="login-box">
            <h3> Forgot Password </h3>
            <form:form name="frm" action="sendtoemailforgotpassword"  method="post" onSubmit="return validateForm()">
            
            <table>           
                <tr>
                    <td>Email:</td>
                    <td><input type='text' id='email' name='email'></td>
                </tr>
                <tr>
                    <td>Confirm Email:</td>
                    <td><input type='text' id='confirmemail' name='confirmemail'></td>
                </tr>
                <tr>
                    <td colspan="2"> 
        				<input type="submit" id="sendotp" value="Send OTP" />
    				</td>              
                   
                </tr>
            </table>
            </form:form>
        </div>
    </div>
    <div class="footer">
        <p>Footer</p>
    </div>
</body>
</html>

<!-- add security questions 
-->