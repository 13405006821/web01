<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/reset.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/common.css" />
		<link rel="stylesheet" href="${ROOT_PATH }/public/style/style.css" />
		<script type="text/javascript" src="${ROOT_PATH }/public/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${ROOT_PATH }/public/DatePicker/WdatePicker.js"></script>
		<title>事务使用说明</title>
	</head>
	<body>
		<form action="" id="dataForm">
			<input name="user.id" type="hidden" value="${id}"/>
			<div class="container">
				<div class="content">
					<h4 class="contentNav upload">
						<a class="backup" href="${ROOT_PATH }/">&lt;&lt;返回</a>事务使用说明
					</h4>
					<ul class="detailBox checkDetail uploadBox">
						<li>
							pushlet.jar<br/>
							Pushlet.java<br/>
							PushletUtil.java<br/>
							pushlet.properties<br/>
							sources.properties<br/>
							ajax-pushlet-client.js<br/>
							OnlineUserBindingListener.java<br/>
							getSession().setAttribute("onlineUserBindingListener", new OnlineUserBindingListener("test"));<br/>
							web.xml<br/>
							<!-- 消息推送 start -->
							&lt;servlet&gt;<br/>
								&lt;servlet-name&gt;pushlet&lt;/servlet-name&gt;<br/>
								&lt;servlet-class&gt;com.base.plugins.pushlet.servlet.Pushlet&lt;/servlet-class&gt;<br/>
								&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;<br/>
							&lt;/servlet&gt;<br/>
							&lt;servlet-mapping&gt;<br/>
								&lt;servlet-name&gt;pushlet&lt;/servlet-name&gt;<br/>
								&lt;url-pattern&gt;/pushlet.srv&lt;/url-pattern&gt;<br/>
							&lt;/servlet-mapping&gt;<br/>
							jsp<br/>
							// pushlet控制服务器发送信息
							var sessionid = '${SESSION_USER_ID}';<br/>
							PL.userId=sessionid;<br/>
							PL.webRoot= "${ROOT_PATH}/";<br/>
							PL.joinListen('message');<br/>
						    function onData(event) {<br/>
						    	if(event.get('SYSTEM_COMMAND') != undefined ) {		//服务器端强制下线<br/>
						    		eval(event.get('SYSTEM_COMMAND'));<br/>
						    	}<br/>
						    } <br/>
						    function kickout(msg) {<br/>
								alert(msg);<br/>
							}<br/>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</body>
</html>