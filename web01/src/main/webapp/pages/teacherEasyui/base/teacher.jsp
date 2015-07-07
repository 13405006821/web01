<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ROOT_PATH}/public/jquery-easyui-1.3.6/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ROOT_PATH}/public/jquery-easyui-1.3.6/themes/icon.css">
    <script type="text/javascript" src="${ROOT_PATH}/public/jquery-easyui-1.3.6/jquery.min.js"></script>
    <script type="text/javascript" src="${ROOT_PATH}/public/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ROOT_PATH}/public/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
    <title>老师列表-easy ui</title>
</head>
<body>
<div id="cataMenu">老师管理</div>
<div id="control">
	<div id="controlContent">
		<div id="contentBox">
			<!-- 查询数据 -->
			<div class="tinySearch">
				创建时间: <input id="startTime" class="easyui-datetimebox" data-options="editable:false,showSeconds: false" style="width:125px"> 
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px" onclick="searchAdvertise();">搜索</a>
			</div>
			<div style="margin-top: 5px; margin-bottom: 5px;">
				  <a href="#" class="easyui-linkbutton" data-options="" style="width:80px" onclick="deleteSelected();">批量删除</a>&nbsp;&nbsp;
			</div>
			<!-- 广告管理列表 -->
			<table title="广告管理列表" class="easyui-datagrid" style="height:620px" id="list"
            	data-options="url:'advertiseList_list.do', method:'get', rownumbers:true, fitColumns:true, singleSelect:false, checkOnSelect:true, selectOnCheck:true, pagination:true, pageSize:20">
		        <thead>
		            <tr>
		            	<th data-options="field:'ck', checkbox:true" width="10" align="center"></th>
		                <th data-options="field:'name'" width="20" align="center">广告名称</th>
		                <th data-options="field:'createTime'" width="10" align="center">创建时间</th>
		                <th data-options="field:'createBy', formatter:function(val, row){return val.name;}" width="10" align="center">创建人</th>
		                <th data-options="field:'position', formatter:formatterPosition" width="10" align="center">广告位置</th>
		                <th data-options="field:'type', formatter:formatterType" width="10" align="center">广告类型</th>
		                <th data-options="field:'recommend', formatter:formatterRecommend" width="10" align="center">是否推荐</th>
		                <th data-options="field:'id', formatter:formatterOperation" width="15" align="center">操作</th>
		            </tr>
		        </thead>
		    </table>
			<!-- 广告 -->
			<div id="winAdvertise" class="easyui-window" data-options="iconCls:'icon-save', closed:true, border:false, modal:true" style="width:800px;height:360px;padding:10px;position:relative;">
				<form id="adForm">
				<table>	
					<tr>
						<td colspan="4" style="padding:10px;font-weight:bold;font-size: 14px;">
							<input type="hidden" id="adId" name="id"/>
							<label id="winAdvertiseTitle"></label>
						</td>
					</tr>
					<tr>
						<td style="padding:10px;">广告名称：</td>
						<td style="padding:10px;">
							<input type="text" name="name" id="adName" style="width:120px" class="easyui-validatebox" data-options="required:true, missingMessage:'请输入广告名称'"/>
						</td>
						<td style="padding:10px;">所在位置：</td>
						<td style="padding:10px;">
							<select class="easyui-combobox" name="position" id="adPosition" style="width:120px;">
						        <option value="">请选择</option>
						        <option value="1">首页</option>
						        <option value="2">全站搜索</option>
						        <option value="3">同步课堂</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style="padding:10px;">广告类型：</td>
						<td style="padding:10px;">
							<select class="easyui-combobox" name="type" id="adType" style="width:120px;">
						        <option value="">请选择</option>
						        <option value="1">图片</option>
						        <option value="2">视频</option>
							</select>
						</td>
						<td style="padding:10px;"  id="picTd1">上传图片：</td>
						<td style="padding:10px;"  id="picTd2">
							<input type="hidden" id="imgfile" name="img" value=""/>
							<input type="hidden" id="fileId" name="fileId" value=""/>
							<a href="#" class="easyui-linkbutton" style="width:80px">选择图片</a>
							<input type="file" id="fileinput" name="file" class="uploadFileCss" />
							<br/>
							<label id="limitFileType"></label>
						</td>
					</tr>
					<tr id="urlTr">
						<td style="padding:10px;">超链接：</td>
						<td style="padding:10px;" colspan="3">
							<input type="text" name="url" style="width:360px" id="adUrl" class="easyui-validatebox"/>
						</td>
					</tr>
				</table>
				</form>
		        <div style="text-align:center;padding:35px">
		        	<a href="javascript:void(0);" id="saveOrUpdateAdvertise" data-options="iconCls:'icon-ok'" class="easyui-linkbutton" style="width:80px" onclick="saveOrUpdateAdvertise();">确定</a>
		            <a href="javascript:void(0);" data-options="iconCls:'icon-undo'" class="easyui-linkbutton" style="width:80px" onclick="$('#winAdvertise').window('close');">关闭</a>
		        </div>
			</div>
		    <script type="text/javascript">
		    	var advertiseIndexPicture = '${advertiseIndexPicture}'; // 首页广告图片个数
    			var advertiseIndexVideo = '${advertiseIndexVideo}'; // 首页广告视频个数
    			var advertiseSerachPicture = '${advertiseSerachPicture}'; // 全站搜索广告图片个数
    			var advertiseCoursePicture = '${advertiseCoursePicture}'; // 在线辅导广告图片个数
    			
				$(function(){
					// 解决谷歌浏览器多次上传bug
	    			$("#fileinput").bind("change", function(){ uploadFileTest('fileinput'); });
					
					// 添加change事件
					buildAdTypeCombobox('adType');
					$('#picTd2 a').html('选择图片');
					
					$("#list").datagrid({
					    onLoadSuccess:function (data){
						    var target = $("#list");
						    if(data.total>0){
							    var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
							    vc.children('div.datagrid-empty').remove();
							    return;
						    }
							noRecordsView(target);
						}
					});
				});
				
				// 添加change事件
				function buildAdTypeCombobox(id){
					$("#" + id).combobox({multiple:false, editable:false, 
						onChange:function(newValue, oldValue){
							if(newValue == 2){
								$("#imgUpload"     ).attr("src", "");
								$('#urlTr').hide();
								$('#picTd1').html('上传视频：');
								$('#picTd2 a').html('选择视频');
								$('#limitFileType').html('<font color="red">*视频限制格式swf</font>');
							}else{
								$('#urlTr').show();
								$('#picTd1').html('上传图片：');
								$('#picTd2 a').html('选择图片');
								$('#limitFileType').html('');
							}
						}
					});
			    }

				// 初始化推荐下拉框
			    function buildRecommendValue(id, idPriority, num){
			    	var arr = new Array();
			    	arr.push({value:0, text:"未推荐"});
			    	for (var i=1;i<=num;i++){
			    		arr.push({value:i, text:"栏位" + i});
			    	}
					$("#" + id).combobox({data:arr, multiple:false, editable:false, 
						onChange:function(newValue, oldValue){
							if(newValue != 0){
								$("#" + idPriority).numberbox("enable");
								$("#" + idPriority).numberbox("enableValidation");
							} else {
								$("#" + idPriority).numberbox("disable");
								$("#" + idPriority).numberbox("disableValidation");
								$("#" + idPriority).numberbox("setValue", null);
							}
						}
					});
			    }

		    	// 操作列
			    function formatterOperation(val, row){
			       var str ="";
			    	str+= "<a href='javascript:void(0);' onclick='showAdvertise(" + row.id + ");'>查看</a>&nbsp;&nbsp;";
				    str+= "<a href='javascript:void(0);' onclick='editAdvertise(" + row.id + ");'>编辑</a>&nbsp;&nbsp;";
			    	str+= "<a href='javascript:void(0);' onclick='deleteSingleAdvertise(" + row.id + ");'>删除</a>";
			    	return str;
			    }
			    
		    	// 广告位置列
			    function formatterPosition(val, row){
			    	var str = "";
			    	if(val == 1){
				    	str = "首页";
			    	}else if(val == 2){
				    	str = "全站搜索";
			    	}else if(val == 3){
				    	str = "同步课堂";
			    	}
			    	return str;
			    }
			    
			    // 广告类型列
			    function formatterType(val, row){
			    	var str = "";
			    	if(val == 1){
				    	str = "图片";
			    	}else if(val == 2){
				    	str = "视频";
			    	}
			    	return str;
			    }
			    
			    // 是否推荐列
			    function formatterRecommend(val, row){
			    	var str = "";
					if(val == 0){
						str = "未推荐";
					}else{
						str = "<a class='c_green' href='javascript:void(0);'>已推荐</a>";
					}
					return str;
			    }
			    
			    // 查询
				function searchAdvertise(){
					var queryParams = $("#list").datagrid("options").queryParams; 
					var startTime = $('#startTime').datetimebox("getValue");// 创建时间
					var endTime = $('#endTime').datetimebox("getValue");// 创建时间
					var userName = $('#userName').val();// 创建时间
					var advertiseName = $('#advertiseName').val();// 广告名称
					var position = $('#position').combobox("getValue");// 所在位置
					var type = $('#type').combobox("getValue");// 广告类型
					queryParams["startTime"] = startTime;
					queryParams["endTime"] = endTime;
					queryParams["advertiseName"] = advertiseName;
					queryParams["userName"] = userName;
					queryParams["position"] = position;
					queryParams["type"] = type;
					$("#list").datagrid('options').queryParams = queryParams;
		            $("#list").datagrid('reload');
				}
				
				// 验证
				function check(saveOrUpdate){
					var position = $('#adPosition').combobox("getValue");
					if(position == 0){
						$.messager.alert('提示','请选择广告位置!');
						return false;
					}
		    		var type = $('#adType').combobox("getValue");
		    		if(type == 0){
						$.messager.alert('提示','请选择广告类型!');
						return false;
					}
					if(type == 1 && saveOrUpdate == 'save'){
						var img = $('#imgfile').val();
			    		if(typeof(img) == "undefined" || img == null || img.length == 0){
							$.messager.alert('提示','请选择上传图片!');
							return false;
						}
						var adUrl = $('#adUrl').val();
			    		if(typeof(adUrl) == "undefined" || adUrl == null || adUrl.length == 0){
							$.messager.alert('提示','请填写超链接!');
							return false;
						}
					}
					return true;
				}
				
		    	// 新建
				function addAdvertise(){
					clearParams();
					$('#winAdvertise').window('setTitle', '创建广告');
					$('#winAdvertiseTitle').text('创建广告');
					$('#saveOrUpdateAdvertise').show();
					$('#winAdvertise').window("open");
				}

		    	// 显示详细
				function showAdvertise(id){
					clearParams();
					$('#winAdvertise').window('setTitle', '查看广告');
					$('#winAdvertiseTitle').text('查看广告');
					$('#saveOrUpdateAdvertise').hide();
					$.post("${ROOT_PATH}/admin/advertise/advertiseDetail.do?id=" + id, {}, 
		    		function(data){
		    			$('#adId').val(data.id);
		    			$('#adName').val(encodeHTML(data.name));
		    			$('#adPosition').combobox("setValue", data.position);
		    			$('#adType').combobox("setValue", data.type);
		    			if(data.type == 1){
		    				$("#videoUpload").hide();
							$("#videoUpload").html('');
			    			$('#adUrl').val(data.url);
			    			$("#imgUpload").show();
							$("#imgUpload").attr("src", "${ROOT_PATH}/imageFile.do?type=advertise&id=" + data.id + "&ran=" + Math.random());
						}else{
							$("#imgUpload").hide();
							$("#imgUpload").attr("src", "");
							$("#videoUpload").show();
							$("#videoUpload").html('<embed quality="high" type="application/x-shockwave-flash" src="' + '${ROOT_PATH}/imageFile.do?type=advertiseVideo&id=' + data.fileId + '" height="200" loop="false"></embed>');
						}
	            	}, 'json');
					$('#winAdvertise').window("open");
				}
				
				//编辑广告
				function editAdvertise(id){
					clearParams();
					$('#winAdvertise').window('setTitle', '编辑广告');
					$('#winAdvertiseTitle').text('编辑广告');
					$('#saveOrUpdateAdvertise').show();
					$.post("${ROOT_PATH}/admin/advertise/advertiseDetail.do?id=" + id, {}, 
		    		function(data){
		    			$('#adId').val(data.id);
		    			$('#adName').val(encodeHTML(data.name));
		    			$('#adPosition').combobox("setValue", data.position);
		    			$('#adType').combobox("setValue", data.type);
		    			if(data.type == 1){
		    				$("#videoUpload").hide();
							$("#videoUpload").html('');
		    				$('#adUrl').val(data.url);
			    			$("#imgUpload").show();
							$("#imgUpload").attr("src", "${ROOT_PATH}/imageFile.do?type=advertise&id=" + data.id + "&ran=" + Math.random());
		    			}else{
		    				$("#imgUpload").hide();
							$("#imgUpload").attr("src", "");
							$("#videoUpload").show();
							$("#videoUpload").html('<embed quality="high" type="application/x-shockwave-flash" src="' + '${ROOT_PATH}/imageFile.do?type=advertiseVideo&id=' + data.fileId + '" height="200" loop="false"></embed>');
						}
	            	}, 'json');
					$('#winAdvertise').window("open");
				}
		    	
		    	// 删除单条广告
		    	function deleteSingleAdvertise(id){
	    			$.messager.confirm('确认', '确认要删除该广告吗?', function(r){
		                if (r){
				    		$.post("deleteAdvertise.do?advertiseIds=" + id, {}, function(data){
			               		if (!data.result){
			               			$.messager.alert('失败','删除失败!');
			               		} else {
			               			$("#list").datagrid('reload');
			               		}
			            	}, 'json');
		                }
		            });
		    	}
		    	
		    	// 删除选中记录
		    	function deleteSelected(){
		    		var rows = $("#list").datagrid('getChecked');
		    		if (rows.length > 0){
		    			$.messager.confirm('确认', '确认要删除这些广告记录吗?', function(r){
			                if (r){
				    			var str = "";
					    		for (var i=0;i<rows.length;i++){
					    			if (str.length > 0)
					    				str = str + "&";
					    			str = str + "advertiseIds=" + rows[i].id;
					    		}
					    		$.post("deleteAdvertise.do?" + str, {}, function(data){
				               		if (!data.result){
				               			$.messager.alert('提示','批量操作失败!');
				               		} else {
				               			$("#list").datagrid('reload');
				               		}
				            	}, 'json');
			                }
			            });
		    		} else {
		    			$.messager.alert('提示','请先选择要删除广告记录!');
		    		}
		    	}
		    	
		    	// 保存或者更新广告
		    	function saveOrUpdateAdvertise(){
		    		var saveOrUpdate = 'save';
		    		var adId = $('#adId').val();
		    		if(adId.length > 0){
		    			saveOrUpdate = 'update';
		    		}
		    		if ($("#adForm").form("validate") && check(saveOrUpdate)){
		    			var params = $("#adForm").serialize();
		            	$.ajax({
							type : "POST",
							url : "saveOrUpdateAdvertise.do",
							data : params,
							success : function(data){
								if (data.result){
									$('#imgfile').val('');
			    					$("#winAdvertise").window('close');
			    					$("#list").datagrid('reload');
			               		}else{
			               			$.messager.alert('提示','创建失败!');
			               		}
							}
						});
		    		}
		    	}
		    	
		    	// 清空表单值
		    	function clearParams(){
		    		$('#adId').val('');
	    			$('#adName').val('');
	    			$('#adPosition').combobox("setValue", '');
	    			$('#adType').combobox("setValue", '');
	    			$('#adUrl').val('');
	    			$('#imgUpload').attr('src', '');
		    	}
		    	
		    	// 推荐
		    	var recommendId = undefined;
		    	function recommendAdvertise(id){
		    		recommendId = id;
		    		$.post("advertiseDetail.do?id=" + id, {}, 
		    		function(data){
		    			var num = 0;
		    			if(data.position == 1){
		    				if(data.type == 1){
		    					num = 2;
		    				}else if(data.type == 2){
		    					num = 1;
		    				}
		    			}else if(data.position == 2 && data.type == 1){
		    				num = 1;
		    			}else if(data.position == 3 && data.type == 1){
		    				num = 4;
		    			}else{
		    				$.messager.alert('提示','该广告位置和广告类型不可以推荐!');
		    				return ;
		    			}
		    			// 初始化推荐下拉框
						buildRecommendValue("recommend", "recommendPriority", num);
		    			$('#recommend').combobox("setValue", data.recommend);
		    			setPriorityValue("recommendPriority", data.recommend, data.recommendPriority);
		    			$('#winRecommend').window("open");
	            	}, 'json');
		    	}
		    	
		    	// 设置推荐下拉框
				function setPriorityValue(id, recommend, priority){
		    		if (recommend == 0){
	    				$('#' + id).numberbox("disable");
	    				$('#' + id).numberbox("disableValidation");
	    				$('#' + id).numberbox("setValue", null);
	    			} else {
	    				$('#' + id).numberbox("enable");
	    				$('#' + id).numberbox("enableValidation");
	    				$('#' + id).numberbox("setValue", priority);
	    			}
		    	}
		    	
		    	// 保存课程推荐
		    	function saveRecommend(){
		    		if ($("#recommendForm").form("validate")){
			    		if (recommendId != undefined){
			    			$.post("saveRecommend.do", 
			    			{
			    				"id":recommendId,
			    				"recommend":$('#recommend').combobox("getValue"), 
			    				"recommendPriority":$('#recommendPriority').numberbox("getValue") 
			    			}, 
			    			function(data){
			    				if (data.result){
			    					$("#winRecommend").window('close');
			    					$("#list").datagrid('reload');
			               		}
			            	}, 'json');
			    		}
		    		}
		    	}
		    </script>
		</div>
	</div>
</div>
</body>
</html>