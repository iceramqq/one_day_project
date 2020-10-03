<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>나의 홈페이지</title>
<link href="${rootPath}/static/css/book-list.css?ver=1" rel="stylesheet">
<script src="${rootPath}/static/js/book-list.js?ver=1"></script>
</head>
<body>
<table>
	<tr>
		<th>No</th>
		<th>일자</th>
		<th>시각</th>
		<th>상품명</th>
		<th>구분</th>
		<th>단가</th>
		<th>수량</th>
		<th>합계</th>
	</tr>
	<c:choose>
		<c:when test="${empty iolist-list}">
			<tr>
				<td>데이터가 없음</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${iolist-list}" var="ioVO" varStatus="i">
				<tr data-seq="${ioVO.seq}">
					<td>${ioVO.seq}</td>
					<td>${ioVO.io_date}</td>
					<td>${ioVO.io_time}</td>
					<td>${ioVO.io_pname}</td>
					<td>${ioVO.io_input}</td>
					<td>${ioVO.io_price}</td>
					<td>${ioVO.io_quan}</td>
					<td>${ioVO.io_total}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<div>
	<a href="${rootPath}/iolist/input">새로작성</a>
</div>
</body>
</html>