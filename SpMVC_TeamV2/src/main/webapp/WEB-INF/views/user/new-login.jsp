<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
* {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

header,nav,footer {
	display: none;
}

.wrap, #wrap-img {
	height: 100%;
	width: 100%;
	background-position: center;
	background-size: cover;
	position: absolute;
}

.form-wrap {
	width: 380px;
	height: 480px;
	position: relative;
	margin: 6% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
	animation-name: login_box_top_down;
	animation-duration: 1s;
}

.button-wrap {
	width: 230px;
	margin: 35px auto;
	position: relative;
	box-shadow: 0 0 600px 9px #fcae8f;
	border-radius: 30px;
}

.togglebtn {
	padding: 10px 30px;
	cursor: pointer;
	background: transparent;
	border: 0;
	outline: none;
	position: relative;
}

#btn {
	top: 0;
	left: 0;
	position: absolute;
	width: 110px;
	height: 100%;
	background: linear-gradient(to right, #2bd8d8, #e0f804);
	border-radius: 30px;
	transition: 0.5s;
}

.social-icons {
	margin: 30px auto;
	text-align: center;
}

.social-icons img {
	width: 30px;
	cursor: pointer;
}

.input-group {
	top: 180px;
	position: absolute;
	width: 280px;
	transition: 0.5s;
}

.input-field {
	width: 100%;
	padding: 10px 0;
	margin: 5px 0;
	border: none;
	border-bottom: 1px solid #999;
	outline: none;
	background: transparent;
}

.submit {
	width: 85%;
	padding: 10px 30px;
	cursor: pointer;
	display: block;
	margin: auto;
	background: linear-gradient(to right, #2bd8d8, #e0f804);
	border: 0;
	outline: none;
	border-radius: 30px;
}

.checkbox {
	margin: 30px 10px 30px 0;
}

span {
	color: #777;
	font-size: 12px;
	bottom: 68px;
	position: absolute;
}

#login {
	left: 50px;
}

#register {
	left: 450px;
}

@
keyframes login_box_top_down {from { top:-300px;
	opacity: 0;
}

to {
	top: 120px;
	opacity: 1;
}
}
</style>
<div class="wrap">
	<img id="wrap-img" src="${rootPath}/resources/imga/0.jpg" />
	<div class="form-wrap">
		<div class="button-wrap">
			<div id="btn"></div>
			<button type="button" class="togglebtn" onclick="login()">
				로그인</button>
			<button type="button" class="togglebtn" onclick="register()">
				회원가입</button>
		</div>
		<form method="POST" id="login" action="${rootPath}/login"
			class="input-group">
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<h4 id="login-fail">${SPRING_SECURITY_LAST_EXCEPTION.message}</h4>
				<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
			</c:if>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}"> <input name="username"
				class="input-field" placeholder="아이디" /> <input name="password"
				type="password" class="input-field" placeholder="비밀번호" />

			<button class="submit">로그인</button>
		</form>
		<form id="register" action="" class="input-group">
			<input type="text" class="input-field" placeholder="아이디"
				name="username" /> <input type="email" class="input-field"
				placeholder="이메일" name="password" /> <input type="password"
				class="input-field" placeholder="비밀번호" required="" />

			<button class="submit">회원가입</button>
		</form>
	</div>
</div>
<script>
	var x = document.getElementById("login");
	var y = document.getElementById("register");
	var z = document.getElementById("btn");

	function login() {
		x.style.left = "50px";
		y.style.left = "450px";
		z.style.left = "0";
	}

	function register() {
		x.style.left = "-400px";
		y.style.left = "50px";
		z.style.left = "110px";
	}
</script>