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
		<script src="${ROOT_PATH }/public/pushlet/ajax-pushlet-client.js"></script>
		<title>功能点列表</title>
	</head>
	<body>
		<div class="container">
			<div class="content">
				<h4 class="contentNav mySource">
					功能点列表
				</h4>
				<div class="tabBox classIng currBox">
					<ul class="tbSelect">
						<li>
							<label>功能点说明：</label>
							<input type="text" id="functionContent" value="${functionContent}"/>
							<label>是否完成：</label>
							<select id="complete">
								<option value="">全部</option>
								<option value="true">已完成</option>
								<option value="false">未完成</option>
							</select>
							<span style="float: right; margin-right: 10px;">
								<a href="javascript:;" class="btn bgblue tbSer" onclick="searchSystemFunction();">搜索</a>
								<a href="javascript:;" onclick="systemFunction(0);" class="btn bgblue tbSer">新增</a>
								<a href="javascript:;" onclick="deleteAll();" class="btn bgblue tbSer">删除</a>
								<a href="javascript:;" onclick="complete();" class="btn bgblue tbSer">完成</a>
								<a href="javascript:;" onclick="cancel();" class="btn bgblue tbSer">取消完成</a>
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
		// pushlet控制服务器发送信息
		var sessionid = '${SESSION_USER_ID}';
		PL.userId=sessionid;
		PL.webRoot= "${ROOT_PATH}/";
		PL.joinListen('message');
	    
	    function onData(event) {
	    	if(event.get('SYSTEM_COMMAND') != undefined ) {		//服务器端强制下线
	    		eval(event.get('SYSTEM_COMMAND'));
	    	}
	    } 
		
	    function kickout(msg) {
			ymPrompt.alert(msg, 400, 200, "提示", null);
		}
	
		$(function(){
			ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
		});
	
		function systemFunction(id){
			ymPrompt.win({
				message:"${ROOT_PATH}/systemFunction!systemFunctionInfo.action?id=" + id,
				width:500,
				height:420,
				title:'功能信息',
				iframe:true
			});
		}
		
		function searchSystemFunction(){
			var params = 'functionContent=' + $('#functionContent').val() + '&complete=' + $('#complete').val();
			ajaxHtml('${ROOT_PATH}/systemFunction!table.action?' + params, 'listData');
		}
		
		function deleteSystemFunction(id) {
			ymPrompt.confirmInfo({
				message:'确定删除这些数据？',
				handler:function(tp){
					if(tp != 'ok'){
						return;
					}
					$.ajax({
						type : "POST",
						url : '${ROOT_PATH}/systemFunction!delete.action',
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
										ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
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
			});
		}
		
		function deleteAll() {
			ymPrompt.confirmInfo({
				message:'确定删除这些数据？',
				handler:function(tp){
					if(tp != 'ok'){
						return;
					}
					$.ajax({
						type : "POST",
						url : '${ROOT_PATH}/systemFunction!deleteByIds.action',
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
										ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
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
			});
		}
		
		function complete() {
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/systemFunction!complete.action',
				data : {
					ids : getCheckedToArray()
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.alert({
							title:"提示",
							message:"操作成功",
							closeBtn:false,
							handler:function(){
								// window.location.href = '${ROOT_PATH}/teacher.action';
								ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.alert({
							title:"提示",
							message:"操作失败",
							closeBtn:false
						});
					}
				}
			});
		}
		
		function cancel() {
			$.ajax({
				type : "POST",
				url : '${ROOT_PATH}/systemFunction!cancel.action',
				data : {
					ids : getCheckedToArray()
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						ymPrompt.alert({
							title:"提示",
							message:"操作成功",
							closeBtn:false,
							handler:function(){
								// window.location.href = '${ROOT_PATH}/teacher.action';
								ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
							}
						});
					} else {
						ymPrompt.alert({
							title:"提示",
							message:"操作失败",
							closeBtn:false
						});
					}
				}
			});
		}
	</script>
</html>