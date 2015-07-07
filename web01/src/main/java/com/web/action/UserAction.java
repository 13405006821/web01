package com.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Json;
import com.web.entity.User;
import com.web.service.IUserService;

/**
 * 用户action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "user", results = {
		@Result(name = "user_list", location = "/pages/user/user_list.jsp"),
		@Result(name = "user_info", location = "/pages/user/user_info.jsp")
})
public class UserAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String username;
	private User user;
	private List<User> list = new ArrayList<User>();

	@Resource
	private IUserService userService;

	/**
	 * 查询用户列表
	 */
	@Override
	public String execute() throws Exception {
		list = userService.findList(username, getStartIndex(), getPageSize());
		setCount(userService.findCount(username));
		return "user_list";
	}

	/**
	 * 新增或者修改获取用户信息
	 */
	public String userInfo() throws Exception {
		if(id > 0){
			user = userService.getById(id);
		}
		return "user_info";
	}
	
	/**
	 * 保存或者更新用户信息
	 * @throws Exception
	 */
	public void saveOrUpdate() throws Exception {
		Json json = new Json();
		try {
			userService.saveOrUpdate(user);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	/**
	 * 删除用户信息
	 * @throws Exception
	 */
	public void delete() throws Exception {
		Json json = new Json();
		try {
			userService.deleteUser(id);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}

	// setter or getter
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
