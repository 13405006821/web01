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
		<title>项目功能列表升级明细列表</title>
	</head>
	<body>
		<div class="container">
			<div class="content">
				<h4 class="contentNav mySource">
					项目功能列表升级明细列表
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
								<a href="javascript:;" class="btn bgblue tbSer" onclick="searchAll();">过滤搜索</a>
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
			ajaxHtml('${ROOT_PATH}/systemFunction!table.action?index=true', 'listData');
		});
		
		function searchSystemFunction(){
			var params = 'index=true&functionContent=' + $('#functionContent').val() + '&complete=' + $('#complete').val();
			ajaxHtml('${ROOT_PATH}/systemFunction!table.action?' + params, 'listData');
		}
		
		function searchAll(){
			ajaxHtml('${ROOT_PATH}/systemFunction!table.action', 'listData');
		}
	</script>
</html>