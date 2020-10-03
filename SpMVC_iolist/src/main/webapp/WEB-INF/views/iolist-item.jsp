<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />        
<tr data-seq="${ioVO.seq}">
	<td>${i.count}</td>
	<td>${ioVO.io_date}</td>
	<td>${ioVO.io_time}</td>
	<td>${ioVO.io_pname}</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
	<td>0</td>
</tr>
