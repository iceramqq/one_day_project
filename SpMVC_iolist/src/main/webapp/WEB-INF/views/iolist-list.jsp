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
<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px solid #ccc;
	width: 80%;
	margin: 10px auto;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
}

tbody tr:nth-child(odd) {
	background-color: #f1f1f1;
}

tbody tr:nth-child(even) {
	background-color: #fff;
}

tbody tr:hover {
	background-color: #ddd;
	cursor: pointer;
}

tr#total {
	background-color: green;
	color: white;
}

article {
	width: 80%;
	margin: 5px auto;
	text-align: right;
}

article a {
	display: inline-block;
	padding: 8px 16px;
	background-color: blue;
	color: white;
	cursor: pointer;
	text-decoration: none;
	border-radius: 5px;
}

article a:hover {
	background-color: #ddd;
	color: black;
	box-shadow: 10px 10px 20px 0px rgba(0, 0, 0, 0.75);
}
</style>
<script>
	$(function() {
		$(".io_items").click(function() {
			let seq = $(this).data("seq")
			document.location.href = "${rootPath}/iolist/detail?id=" + seq

		})
	})
</script>
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
		<c:forEach items="${ios}" var="ioVO" varStatus="i">
			<c:choose>
				<c:when test="${ioVO.io_input == '1'}">
					<tr class="io_items" data-seq="${ioVO.seq}">
						<td>${i.count}</td>
						<td>${ioVO.io_date}</td>
						<td>${ioVO.io_time}</td>
						<td>${ioVO.io_pname}</td>
						<td>${ioVO.io_price}</td>
						<td></td>
						<td>${ioVO.io_quan}</td>
						<td>${ioVO.io_total}</td>
						<td></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr class="io_items" data-seq="${ioVO.seq}">
						<td>${i.count}</td>
						<td>${ioVO.io_date}</td>
						<td>${ioVO.io_time}</td>
						<td>${ioVO.io_pname}</td>
						<td></td>
						<td>${ioVO.io_price}</td>
						<td>${ioVO.io_quan}</td>
						<td></td>
						<td>${ioVO.io_total}</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<tr id="total">
			<td></th>
			<td>합계</th>
			<td></th>
			<td></th>
			<td></th>
			<td></th>
			<td></th>
			<td>${in_total}</th>
			<td>${out_total}</th>
		</tr>
	</table>
	<article>
		<a href="${rootPath}/iolist/insert">새로작성</a>
	</article>
</body>
</html>