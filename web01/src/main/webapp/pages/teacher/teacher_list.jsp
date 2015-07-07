<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<link rel="stylesheet" href= "${ROOT_PATH }/public/ymPrompt/skin/simple_gray/ymPrompt.css" />
		<script src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script src="${ROOT_PATH }/public/js/utils.js"></script>
		<script src="${ROOT_PATH }/public/ymPrompt/ymPrompt.js"></script>
		<title>老师列表</title>
	</head>
	<body>
		<div class="container">
			<div class="content">
				<h4 class="contentNav mySource">
					老师列表
				</h4>
				<div class="tabBox classIng currBox">
					<ul class="tbSelect">
						<li>
							<label>用户名：</label>
							<input type="text" id="name" value="${name}"/>
							<span style="float: right; margin-right: 10px;">
								<a href="javascript:;" class="btn bgblue tbSer" onclick="searchTeacher();">搜索</a>
								<a href="javascript:;" onclick="teacher(0);" class="btn bgblue tbSer">新增</a>
								<a href="javascript:;" onclick="deleteAll();" class="btn bgblue tbSer">删除</a>
								<a href="${ROOT_PATH }/" class="btn bgblue tbSer">返回首页</a>
							</span>
						</li>
					</ul>
					<div id="listData"></div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			ajaxHtml('${ROOT_PATH}/teacher!table.action', 'listData');
		});
	
		function teacher(id){
			ymPrompt.win({
				message:"${ROOT_PATH}/teacher!teacherInfo.action?id=" + id,
				width:500,
				height:420,
				title:'老师信息',
				iframe:true
			});
		}
		
		function searchTeacher(){
			ajaxHtml('${ROOT_PATH}/teacher!table.action?name=' + $('#name').val(), 'listData');
		}
		
		function deleteTeacher(id) {
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/teacher!delete.action',
				data : {
					id : id
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.alert({
							title:"提示",
							message:"删除成功",
							closeBtn:false,
							handler:function(){
								// window.location.href = '${ROOT_PATH}/teacher.action';
								ajaxHtml('${ROOT_PATH}/teacher!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.alert({
							title:"提示",
							message:"删除失败",
							closeBtn:false
						});
					}
				}
			});
		}
		
		function deleteAll() {
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/teacher!deleteByIds.action',
				data : {
					ids : getCheckedToArray()
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.alert({
							title:"提示",
							message:"删除成功",
							closeBtn:false,
							handler:function(){
								// window.location.href = '${ROOT_PATH}/teacher.action';
								ajaxHtml('${ROOT_PATH}/teacher!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.alert({
							title:"提示",
							message:"删除失败",
							closeBtn:false
						});
					}
				}
			});
		}
	</script>
</html>