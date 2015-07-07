package com.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.base.dao.impl.BaseDaoImpl;
import com.web.dao.IFunctionDao;
import com.web.entity.SystemFunction;

@SuppressWarnings("unchecked")
@Repository("functionDao")
public class FunctionDaoImpl extends BaseDaoImpl<SystemFunction> implements IFunctionDao {

}
