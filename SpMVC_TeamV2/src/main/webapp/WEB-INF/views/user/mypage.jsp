<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
form#member-write fieldset {
	width: 50%;
	margin: 100px auto;
	border: 1px solid blue;
	border-radius: 5px;
}

form#member-write fieldset legend {
	color: blue;
	font-weight: bold;
}

form#member-write label {
	display: inline-block;
	width: 20%;
	text-align: right;
	margin: 4px;
	padding: 8px;
	color: rgb(100, 78, 228);
	font-weight: bold;
}

form#member-write input {
	display: inline-block;
	width: 60%;
	margin: 4px;
	padding: 8px;
	border-radius: 5px;
	border: 1px solid gray;
}

/*  
	id selector에 style을 지정할때는
	원칙상 tag#id 형식으로 만들어야 하지만
	#id 만 사용하여도 문제 없다. 
*/
form#member-write input.m_code {
	width: 50%;
}

form#member-write button.m_code_gen {
	display: inline-block;
	padding: 8px 16px;
	background-color: orange;
	cursor: pointer;
	border: none;
	border-radius: 5px;
}

/*
css의 가상 selector
tag, class, id 뒤에 :속성 형식으로 작성하는 selecor
	:hover, :nth-child()
CSS3에서 본격적으로 지원하는 selector들로 기본 tag, class, id 등을
	확장하여 js로 구현하던 다양한 기능을 
			CSS3만으로 구현할수 있도록 만드는 확장 selector들이다.	
*/
form#member-write button#p_code_gen:hover, button#p_code_gen:hover {
	background-color: #ddd;
	color: black;
}

form#member-write #btn_box {
	text-align: right;
	width: 80%;
}

form#member-write #btn_box button {
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}

form#member-write #btn_box button:nth-child(1) {
	background-color: green;
}

form#member-write #btn_box button:nth-child(2) {
	background-color: blue;
}

form#member-write #btn_box button:nth-child(3) {
	background-color: red;
}

form#member-write #btn_box button:hover {
	background-color: gray;
	color: white;
}
.hidden {
	display: none;
}
</style>
<script>
	$(function() {
		$("#btn_home").click(function() {
			document.location.href = "${rootPath}/team/list/1"
		})
	});
</script>
<script>	
	$(function() {
		$("#btn_save").click(function() {
			let password = $("#password").val()
			let re_password = $("#re_password").val()

			if (password === "") {
				alert("비밀번호를 입력해 주세요")
				$("#password").focus()
				return false
			}
			if (re_password === "") {
				alert("비밀번호 확인을 입력해 주세요")
				$("#re_password").focus()
				return false
			}

			if (password !== re_password) {
				alert("비밀번호와 비밀번호 확인 값이 다릅니다")
				$("#password").val("")
				$("#re_password").val("")
				$("#password").focus()
				return false
			}
			$("form").submit()
		})
	})
</script>
<style>
	div#msg_username, div#msg_password {
		display: none;
	}
			
</style>		
<form method="POST" id="member-write">
	<fieldset>
		<legend>회원정보 수정</legend>
		<div>
			<label>회원 ID</label> 
			<input name="username" id="username" value="${userVO.username}" readonly="readonly"/>
		</div>
		<div id="msg_username">
			<label></label>
			<span></span>
		</div>
		<div>
			<label>변경할 비밀번호</label> 
			<input id="password" name="password" type="password"/>
		</div>
		<div>
			<label>비밀번호 확인</label> <input id="re_password"	type="password" />
		</div>
		<div>
			<input class="hidden" type="hidden" name="m_role" value="${userVO.m_role}">
		</div>
		<div>
			<input class="hidden" type="hidden" name="accountNonLocked" value="${userVO.accountNonLocked}">
		</div>
		<div>
			<input class="hidden" type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</div>
		<div id="btn_box">
			<button type="button" id="btn_home">홈으로</button>
			<button type="submit" id="btn_save">수정</button>
		</div>
	</fieldset>
</form>