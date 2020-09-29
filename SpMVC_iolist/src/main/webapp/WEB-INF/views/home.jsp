<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />        
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Read Book 2020</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <style>
		* {
			box-sizing: border-box;
			margin: 0;
			padding: 0;
		}
		
		header {
			position: relative;
			height: 400px;
			color: white;
			background-image: url("../images/road-1072823.jpg");
			background-position: center;
			background-repeat: no-repeat;
			background-size: 100% 100%;
			background-attachment: fixed;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		
		header h1 {
			font-weight: 500;
			text-shadow: -1px 2px rgb(25, 74, 236), 0 2px rgb(25, 74, 236), 1px 2px
				rgb(25, 74, 236), 0 -2px rgb(25, 74, 236);
		}
		
		table#iolist-list {
			border-collapse: collapse;
			border-spacing: 0;
			width: 90%;
			border: 1px solid #aaa;
			margin: 10px auto;
		}
		
		table#iolist-list th, table#iolist-list td {
			border-bottom: 1px solid #ddd;
			padding: 8px;
			text-align: left;
			vertical-align: top;
		}
		
		table#iolist-list td {
			cursor: pointer;
		}
		
		table#iolist-list tr:nth-child(even) {
			background-color: #f1f1f1;
		}
		
		table#iolist-list tr:nth-child(odd) {
			background-color: #fff;
		}
		
		table#iolist-list tr:nth-child(n+2):hover {
			background-color: #ccc;
		}
		
		div#iolist-link-box {
			width: 90%;
			margin: 10px auto;
			text-align: right;
		}
		
		div#iolist-link-box a {
			display: inline-block;
			padding: 10px 15px;
			background-color: blue;
			color: white;
			text-decoration: none;
			border-radius: 5px;
		}
		
		div#iolist-link-box a:hover {
			box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
		}
		footer {
		  background-color: blue;
		  color: white;
		  text-align: center;
		  padding: 10px;
		}
	</style>
</head>
<body>
	<header>
		<h1>loo9</h1>
	</header>
	<section>
		<c:choose>
			<c:when test="">
				<%@ include file="" %>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/list.jsp" %>
			</c:otherwise>
		</c:choose>
	</section>
	<footer>
		<address>CopyRight &copy; iceram22@naver.com</address>
	</footer>
</body>
</html>