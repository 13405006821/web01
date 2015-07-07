package com.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.base.dao.impl.BaseDaoImpl;
import com.web.dao.IUserDao;
import com.web.entity.User;

@SuppressWarnings("unchecked")
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

}
