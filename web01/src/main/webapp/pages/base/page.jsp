<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页</title>
</head>
<body>
	<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
	<c:if test="${count > 0}">
	<div id="pagelist" class="pageNavi">
		<pg:first unless="current">
			<a href="<%= pageUrl %>" class="page_first">首页</a>
		</pg:first>
		<pg:prev>
			<a href="<%= pageUrl %>" class="page_prev">上一页</a>
		</pg:prev>
		<pg:pages>
			<% if (pageNumber == currentPageNumber) { %>
				<a class="curr" href="javascript:void(0)"><%= pageNumber %></a>
			<% } else { %>
				<a href="<%= pageUrl %>" class="etc"><%= pageNumber %></a>
			<% } %>
		</pg:pages>
		<pg:next>
			<a href="<%= pageUrl %>" class="page_next">下一页</a>
		</pg:next>
		<c:if test="${pageNumber > 0 }">
			<pg:last unless="current"><a href="<%= pageUrl %>" class="page_last">末页</a></pg:last>
		</c:if>
	</div>
	</c:if>
</body>
</html>