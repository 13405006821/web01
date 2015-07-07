package com.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Constants;
import com.base.util.Json;
import com.web.entity.SystemFunction;
import com.web.listener.OnlineUserBindingListener;
import com.web.service.IFunctionService;

/**
 * 功能action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "systemFunction", results = {
		@Result(name = "function_list", location = "/pages/function/function_list.jsp"),
		@Result(name = "function_table", location = "/pages/function/function_table.jsp"),
		@Result(name = "function_info", location = "/pages/function/function_info.jsp")
})
public class SystemFunctionAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Boolean complete;
	private String functionContent;
	private Boolean index = false;
	private String ids;
	private SystemFunction systemFunction;
	private List<SystemFunction> list = new ArrayList<SystemFunction>();
	
	@Resource
	private IFunctionService functionService;
	
	@Override
	public String execute() throws Exception {
		getSession().setAttribute(Constants.SESSION_USER_ID, "test");
		getSession().setAttribute("onlineUserBindingListener", new OnlineUserBindingListener("test"));
		return "function_list";
	}
	
	public String table(){
		list = functionService.findList(functionContent, complete, getStartIndex(), getPageSize());
		setCount(functionService.findCount(functionContent, complete));
		return "function_table";
	}

	public String systemFunctionInfo() throws Exception {
		systemFunction = functionService.getById(id);
		return "function_info";
	}
	
	public void saveOrUpdate() throws Exception {
		Json json = new Json();
		try {
			functionService.saveOrUpdate(systemFunction);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void delete() throws Exception {
		Json json = new Json();
		try {
			functionService.deleteFunction(id);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void deleteByIds() throws Exception {
		Json json = new Json();
		try {
			functionService.deleteByIds(ids);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void complete() throws Exception {
		Json json = new Json();
		try {
			functionService.complete(ids);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void cancel() throws Exception {
		Json json = new Json();
		try {
			functionService.cancel(ids);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	// setter or getter
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<SystemFunction> getList() {
		return list;
	}

	public void setList(List<SystemFunction> list) {
		this.list = list;
	}

	public String getFunctionContent() {
		return functionContent;
	}

	public void setFunctionContent(String functionContent) {
		this.functionContent = functionContent;
	}

	public SystemFunction getSystemFunction() {
		return systemFunction;
	}

	public void setSystemFunction(SystemFunction systemFunction) {
		this.systemFunction = systemFunction;
	}

	public Boolean getIndex() {
		return index;
	}

	public void setIndex(Boolean index) {
		this.index = index;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}
}