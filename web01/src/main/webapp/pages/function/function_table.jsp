<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<table id="tbTable" class="normalTable">
	<tr>
		<c:if test="${!index}">
			<th width="5%"><input type="checkbox" onclick="checkAll(this);"/></th>
		</c:if>
		<th width="5%">序号</th>
		<th width="5%">紧急</th>
		<th width="60%">功能点说明</th>
		<th width="15%">是否完成</th>
		<th width="10%">操作</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<c:if test="${index}">
				<td colspan="6">暂无数据</td>
			</c:if>
			<c:if test="${!index}">
				<td colspan="7">暂无数据</td>
			</c:if>
		</tr>
	</c:if>
	<c:forEach items="${list}" var="func" varStatus="status">
		<tr>
			<c:if test="${!index}">
				<td><input type="checkbox" value="${func.id}" class="ids"/></td>
			</c:if>
			<td>${status.count}</td>
			<td>
				<c:if test="${func.important <= 5}">
					<font color="blue">${func.important}</font>
				</c:if>
				<c:if test="${func.important > 5}">
					<font color="red">${func.important}</font>
				</c:if>
			</td>
			<td align="left">${func.functionContent}</td>
			<td>
				<c:if test="${func.complete }">
					<font color="blue">已完成<fmt:formatDate value="${func.completeTime}"/></font>
				</c:if>
				<c:if test="${!func.complete }"><font color="red">未完成</font></c:if>
			</td>
			<td>
				<c:if test="${index}">
					<a href="${ROOT_PATH }/${func.url }" class="enterClass green">查看功能</a>
				</c:if>
				<c:if test="${!index}">
					<a href="javascript:;" class="enterClass green" onclick="systemFunction('${func.id}');">修改</a>
					<a href="javascript:;" class="endClass red" onclick="deleteSystemFunction('${func.id}');">删除</a>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<pg:pager export="offset,currentPageNumber=pageNumber" items="${count}" isOffset="true" 
	maxPageItems="${pageSize}" maxIndexPages="${pageSize}" scope="request" index="center" url="systemFunction!table.action">
	<pg:param name="functionContent" value="${functionContent }" /> 
	<pg:param name="index" value="${index }" /> 
	<jsp:include page="/pages/base/ajaxPage.jsp" flush="true">
		<jsp:param value="listData" name="domId" />
	</jsp:include>
</pg:pager>