package com.base.plugins.pushlet.util;

import org.apache.commons.lang.StringUtils;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.SessionManager;

public class PushletUtil {

	static final String SYSTEM_COMMAND = "SYSTEM_COMMAND";
	static final String SYSTEM_MESSAGE = "SYSTEM_MESSAGE";
	
	/**
	 * 发送消息至客户端
	 * @param sessid
	 * @param msg
	 */
	public static void sendMessage(String sessid, String msg) {
		if(StringUtils.isNotBlank(sessid)
				&&SessionManager.getInstance().hasSession(sessid)) {
			Event event = Event.createDataEvent("message");
			event.setField(SYSTEM_MESSAGE, msg);
			Dispatcher.getInstance().unicast(event, sessid);
		}
	}
	
	/**
	 * 广播至所有在线客户端
	 * @param msg
	 */
	public static void sendBroadcast(String msg) {
		Event event = Event.createDataEvent("message");
		event.setField(SYSTEM_COMMAND, msg);
		Dispatcher.getInstance().broadcast(event);
	}
	
	/**
	 * 客户端全部下线
	 * @param msg
	 */
	public static void sendBroadcastLogoff() {
		Event event = Event.createDataEvent("message");
		event.setField(SYSTEM_COMMAND, "kickout('服务器例行维护，用户强制下线')");
		Dispatcher.getInstance().broadcast(event);
	}
	
	/**
	 * 服务端强制下线
	 * @param sessionId
	 */
	public static void sendLogoffCammand(String sessionId, String command) {
		Event event = Event.createDataEvent("message");
		event.setField(SYSTEM_COMMAND, command);
		Dispatcher.getInstance().unicast(event, sessionId);
	}
	
}
