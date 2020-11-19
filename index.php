<!DOCTYPE html>
<html>
<head>
	<title>login page</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="login-box">

		<img src="logo.jpg" alt="avatar" class="avatar"></br>

		<form class="user" action="checkuser.php" method="POST">

			<div class="user-box">
				<input type="text" name="username" required=""></input>	
				<label>Username</label>
			</div>

			<div class="user-box">
				<input type="Password" name="pword" required=""></input>	
				<label>Password</label>
			</div>	
			<div class="sub">
				<input type="submit" value="Login" name="submit">
			</div>
			
		</form>
	</div>
</body>
</html>