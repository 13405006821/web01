package com.web.service;

import java.util.List;

import com.web.entity.SystemFunction;

public interface IFunctionService {

	List<SystemFunction> findList(String function, Boolean complete, int start, int length);

	void deleteFunction(Integer id);

	SystemFunction getById(Integer id);

	void saveOrUpdate(SystemFunction function);

	int findCount(String function, Boolean complete);

	void deleteByIds(String ids);

	void complete(String ids);

	void cancel(String ids);

}
