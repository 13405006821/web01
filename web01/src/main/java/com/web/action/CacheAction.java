package com.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Constants;
import com.web.service.ICacheService;

/**
 * 缓存 action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "cache", results = {
		@Result(name = "cache", location = "/pages/cache/cache.jsp"),
})
public class CacheAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private String cache;
	
	@Resource
	private ICacheService cacheService;
	
	@Override
	public String execute() throws Exception {
		if(!cacheService.contains(Constants.CACHE_TEST, Constants.CACHE_TEST_KEY)){
			cacheService.setValue(Constants.CACHE_TEST, Constants.CACHE_TEST_KEY, "测试测试四川省城市测试测试测试车测试陈思成");
		}
		cache = cacheService.getValue(Constants.CACHE_TEST, Constants.CACHE_TEST_KEY).toString();
		return "cache";
	}

	public String getCache() {
		return cache;
	}

	public void setCache(String cache) {
		this.cache = cache;
	}
}