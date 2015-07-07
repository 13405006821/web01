package com.web.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.web.dao.ITeacherDao;
import com.web.entity.Teacher;
import com.web.service.ITeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements ITeacherService {
	
	@Resource
	private ITeacherDao teacherDao;

	@Override
	public List<Teacher> findList(String name, int start, int length) {
		String hql = "";
		if(StringUtils.isNotBlank(name)){
			hql += " and name like '%" + name + "%' ";
		}
		return teacherDao.query(hql, start, length);
	}

	@Override
	public void deleteTeacher(Integer id) {
		teacherDao.delete(id);
	}

	@Override
	public Teacher getById(Integer id) {
		return teacherDao.load(id);
	}

	@Override
	public void saveOrUpdate(Teacher teacher) {
		if(teacher.getId() > 0){
			teacher.setUpdateTime(new Date());
			teacherDao.update(teacher);
		}else{
			teacherDao.save(teacher);
		}
	}

	@Override
	public void deleteByIds(String ids) {
		String[] idArr = ids.split(",");
		for(String id : idArr){
			teacherDao.delete(Integer.valueOf(id));
		}
	}

	@Override
	public int findCount(String name) {
		String hql = "";
		if(StringUtils.isNotBlank(name)){
			hql += " and name like '%" + name + "%' ";
		}
		return teacherDao.countInt(hql);
	}
}
