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
		<th>매입단가</th>
		<th>판매단가</th>
		<th>수량</th>
		<th>매입합계</th>
		<th>판매합계</th>
	</tr>
	<c:otherwise>
	<c:forEach items="${iolist-list}" var="ioVO" varStatus="i">
		<tr data-seq="${ioVO.seq}">
			<td>${i.count}</td>
			<td>${ioVO.io_date}</td>
			<td>${ioVO.io_time}</td>
			<td>${ioVO.io_pname}</td>
			<td>${ioVO.io_input}</td>
			<td>${ioVO.in_io_price}</td>
			<td>${ioVO.out_io_price}</td>
			<td>${ioVO.io_quan}</td>
			<td>${ioVO.in_io_total}</td>
			<td>${ioVO.out_io_total}</td>
		</tr>
	</c:forEach>
	</c:otherwise>
</table>
<div>
	<a href="${rootPath}/iolist/input">새로작성</a>
</div>
</body>
</html>