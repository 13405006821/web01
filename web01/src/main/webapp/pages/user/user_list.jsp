<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %> 
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<script src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<title>用户列表</title>
	</head>
	<body>
		<div class="container">
			<div class="content">
				<h4 class="contentNav mySource">
					用户列表
				</h4>
				<div class="tabBox classIng currBox">
					<ul class="tbSelect">
						<li>
							<label>用户名：</label>
							<input type="text" id="username" value="${username }"/>
							<span style="float: right; margin-right: 10px;">
								<a href="javascript:;" class="btn bgblue tbSer" onclick="searchUser();">搜索</a>
								<a href="javascript:;" onclick="user(0);" class="btn bgblue tbSer">新增</a>
								<a href="${ROOT_PATH }/" class="btn bgblue tbSer">返回首页</a>
							</span>
						</li>
					</ul>
					<table id="tbTable" class="normalTable">
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>真实姓名</th>
							<th>年龄</th>
							<th>手机号码</th>
							<th>操作</th>
						</tr>
						<c:if test="${empty list}">
							<tr>
								<td colspan="6">暂无数据</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="user" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${user.username}</td>
								<td>${user.realName}</td>
								<td><fmt:formatDate value="${user.birthday}"/></td>
								<td>${user.phone}</td>
								<td>
									<a href="javascript:;" class="enterClass green" onclick="user('${user.id}');">修改</a>
									<a href="javascript:;" class="endClass red" onclick="deleteUser('${user.id}');">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<pg:pager export="offset,currentPageNumber=pageNumber" items="${count}" isOffset="true" 
						maxPageItems="${pageSize}" maxIndexPages="${pageSize}" scope="request" index="center" url="user.action">
						<pg:param name="username" value="${username }" /> 
						<jsp:include page="/pages/base/page.jsp" flush="true"></jsp:include>
					</pg:pager>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		function user(id){
			location.href = "${ROOT_PATH}/user!userInfo.action?id=" + id;
		}
		
		function searchUser(){
			location.href = "${ROOT_PATH}/user.action?username=" + $('#username').val();
		}
		
		function deleteUser(id) {
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/user!delete.action',
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						location.href = "${ROOT_PATH}/user.action";
					} else {
						alert('删除失败！');
					}
				}
			});
		}
	</script>
</html>