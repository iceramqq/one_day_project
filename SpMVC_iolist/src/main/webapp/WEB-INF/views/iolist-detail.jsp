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
<style>
	table {
		border:2px solid blue;
		width:60%;
		margin:10px auto;
		padding: 20px;
	}
	th{
		text-align: right;
		width: 20%;
	}

	td {
		border:1px solid #ccc;
		padding:8px;
		text-align: left;
	}
	
	article {
		width:60%;
		margin:5px auto;
		text-align: right;
	}
	
	article a {
		display: inline-block;
		padding:8px 16px;
		color:white;
		cursor: pointer;
		text-decoration: none;
		border-radius: 5px;
		
	}
	
	article a:nth-child(1){
		background-color: red;
	}
	
	article a:nth-child(2){
		background-color: green;
	}
	
	article a:nth-child(3){
		background-color: blue;
	}
	
	article a:hover {
		background-color: #ddd;
		color:black;
		box-shadow: 10px 10px 23px 0px rgba(0,0,0,0.75);
	}
	
</style>        
</head>
<body>
<table>
	<tr>
		<th>상품코드</th><td>${ioVO.seq}</td>
	</tr>
	<tr>
		<th>일자</th><td>${ioVO.io_date}</td>
	</tr>
	<tr>
		<th>시각</th><td>${ioVO.io_time}</td>
	</tr>
	<tr>
		<th>상품명</th><td>${ioVO.io_pname}</td>
	</tr>
	<tr>
		<th>단가</th><td>${ioVO.io_price}</td>
	</tr>
	<tr>
		<th>수량</th><td>${ioVO.io_quan}</td>
	</tr>
	<tr>
		<th>합계</th><td>${ioVO.io_total}</td>
	</tr>
</table>
<article>
	<a href="${rootPath}/iolist/">리스트</a>
	<a href="${rootPath}/iolist/update?id=${ioVO.seq}">수정</a>
	<a href="${rootPath}/iolist/delete?id=${ioVO.seq}">삭제</a>
</article>
</body>
</html>