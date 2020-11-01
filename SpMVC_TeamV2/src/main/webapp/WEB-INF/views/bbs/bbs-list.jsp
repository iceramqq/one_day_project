<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
h2 {
	text-align: center;
	margin: 3%;
}

table {
	width: 80%;
	margin: 10px auto;
	border-collapse: collapse;
	border-top: 2px solid #8d8d8d;
}

th {
	padding: 10px 8px; /*padding: vertical horizontal;*/
	background: #f9f9f9;
	color: #666;
	border-bottom: 1px solid #8d8d8d;
}

td {
	padding: 10px 8px; /*padding: vertical horizontal;*/
	text-align: center;
	line-height: 1.25em;
	color: #666;
	border-bottom: 1px solid #8d8d8d;
}

div.btn {
	width: 90%;
	text-align: right;
}

div.btn button {
	font-weight: bold;
	cursor: pointer;
	border: none;
	background: rgb(18, 184, 134);
	color: white;
	border-radius: 6px;
	padding: 10px 20px;
	font-size: 1rem;
}

.btn button:hover {
	background-color: #aaa;
	color: black;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".team-item").click(function() {
			let seq = $(this).data("seq")
			document.location.href = "${rootPath}/bbs/detail/" + seq
		})
		$("#g-save").click(function() {
			document.location.href = "${rootPath}/bbs/write"
		})
	})
</script>
<h2>게시판</h2>
<table class="table-striped">
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>aaa</td>
			<td id="title">게시글</td>
			<td>2020-10-16</td>
			<td>2</td>
		</tr>
		<tr>
			<td>2</td>
			<td>bbb</td>
			<td id="title">게시글</td>
			<td>2020-10-16</td>
			<td>3</td>
		</tr>
		<tr>
			<td>3</td>
			<td>ccc</td>
			<td id="title">게시글</td>
			<td>2020-10-16</td>
			<td>3</td>
		</tr>
	</tbody>
</table>
<div class="btn">
	<button id="g-save">작성</button>
</div>