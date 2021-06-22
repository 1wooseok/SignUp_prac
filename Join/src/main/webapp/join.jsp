<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
	function idCheck(id) {
		reg_form = document.getElementsByClassName("reg_form")
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			reg_form.id.focus();
			return;
		}
		url = "test_db.jsp?id=" + id;
		const win = window.open(url, "idChk", "width=300,height=150");	
	}
</script>
</head>
<body>
	<h1>JOIN</h1>
	<form class="reg_form" action="regi.jsp" method="POST">
		ID<br>
		<input style="width:350px" type="text" name="id" required>
		<input class="idChk_btn" type="button" value="double check" onClick="idCheck(this.form.id.value)">		
		<br>PassWord<br>
		<input type="password" name="pswd" required><br>
		UserName<br>
		<input type="text" name="name" required><br>
		DOB<br>
		<input type="date" name="bod" required><br>
		Gender<br>
		<select name="gender" required>
	    <option value="">--Please choose an option--</option>
	    <option value="male">Male</option>
	    <option value="female">Female</option>
		</select><br>
		E-mail<br>
		<input type="email" name="email" required><br>
		Mobile Phone<br>
		<input type="text" name="phone" required><br>
		<input class="sign_up_btn" type="submit" value="Sign Up">
	</form>
</body>
</html>