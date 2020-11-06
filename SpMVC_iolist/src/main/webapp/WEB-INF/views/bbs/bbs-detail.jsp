<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
section#team-detail-header {
  width: 50%;

  margin: 20px auto;
  display: flex;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
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
  border-bottom: 1px solid #ddd;
}

section#team-detail-header .title {
  display: inline-block;
  width: 25%;
  background-color: #ddd;
  font-weight: bold;
  text-align: right;
}

section#team-detail-header .content {
 display: inline-block;
  width: 25%;
  width: 25%;
  background-color: #ddd;
  font-weight: bold;
  text-align: right;
}



section#team-detail-body {
  width: 50%;
  margin: 10px auto;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
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
	<article>
		<h2>게시판</h2>
		<div class="title">작성자</div>
		<th>${BbsVO.b_writer}</th>
		<hr />
		<div class="content">제목</div>
		<th>${BbsVO.b_subject}</th>
		<hr />
		<div class="title">날짜</div>
		<th>${BbsVO.b_date}</th>
		<hr />
		<div class="content">시간</div>
		<th>${BbsVO.b_time}</th>
		<hr />
		
		<div class="title">내용</div>
		<th>${BbsVO.b_content}</th>
	</article>
</section>
<section id="team-button-box">
	<button class="bbs-list">리스트</button>
	<button class="update">수정</button>
	<button class="delete">삭제</button>
</section>