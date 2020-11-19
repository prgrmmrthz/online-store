<!DOCTYPE html>
<html>
<head>
	<title>Registration</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>


<div class="login-box">

	<img src="logo.jpg" alt="avatar" class="avatar">
	<form class="user" action="data/adduser.php" method="POST" enctype="multipart/form-data" onsubmit="return checkForm(this);">
<div class="texting">
	<H1><label> Sign-Up</label>
	</H1></div>

	<div class="user-box">
	<input type="text" name="uname" required=""></input>	
	<label>Username</label>
	</div>
	<div class="user-box">
	<input type="Password" name="pword" required=""></input>	
	<label>Password</label>
	</div>
	<div class="user-box">
	<input type="Password" name="repeatpword" required=""></input>	
	<label>Confirm Password</label>
	</div>				
	<div class="user-box">
	<input type="text" name="fname" required=""></input>	
	<label>First Name</label>
	</div>
	<div class="user-box">
	<input type="text" name="lname" required=""></input>	
	<label>Last Name</label>
	</div>
	<div class="user-box">
	<input type="text" name="" required=""></input>	
	<label>Email Address</label>
	</div>
	<div class="user-box">
	<input type="text" name="" required=""></input>	
	<label>Contact Number</label>
	</div>
	
	<div class="textR">	
<a href="#">
	<input type="submit"  value="Register Account" name="submit">
<spam></spam>
<spam></spam>
<spam></spam>
<spam></spam>
</a>
	</div>

	</form>
 <script type="text/javascript">
  function checkForm(form)
  {
    if(form.pword.value!="" && form.repeatpword.value != form.pword.value){
      alert("Error: Password mismatched");
      form.pword.focus();
      return false;
    }
  }
</script>
</body>
</html>