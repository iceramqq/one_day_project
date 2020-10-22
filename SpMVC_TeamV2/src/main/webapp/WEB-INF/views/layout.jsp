<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>나의 홈페이지</title>
<style>
	* {
		box-sizing: border-box;
		margin:0;
		padding:0
	}
	
	html,body {
		width:100%;
		height: 100%;
	}
	
	body {
		display: flex;
		flex-direction: column;
	}
	
	section#content {
		flex:1;
		overflow: auto;
	}
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="nav" />
	<section id="content">
		<tiles:insertAttribute name="content" />
	</section>
	<tiles:insertAttribute name="footer" />
</body>
</html>