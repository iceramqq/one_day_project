<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
section#team-detail-header {
	width: 50%;
	margin: 20px auto;
	text-align: right;
}
section#team-detail-header div {
	display: inline-block;
	font-weight: bold;
	margin-top: 50px;
}
section#team-detail-body {
	width: 50%;
	margin: 20px auto;
}
section#team-detail-body div {
	padding: 10px;
	font-size: 25px;
}

section#team-detail-body div:first-child {
	border-bottom: 1px solid green;
}
section#team-detail-body p {
	border: 1px solid blue;
	height: 300px;
	padding: 10px;
	font-size: 20px;
}

section#team-button-box {
  width: 50%;
  margin: 10px auto;
  text-align: right;
}

section#team-button-box button {
  margin: 10px;
  padding: 10px 16px;
  border: 0;
  outline: 0;
  border-radius: 5px;
  color: white;
  font-weight: bold;
   cursor: pointer;
}
/* button.bbs-list */
section#team-button-box button:hover {
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.6);
}

section#team-button-box button:nth-child(1) {
  background-color: orange;
}

section#team-button-box button:nth-child(2) {
  background-color: skyblue;
}

section#team-button-box button:nth-child(3) {
  background-color: violet;
}

h2 {
  text-align: center;
  color: violet;
  margin-top: 40px;
}
</style>
<script>
$(function() {
	$(".bbs-list").click(function() {
		document.location.href = "${rootPath}/bbs/list"
	})
	$(".update").click(function() {
		let seq = ${BbsVO.b_seq}
		document.location.href = "${rootPath}/bbs/update/" + seq
	})
	$(".delete").click(function() {
		let seq = ${BbsVO.b_seq}
		document.location.href = "${rootPath}/bbs/delete/" + seq
	})
})
</script>
<section id="team-detail-header">
	<h2>게시판</h2>
	<article>
		
		<div>작성자 : ${BbsVO.b_writer}</div>
		<div>날짜 : ${BbsVO.b_date}</div>
		<div>시간 : ${BbsVO.b_time}</div>
	</article>
</section>
<section id="team-detail-body">
	<div>제목 : ${BbsVO.b_content}</div>
	<div>내용</div>
	<p>${BbsVO.b_content}</p>
</section>
<section id="team-button-box">
	<button class="bbs-list">리스트</button>
	<c:choose>
	<c:when test="${username == BbsVO.id}">
		<button class="update">수정</button>
		<button class="delete">삭제</button>
	</c:when>
	<c:otherwise>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button class="delete">삭제</button>
        </sec:authorize>
	</c:otherwise>
	</c:choose>
</section>