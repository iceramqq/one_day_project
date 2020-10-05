<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />        
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>home</title>
<script>
$(function () {
    $("#iolist_list").click(function () {
      document.location.href = "${rootPath}/iolist/";
    });
    
    $("#iolist_save").click(function () {
    	$("form").submit();
    })
  });
</script>
<style>
form fieldset {
	width: 60%;
	margin: 10px auto;
	border: 1px solid blue;
	border-radius: 5px;
}

form fieldset legend {
	color: blue;
	font-weight: bold;
}

label {
	display: inline-block;
	width: 15%;
	text-align: right;
	margin: 4px;
	padding: 8px;
	color: rgb(100, 78, 228);
	font-weight: bold;
}

input {
	display: inline-block;
	width: 70%;
	margin: 4px;
	padding: 8px;
	border: 1px solid gray;
}

select {
	display: inline-block;
	width: 70%;
	margin: 4px;
	padding: 8px;
	border: 1px solid gray;
}

#btn_box {
	text-align: right;
	width: 85%;
}

#btn_box button {
	margin: 8px 3px;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}

#btn_box button:first-child {
	background-color: green;
}

#btn_box button:last-child {
	background-color: blue;
}

#btn_box button:hover {
	background-color: gray;
	color: white;
}

div.hidden{
	display: none;
}
</style>
</head>
<body>
<form:form modelAttribute="ioVO">
	<fieldset>
		<legend>상품정보 등록</legend>
		<div class="hidden">
			<label></label>
			<form:input path="seq" type="hidden" />
		</div>
		<div class="hidden">
			<label></label>
			<form:input path="io_date" type="hidden"/>
		</div>
		<div class="hidden">
			<label></label>
			<form:input path="io_time" type="hidden"/>
		</div>
		<div>
			<label>상품명</label>
			<form:input path="io_pname" />
		</div>
		<div>
			<label>구분</label>
			<form:select  path="io_input">
				<option value="1">매입</option>
				<option value="2">매출</option>
			</form:select>
		</div>
		<div>
			<label>단가</label>
			<form:input type="number" path="io_price" />
		</div>
		<div>
			<label>수량</label>
			<form:input type="number" path="io_quan" />
		</div>
		<div id="btn_box">
			<button type="button" id="iolist_list">리스트</button>
			<button type="button" id="iolist_save">저장</button>
		</div>
	</fieldset>
</form:form>
</body>
</html>