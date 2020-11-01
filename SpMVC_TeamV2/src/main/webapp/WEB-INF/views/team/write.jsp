<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
form#write-form {
	width: 80%;
	margin: 10px auto;
}

form#write-form fieldset {
	border: 1px solid blue;
	border-radius: 10px;
}

form#write-form legend {
	color: blue;
	margin: 5px;
	padding: 5px;
	font-size: x-large;
}

form#write-form label {
	display: inline-block;
	width: 20%;
	padding: 4px;
	margin: 4px;
	color: blue;
	text-align: right;
	font-weight: bold;
}

form#write-form p {
	display: inline-block;
	width: 5%;
}

form#write-form input {
	display: inline-block;
	width: 70%;
	padding: 4px;
	margin: 4px;
}

form#write-form select {
	margin: 4px;
	font-weight: bold;
	padding: 4px;
}

form#write-form textarea {
	width: 70%;
	margin: 4px;
}

div.button-box {
	width: 91.5%;
	text-align: right;
}

form#write-form .button-box button {
	color: white;
	cursor: pointer;
	outline: 0;
	border: 0;
	padding: 10px 16px;
	margin: 5px;
	border-radius: 5px;
}

button:hover {
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
}

button#save {
	background-color: blue;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			let category = $
			{
				teamVO.h_category
			}
			document.location.href = "${rootPath}/team/list/" + category
		})
	})
</script>
<form id="write-form" method="POST" enctype="multipart/form-data">
	<fieldset>
		<legend>새로작성</legend>
		<div>
			<label>문화재명</label> <input name="h_title" value="${teamVO.h_title}">
		</div>
		<div>
			<label>분류</label>
			<select name="h_category">
				<option value="1">고궁/성</option>
				<option value="2">고택/생가</option>
				<option value="3">유적지/사적지</option>
			</select>
		</div>
		<div>
			<label>주소</label> <input name="h_address" value="${teamVO.h_address}">
		</div>
		<div>
			<label>문의전화</label> <input name="h_tel" value="${teamVO.h_tel}">
		</div>
		<div>
			<label>개요</label>
			<textarea id="h_content" rows="5" cols="20" name="h_content">${teamVO.h_content}</textarea>
		</div>
		<div>
			<label>이미지</label> <input type="file" name="file" accept="image/*">
		</div>
		<div class="button-box">
			<button type="submit" id="save">저장</button>
		</div>
	</fieldset>
</form>