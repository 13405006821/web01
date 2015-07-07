<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<table id="tbTable" class="normalTable">
	<tr>
		<th><input type="checkbox" onclick="checkAll(this);"/></th>
		<th>序号</th>
		<th>姓名</th>
		<th>生日</th>
		<th>手机号码</th>
		<th>操作</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="6">暂无数据</td>
		</tr>
	</c:if>
	<c:forEach items="${list}" var="teacher" varStatus="status">
		<tr>
			<td><input type="checkbox" value="${teacher.id}" class="ids"/></td>
			<td>${status.count}</td>
			<td>${teacher.name}</td>
			<td><fmt:formatDate value="${teacher.birthday}"/></td>
			<td>${teacher.phone}</td>
			<td>
				<a href="javascript:;" class="enterClass green" onclick="teacher('${teacher.id}');">修改</a>
				<a href="javascript:;" class="endClass red" onclick="deleteTeacher('${teacher.id}');">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
<pg:pager export="offset,currentPageNumber=pageNumber" items="${count}" isOffset="true" 
	maxPageItems="${pageSize}" maxIndexPages="${pageSize}" scope="request" index="center" url="teacher!table.action">
	<pg:param name="name" value="${name }" /> 
	<jsp:include page="/pages/base/ajaxPage.jsp" flush="true">
		<jsp:param value="listData" name="domId" />
	</jsp:include>
</pg:pager>