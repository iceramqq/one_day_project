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
  width: 25%;
  background-color: #ddd;
  font-weight: bold;
  text-align: right;
}

section#team-detail-header img {
  margin: 5px;
  border-radius: 5px;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
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
<section id="team-detail-header">
	<article>
		<h2>게시판</h2>
		<div class="title">작성자</div>
		<hr />
		<div class="content">제목</div>
		<hr />
		<div class="title">날짜</div>
		<hr />
		<div class="content">내용</div>
	</article>
</section>
<section id="team-button-box">
	<button class="list">리스트</button>
	<button class="update">수정</button>
	<button class="delete">삭제</button>
</section>