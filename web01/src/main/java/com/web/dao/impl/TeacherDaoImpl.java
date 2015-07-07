package com.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.base.dao.impl.BaseDaoImpl;
import com.web.dao.ITeacherDao;
import com.web.entity.Teacher;

@SuppressWarnings("unchecked")
@Repository("teacherDao")
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements ITeacherDao {

}
