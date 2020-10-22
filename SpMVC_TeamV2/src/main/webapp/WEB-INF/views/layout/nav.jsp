<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
nav ul {
	list-style: none;
	display: flex;
	background-color: green;
	color: white;
}

nav ul li {
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

nav ul li:nth-child(4) {
	margin-left: auto;
}

nav ul li:hover {
	background-color: #ddd;
	color: black;
}
</style>
<nav id="main-nav">
	<ul id="main-menu">
		<li>고궁/성</li>
		<li>고택/생가</li>
		<li>유적지/사적지</li>
		<li>마이페이지</li>
		<li>로그아웃</li>
		<li>관리자</li>
	</ul>
</nav>