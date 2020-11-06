<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
section#search-list {
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
}

section#search-list h3 {
	border-bottom: 1px double black;
	width: 60%;
	margin: 10px;
	padding: 10px;
}

section#search-list div {
	width: 60%;
	border-bottom: 1px solid black;
	margin: 5px;
	padding: 5px;
	cursor: pointer;
}

section#search-list div p b {
	color: blue;
}

img {
	width: 15%;
	float: left;
	margin: 10px;
}

article {
	width: 60%;
	margin: 5px auto;
	text-align: right;
}

article button {
	padding: 10px 16px;
	background-color: blue;
	color: white;
	cursor: pointer;
	border-radius: 5px;
	border: none;
}

article button:hover {
	background-color: #ddd;
	color: black;
}
</style>
<script type="text/javascript">
$(function() {
	$(".team-item").click(function() {
		let seq = $(this).data("seq")
		document.location.href = "${rootPath}/team/detail/" + seq
	})
	/*
	$("#btn-write").click(function() {
		let category = $(this).data("category")
		document.location.href = "${rootPath}/team/write"
	})
	*/
})

</script>
<section id="search-list">
	<h3>${category}</h3>
	<c:forEach items="${hlist}" var="hlist">
		<div class="team-item" data-seq="${hlist.h_seq}">
			<c:if test="${hlist.h_file == null }">
				<img src="${rootPath}/upload/team/noImage.png" width="15%">
			</c:if>
			<c:if test="${hlist.h_file != null }">
				<img src="${rootPath}/upload/team/${hlist.h_file}" alt="이미지">
			</c:if>
			<h4>${hlist.h_title}</h4>
			<p>${hlist.h_address}</p>
			<p>${hlist.h_tel}</p>
			<p>${hlist.h_content}</p>
		</div>
	</c:forEach>
	<!-- 
	<article>
		<button id="btn-write" type="button">새로작성</button>
	</article>
	 -->
</section>
