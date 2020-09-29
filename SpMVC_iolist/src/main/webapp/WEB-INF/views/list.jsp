<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

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
<c:choose>
	<c:otherwise>
		<c:forEach items="${iolists}" var="iolist" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${iolist.io_date}</td>
				<td>${iolist.io_time}</td>
				<td data-seq="${iolist.seq}">${iolist.io_pname}</td>
				<c:when test="${iolist.io_input eq 1}">
					<td>${iolist.io_price}</td>
				</c:when>
				<c:when test="${iolist.io_input eq 2}">
					<td>${iolist.io_price}</td>
				</c:when>
				<td>${iolist.io_quan}</td>
				<c:when test="${iolist.io_input eq 1}">
					<td>${iolist.io_total}</td>
				</c:when>
				<c:when test="${iolist.io_input eq 2}">
					<td>${iolist.io_total}</td>
				</c:when>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<div id="iolist-link-box">
	<a href="${rootPath}/input">새로작성</a>
</div>