<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>Home</title>
<base href="<%=basePath%>" />
<!-- Custom Theme files -->
<link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<!-- <link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
 -->
<!--Google Fonts-->
</head>
<body>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/cookie.js"></script>

	<div class="login">
		<h2>Acced Form</h2>
		<div class="login-top">
			<h1>LOGIN FORM</h1>
			<form>
				<input type="text" id="username" value="User Id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入账号';}"/> 
				<input type="password" id="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入密码';}"/>
				<p id="result">您还未登录</p>
			</form>
			<div class="forgot">
				<!--<a href="#">forgot Password</a>-->
				<input type="submit" value="Login" id="login" onclick="loging()">
			</div>
		</div>
		<div class="login-bottom">
			<h3>
				<div class="checkbox control-wrapper">
					<label> <input type="checkbox" id="check" style="font-size: large"/>是否以管理员身份登陆</label>
				</div>
			</h3>
		</div>
	</div>
	<div class="copyright">
		<p>
			Copyright &copy; 2017.Hr-Zhou HR All rights reserved. - More Templates 
			<a target="_blank" title="">HrGraTest</a>
		</p>
	</div>
	<script>
		var Message = $("#result");
		Message.hide();
		var flag;
		var uri;
		function loging() {
			if ($("#check").is(":checked")) {
				uri = "admin/login";
			} else {
				uri = "staff/login"
			}
			var Username = $("#username").val();
			var Password = $("#password").val();
			$.ajax({
						type : "POST",
						async : false,
						url : uri,
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						dataType : "json",
						timeout : 500,
						data : {
							admUserName : Username,
							admPassword : Password,
						},
						success : function(data) {
							console.log(data)
							if (data.status == 200) {
								window.location.href="index";
								setCookie("check", 2, 30);
							}
							if (data.status == 500) {
								Message.html("登陆失败：用户名或者密码错误");
								Message.show();
								setCookie("check", 1, 30);
							}
						},
						error : function(data) {
							//alert(data);
							Message.html("登陆失败：用户名或者密码错误");
							Message.show();
						}
					});
			$('#username,#password').bind('keyup', function(e) {
				if (e.keyCode == "13") {
					$("#login").click();
				}
			});
		}
	</script>

</body>
</html>