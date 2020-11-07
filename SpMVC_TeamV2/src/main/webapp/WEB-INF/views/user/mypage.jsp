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

form#member-write #btn_box button:first-child {
	background-color: green;
}

form#member-write #btn_box button:last-child {
	background-color: blue;
}

form#member-write #btn_box button:hover {
	background-color: gray;
	color: white;
}
</style>
<script>
	$(function() {
		$("#btn_home").click(function() {
			document.location.href = "${rootPath}/team/list/1"
		});
	});
</script>
<script>	
	// 함수를 변수처럼 선언하는 ES6 코드
	// 함수를 변수처럼 선언하면 = JS 객체화된다.
	// 함수 = 객체 = 변수
	// 1급 함수 : 함수자체를 다른함수의 매개변수로 전달할 수 있다.
	const password_check = function() {
		let username = $("#username").val()
		let password = $("#password").val()
		
		if(password === "") {
			$("div#msg_password").css("display","block")
			$("div#msg_password span").css("color","red")
			$("div#msg_password span").text("회원 정보를 수정하려면 비밀번호를 입력하세요")
			$("#password").focus()
			return false;
		}
		
		$.ajax({
			url : "${rootPath}/user/password_check",
			method : "POST",
			data : {"username" : username, "password" : password},
			beforeSend : function(ax) {
				ax.setRequestHeader ("${_csrf.headerName}","${_csrf.token}")
			},
			success : function(result) {
				$("div#msg_password").css("display","block")
				if(result === "FAIL") {
					$("div#msg_password span").text("비밀번호가 일치하지 않습니다")
					$("div#msg_password span").css("color","red")
					$("#password").focus()
					return false
				} else {
					$("div#msg_password").css("display","none")
					$("form").submit()
				}
				
			},
			error : function() {
				alert("서버 통신오류!!")
			}
		})
	}
	
	$(function(){
		$("#btn_save").click(function(){
			password_check()
		})
	})
	
</script>
<style>
	div#msg_username, div#msg_password {
		display: none;
	}
			
</style>
<%/*
Controller에서 @SessionAttributes()와 @ModelAttribute() 설정이 있고
jsp에서 Spring form taglib를 사용하면서
form:form에 modelAttribute를 설정해 두면
현재 이 JSP에는 username, password, re_password만 있지만
memberVO 만들어진 UserDetailsVO에 설정된 모든 변수가
마치 input hidden으로 설정된것과 같이 포함되어 있다.
*/%>			
<form method="POST" id="member-write">
	<fieldset>
		<legend>회원정보 확인</legend>
		<div>
			<label>회원 ID</label> 
			<input name="username" id="username" value="${userVO.username}" readonly="readonly"/>
		</div>
		<div id="msg_username">
			<label></label>
			<span></span>
		</div>
		<div>
			<label>비밀번호</label> 
			<input id="password" name="password" type="password"/>
		</div>
		<div id="msg_password">
			<label></label>
			<span></span>
		</div>
		<div id="btn_box">
			<button type="button" id="btn_home">홈으로</button>
			<button type="submit" id="btn_save">수정</button>
		</div>
	</fieldset>
</form>