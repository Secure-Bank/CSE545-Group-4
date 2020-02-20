<html>
<head>
<title>Login Page</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-all.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-autocomplete.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-mobile.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-navigation.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-scramble.min.js"></script>
<script src="resources/JS/jquery.keyboard.extension-typing.min.js"></script>
<script src="resources/JS/jquery.keyboard.min.js"></script>
<script src="resources/JS/jquery.mousewheel.min.js"></script>
<script src="resources/JS/virtualkeyboard.js"></script>

<link rel="stylesheet" href="resources/css/keyboard.css" />


</head>
<body onload='document.loginForm.username.focus();'>
	<div class="topnav">
		<a href="#">Link</a>
		<a href="#">Link</a>
		<a href="#">Link</a>
	</div>
	<div class="content">
		<center><h1>Welcome to Sun Financial</h1></center>
		<div id="login-box">
			<h3>Welcome</h3> 
			<!-- <form name='loginForm'
			  action="<c:url value='/j_spring_security_check' />" method='POST'> -->
			<table>
				<tr>
					<td>User:</td>
					<td><input type='text' name='username'></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type='password' id="keyboard" name='password' />
					</td>
				</tr>
				<tr>
					<td><input type="radio" id="external" name="usertyp" value="external">
					<label for="external">User/Merchant</label></td>
					<td><input type="radio" id="internal" name="usertyp" value="internal">
					<label for="internal">Employee</label></td>				
				</tr>
				<tr>
					<td colspan='2'><input name="signin" id="signin" type="submit"
					  value="Sign In" /></td>
				</tr>
				<tr>						
			  </table>
			<!-- </form> -->
			<a href="forgotpassword1.jsp">Forgot username/password?></a><br>
			<a href="signup.jsp">Not enrolled? Sign up now. ></a>
		</div> 
	</div>
<div class="footer">
<p>Footer</p>
</div>
	
	
</body>
</html>