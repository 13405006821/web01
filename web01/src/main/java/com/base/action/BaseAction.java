package com.base.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.alibaba.fastjson.JSON;
import com.base.util.Page;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Action基础类
 * @author Liup
 */
public class BaseAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware, ServletContextAware {

	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest servletRequest;
	private HttpServletResponse servletResponse;
	private ServletContext servletContext;
	// 分页使用
	private Page pager;
	private int startIndex = 1;
	private int pageSize = 10;
	private int count = 0;

	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @throws IOException
	 */
	public void writeJson(Object object) {
		try {
			String json = JSON.toJSONStringWithDateFormat(object,
					"yyyy-MM-dd HH:mm:ss");
			ServletActionContext.getResponse().setContentType(
					"text/json;charset=utf-8");
			System.out.println(json);
			ServletActionContext.getResponse().getWriter().write(json);
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getRealPath(String path) {
		return servletContext.getRealPath(path);
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public HttpSession getSession(){
		return getServletRequest().getSession();
	}

	public int getStartIndex() {
		String pageOffset = getServletRequest().getParameter("pager.offset");
		if (StringUtils.isNotBlank(pageOffset)) {
			try {
				startIndex = Math.max(1, Integer.parseInt(pageOffset) + 1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Page getPager() {
		return pager;
	}

	public void setPager(Page pager) {
		this.pager = pager;
	}
}