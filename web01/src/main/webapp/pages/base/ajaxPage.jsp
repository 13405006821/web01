<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ROOT_PATH }/public/js/utils.js"></script>
<title>静态分页</title>
</head>
<body>
	<!-- 分页传过来的参数 对应替换数据的dom的id -->
	<% String domId = request.getParameter("domId"); %>
	<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
	<c:if test="${count > 0}">
		<div id="pagelist" class="pageNavi">
			<pg:first unless="current">
				<a href="javascript:;" class="page_first" onclick="ajaxHtml('<%= pageUrl %>', '<%= domId %>');">首页</a>
			</pg:first>
			<pg:prev>
				<a href="javascript:;" class="page_prev" onclick="ajaxHtml('<%= pageUrl %>', '<%= domId %>');">上一页</a>
			</pg:prev>
			<pg:pages>
				<% if (pageNumber == currentPageNumber) { %>
					<a class="curr" href="javascript:void(0)"><%= pageNumber %></a>
				<% } else { %>
					<a href="javascript:;" class="etc" onclick="ajaxHtml('<%= pageUrl %>', '<%= domId %>');"><%= pageNumber %></a>
				<% } %>
			</pg:pages>
			<pg:next>
				<a href="javascript:;" class="page_next" onclick="ajaxHtml('<%= pageUrl %>', '<%= domId %>');">下一页</a>
			</pg:next>
			<pg:last unless="current">
				<a href="javascript:;" class="page_last" onclick="ajaxHtml('<%= pageUrl %>', '<%= domId %>');">末页</a>
			</pg:last>
		</div>
	</c:if>
</body>
</html>