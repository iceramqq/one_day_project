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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
header {
	background-color: green;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
	color: white;
	text-align: center;
	padding: 2rem;
}
header h2 {
	margin: 16px;
	text-shadow: 3px 3px 3px rgba(0,0,0,0.2);
}
</style>

</head>
<body>
	<header>
		<h2>Loo9 쇼핑몰 V1</h2>
		<p>Loo9 쇼핑몰 2020 V1</p>
	</header>
	<section>
		<c:choose>
			<c:when test="${BODY == 'IO_WRITE' }">
				<%@ include file="/WEB-INF/views/iolist-write.jsp"%>
			</c:when>
			<c:when test="${BODY == 'IO_DETAIL'}">
				<%@ include file="/WEB-INF/views/iolist-detail.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/iolist-list.jsp"%>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>