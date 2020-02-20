<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--     
<script type="text/javascript">
   
     function Verify(){
    	var email=$("#email").val();
	    	 $.post( "emailService", {mail:email})
	    	  .done(function( data ) {
	    	    alert( data );
	    	   // document.location.reload(true);
	    	  });  	  
     }
     </script>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<link href="style.css" rel="stylesheet" type="text/css" />
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
            <h3>Sign Up</h3>
            <table>    
            <tr>
                <td valign="top"> SSN: </td>
                <td valign="top">
                    <input  type="text" name="ssn" size="20"/>
                </td>
            </tr>
            <tr>
                <td valign="top"> Email: </td>
                <td valign="top">
                    <input  type="text" name="email" size="20"/>
                </td>
            </tr>
            <tr>
                <td valign="top">Confirm Email: </td>
                <td valign="top">
                    <input  type="text" name="confirmemail" size="20"/>
                </td>
            </tr>
            </table>
            <a href="registration1.jsp"><button class="button">Sign Up</button></a>
        </div>
    </div>
    <div class="footer">
    <p>Footer</p>
    </div>
</body>
</html>