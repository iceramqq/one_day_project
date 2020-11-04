<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />        
<style>
section#team-detail-header {
	width: 50%;
	margin: 20px auto;
	display: flex;
}
section#team-detail-header article:first-child {
	flex: 1;
}
section#team-detail-header article:last-child {
	flex: 2;
}
section#team-detail-header div {
	margin: 5px;
	padding: 10px;
	border-bottom: 1px solid #ddd
}
section#team-detail-header .title {
	display: inline-block;
	width: 25%;
	border-bottom: 2px solid red;
	font-weight: bold;
	text-align: right;
}
section#team-detail-header .content {
	display: inline-block;
	width: 60%;
}
section#team-detail-header img {
	margin: 5px;
	border-radius: 5px;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5)
}
section#team-detail-body {
	width: 50%;
	margin: 10px auto;
}
section#team-detail-body div {
	border-bottom: 3px solid black;
	padding: 10px;
	font-weight: bold;
	font-size: 25px;
}
section#team-button-box {
	width: 50%;
	margin: 10px auto;
	text-align: right;
}
section#team-button-box button {
	margin: 5px;
	padding: 10px 16px;
	border: 0;
	outline: 0;
	border-radius: 5px;
	font-weight: bold;
}
section#team-button-box button:hover {
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.6);
}
section#team-button-box button:nth-child(1) {
	background-color: green;
}
section#team-button-box button:nth-child(2) {
	background-color: blue;
	color: white;
}
section#team-button-box button:nth-child(3) {
	background-color: orange;
}
</style>
<script type="text/javascript">
$(function() {
	$(".team-list").click(function() {
		let category = ${teamVO.h_category}
		document.location.href = "${rootPath}/team/list/" + category
	})
	$(".update").click(function() {
		let seq = ${teamVO.h_seq}
		document.location.href = "${rootPath}/team/update/" + seq
	})
	$(".delete").click(function() {
		let seq = ${teamVO.h_seq}
		document.location.href = "${rootPath}/team/delete/" + seq
	})
})
</script>
<section id="team-detail-header">
	<article>
		<a href="${rootPath}/upload/team/${teamVO.h_file}" target=_new> 
			<c:if test="${empty teamVO.h_file}">
				<img src="${rootPath}/upload/team/noImage.png" width="200px">
			</c:if>
			<c:if test="${not empty teamVO.h_file}"> 
				<img src="${rootPath}/upload/team/${teamVO.h_file}" width="200px">
			</c:if>
		</a>
	</article>
	<article>
		<div class="title">문화재명</div>
		<div class="content">${teamVO.h_title}</div>
		<div class="title">주소</div>
		<div class="content">${teamVO.h_address}</div>
		<div class="title">문의전화</div>
		<div class="content">${teamVO.h_tel}</div>
	</article>
</section>
<section id="team-detail-body">
	<div>개요</div>
	<p>${teamVO.h_content}</p>
</section>
<section id="team-button-box">
	<button class="team-list">리스트</button>
	<button class="update">수정</button>
	<button class="delete">삭제</button>
</section>