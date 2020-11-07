<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			document.location.href = "${rootPath}/user/login"
		});
	});
</script>
<script>
	// 함수를 변수처럼 선언하는 ES6 코드
	// 함수를 변수처럼 선언하면 = JS 객체화된다.
	// 함수 = 객체 = 변수
	// 1급 함수 : 함수자체를 다른함수의 매개변수로 전달할 수 있다.
	const id_check = function(username) {

		if (username === "") {
			$("div#msg_username").css("display", "block")
			$("div#msg_username span").css("color", "red")
			$("div#msg_username span").text("회원 ID를 입력해 주세요")
			$("#username").focus()
			return false;
		}

		$.ajax({
			url : "${rootPath}/user/id_check",
			method : "POST",
			data : {
				"username" : username
			},
			beforeSend : function(ax) {
				ax.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			success : function(result) {
				$("div#msg_username").css("display", "block")
				if (result === "OK") {
					// alert("사용가능한 username 입니다")
					$("div#msg_username span").text("사용가능한 회원 ID 입니다")
					$("div#msg_username span").css("color", "blue")
					$("#password").focus()
				} else {
					// alert("사용 불가능한 username 입니다")
					$("div#msg_username span").text("사용 불가능한 회원 ID 입니다")
					$("div#msg_username span").css("color", "red")
					$("#username").focus()
				}
			},
			error : function() {
				alert("서버 통신오류!!")
			}
		})
	}

	$(function() {

		$("#btn_save").click(function() {
			let username = $("#username").val()
			let password = $("#password").val()
			let re_password = $("#re_password").val()

			if (username === "") {
				alert("사용자 이름을 입력한 후 ID 중복검사를 수행하세요")
				$("#username").focus()
				return false
			}
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

		/*
		input box에 focus() 있다가 다른곳으로 focus()가 이동할때
		발생되는 event
		ID 중복 버튼을 클릭하지 않아도 ID 중보검사를 할수 있도록
		username input box에 blur event를 설정
		 */
		$("#m_username").click(function() {
			let username = $("#username").val()
			id_check(username)
		})
	})
</script>
<style>
div#msg_username {
	display: none;
}
</style>
<form method="POST" id="member-write">
	<fieldset>
		<legend>회원가입</legend>
		<div>
			<label>회원 ID</label> <input name="username" id="username" />
			<button type="button" id="m_username" class="m_code_gen">ID중복검사</button>
		</div>
		<div id="msg_username">
			<label></label> <span></span>
		</div>
		<div>
			<label>비밀번호</label> <input name="password" type="password" id="password" />
		</div>
		<div>
			<label>비밀번호 확인</label> <input name="re_password" id="re_password"
				type="password" />
		</div>
		<div>
			<input class="hidden" type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</div>
		<div id="btn_box">
			<button type="button" id="btn_home">로그인으로</button>
			<button type="button" id="btn_save">회원가입</button>
		</div>
	</fieldset>
</form>