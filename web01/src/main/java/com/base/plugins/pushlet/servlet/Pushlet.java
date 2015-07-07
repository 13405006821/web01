package com.base.plugins.pushlet.servlet;

import com.base.plugins.pushlet.util.PushletUtil;

/**
 * 重载Pushlet,重写destroy()方法
 * 
 * @author liup
 */
public class Pushlet extends nl.justobjects.pushlet.servlet.Pushlet {

	private static final long serialVersionUID = -2689982389938664241L;

	public void destroy() {
		// 所有客户端连接强制下线
		PushletUtil.sendBroadcastLogoff();
		super.destroy();
	}
}
