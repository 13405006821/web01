<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<link rel="stylesheet" href= "${ROOT_PATH }/public/ymPrompt/skin/simple_gray/ymPrompt.css" />
		<script type="text/javascript" src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${ROOT_PATH }/public/DatePicker/WdatePicker.js"></script>
		<script src="${ROOT_PATH }/public/ymPrompt/ymPrompt.js"></script>
		<title>老师信息</title>
	</head>
	<body>
		<form action="" id="dataForm">
			<input name="teacher.id" type="hidden" value="${id}"/>
			<div class="container">
				<div class="content">
					<h4 class="contentNav upload">老师信息</h4>
					<ul class="detailBox checkDetail uploadBox">
						<li>
							<label for="" class="cName">姓名：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="teacher.name" value="${teacher.name }"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">出生日期：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="teacher.birthday" value="<fmt:formatDate value="${teacher.birthday}"/>" 
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
							</div>
						</li>
						<li>
							<label for="" class="cName">手机号码：</label>
							<div class="cCont">
								<input type="text" class="typeTitle" name="teacher.phone" value="${teacher.phone }"/>
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
				url : '${ROOT_PATH}/teacher!saveOrUpdate.action',
				data : params,
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.succeedInfo({
							message:'保存成功',
							width:400,
							height:260,
							handler:function(){
								window.parent.ymPrompt.doHandler('error',true);
								// window.parent.location.href = '${ROOT_PATH}/teacher.action';
								window.parent.ajaxHtml('${ROOT_PATH}/teacher!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.errorInfo({
							message:'保存失败'
						});
					}
				}
			});
		}
	</script>
</html>