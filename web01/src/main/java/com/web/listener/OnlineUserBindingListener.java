package com.web.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.base.plugins.pushlet.util.PushletUtil;
import com.base.util.Constants;

/**
 * 检测SESSION的创建和销毁，以判断在线用户数
 * 
 * @author liup
 */
public class OnlineUserBindingListener implements HttpSessionBindingListener {

	private List<String> userList;
	private String userid;

	public OnlineUserBindingListener(String loginid) {
		this.userid = loginid;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		// 获取application里面在线用户列表
		userList = (List<String>) application.getAttribute(Constants.APPLICATION_ONLINE_USER);
		if (userList == null) {
			userList = new ArrayList<String>();
		}
		// 当前登录用户在在线用户列表中
		if (userList.contains(userid)) {
			PushletUtil.sendLogoffCammand(userid, "kickout('该账号在其他地方登陆');");
		}
		// 不管是不是该用户已登录，直接放到list，是为了控制单点登录
		userList.add(userid);
		application.setAttribute(Constants.APPLICATION_ONLINE_USER, userList); // 更新在线用户数
	}

	@SuppressWarnings("unchecked")
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		userList = (List<String>) application.getAttribute(Constants.APPLICATION_ONLINE_USER); // 获取在线用户列表
		if (userList != null) {
			for(String uid : userList){
				if(uid.equals(userid)){
					userList.remove(userid);
					break;
				}
			}
		} else {
			userList = new ArrayList<String>(); // 防止数据异常
		}
		application.setAttribute(Constants.APPLICATION_ONLINE_USER, userList); // 更新在线用户数
	}
}