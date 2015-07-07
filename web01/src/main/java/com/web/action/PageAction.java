package com.web.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;

/**
 * 页面跳转action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "page_*", results = {
		@Result(name = "{1}", location = "/pages/page/{1}.jsp")
})
public class PageAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private String result;
	
	@Override
	public String execute() throws Exception {
		return result;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}