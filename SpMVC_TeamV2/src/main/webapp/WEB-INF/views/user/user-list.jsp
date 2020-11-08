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
	cursor: pointer;
}

tr.bor-tr:hover {
	background-color: #ccc;
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
		$("#g-save").click(function() {
			document.location.href = "${rootPath}/bbs/write"
		})

		$("tr").click(function() {
			let seq = $(this).data("seq")
			document.location.href = "${rootPath}/bbs/detail/" + seq
		})

	})
</script>
<h2>관리자 페이지</h2>
<table class="table-striped">
	<thead>
		<tr>
			<th>NO</th>
			<th>회원ID</th>
			<th>권한</th>
			<th>상태</th>
			<th>기타</th>
		</tr>
	</thead>
	<c:forEach items="${userList}" var="list" varStatus="i">
		<tr class="bor-tr">
			<td>${i.count}</td>
			<td>${list.username}</td>
			<c:choose>
				<c:when test="${list.m_role == '0'}">
					<td>관리자</td>
				</c:when>
				<c:otherwise>
					<td>유저</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${list.accountNonLocked == true}">
					<td>정상</td>
				</c:when>
				<c:otherwise>
					<td>잠김</td>
				</c:otherwise>
			</c:choose>
			<td></td>

		</tr>
	</c:forEach>
</table>