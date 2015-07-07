<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<script type="text/javascript" src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${ROOT_PATH }/public/DatePicker/WdatePicker.js"></script>
		<title>用户信息</title>
	</head>
	<body>
		<form action="" id="dataForm">
			<input name="user.id" type="hidden" value="${id}"/>
			<div class="container">
				<div class="content">
					<h4 class="contentNav upload">
						<a class="backup" href="${ROOT_PATH }/user.action">&lt;&lt;返回</a>用户信息
					</h4>
					<ul class="detailBox checkDetail uploadBox">
						<li>
							<label for="" class="cName">用户名：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="user.username" value="${user.username }"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">密码：</label>
							<div class="cCont">
								<input type="password" class="typeTitle" name="user.password" value="${user.password }"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">真实姓名：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="user.realName" value="${user.realName }"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">出生日期：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="user.birthday" value="<fmt:formatDate value="${user.birthday}"/>" 
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">手机号码：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="user.phone" value="${user.phone }"/>
							</div>
						</li>
					</ul>
					<input type="button" value="提交保存" onclick="saveOrUpdate();" class="btn uploadSm" />
				</div>
			</div>
		</form>
	</body>
	<script type="text/javascript">
		function saveOrUpdate(){
			var params = $("#dataForm").serialize();
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/user!saveOrUpdate.action',
				data : params,
				dataType : "json",
				success : function(data) {
					if (data.success) {
						location.href = "${ROOT_PATH}/user.action";
					} else {
						alert('保存失败！');
					}
				}
			});
		}
	</script>
</html>