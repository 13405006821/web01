package com.web.service;

import java.util.List;

import com.web.entity.Teacher;

public interface ITeacherService {

	List<Teacher> findList(String name, int start, int length);

	void deleteTeacher(Integer id);

	Teacher getById(Integer id);

	void saveOrUpdate(Teacher teacher);

	void deleteByIds(String ids);

	int findCount(String name);

}
