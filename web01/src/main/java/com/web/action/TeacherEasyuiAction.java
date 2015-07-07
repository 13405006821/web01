package com.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Json;
import com.web.entity.Teacher;
import com.web.service.ITeacherService;

/**
 * 老师 easyui action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "teacherEasyui", results = {
		@Result(name = "teacher", location = "/pages/teacherEasyui/base/teacher.jsp"),
})
public class TeacherEasyuiAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String name;
	private String ids;
	private Teacher teacher;
	private List<Teacher> list = new ArrayList<Teacher>();
	
	@Resource
	private ITeacherService teacherService;
	
	@Override
	public String execute() throws Exception {
		return "teacher";
	}
	
	public void table(){
		list = teacherService.findList(name, getStartIndex(), getPageSize());
	}

	public String teacherInfo() throws Exception {
		return "teacher_info";
	}
	
	public void saveOrUpdate() throws Exception {
		Json json = new Json();
		try {
			teacherService.saveOrUpdate(teacher);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void delete() throws Exception {
		Json json = new Json();
		try {
			teacherService.deleteTeacher(id);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void deleteByIds() throws Exception {
		Json json = new Json();
		try {
			teacherService.deleteByIds(ids);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}

	// setter or getter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Teacher> getList() {
		return list;
	}

	public void setList(List<Teacher> list) {
		this.list = list;
	}

	public ITeacherService getTeacherService() {
		return teacherService;
	}

	public void setTeacherService(ITeacherService teacherService) {
		this.teacherService = teacherService;
	}
}