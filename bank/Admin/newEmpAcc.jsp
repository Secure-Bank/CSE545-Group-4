<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Employee Account</title>
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
        <div id="login-box-reg">
		<form  name="frm" method="post"  commandName="form">
			<table width="450px">
			
			<h3>New Employee Account</h3>

			<tr>
			<td colspan="2">
				<label color="Red"><font color="red">${errormsg}</font></label>
			</td>
			</tr>
				<tr>
					<td valign="top">
						<label for="first_name">First Name *</label>
					</td>
					<td valign="top">
						<input  type="text" name="firstName" size="30"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="last_name">Last Name *</label>
					</td>
					<td valign="top">
						<input  type="text" name="lastName" size="30"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="user_name">User Name *</label>
					</td>
					<td valign="top">
						<input type="text" name="userName" size="30"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="password">Password *</label>
					</td>
					<td valign="top">
						<input  type="password" name="password" size="30"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="confirm">Confirm Password *</label>
					</td>
					<td valign="top">
						<input type="password" name="password" size="30"/>
					</td>
				</tr>
				
				<tr>
					<td valign="top">
						<label for="phone">Phone *</label>
					</td>
					<td valign="top">
						<input type="text" name="phone" maxlength="10" size="30">
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="address">Address *</label>
					</td>
					<td valign="top">
						<input type="text" name="address" size="30">
					</td>
				</tr>
				<tr>
					<td valign="top">
						<label for="city">City *</label>
					</td>
					<td valign="top">
						<input type="text" name="city" size="30">
					</td>
				</tr>
				</table>

				<p><input type="submit" id="but_reg2" value="Submit">
		</form>
		</div>
	</div>
	<div class="footer">
    	<p>Footer</p>
    </div>
</body>
</html>
