package com.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Constants;
import com.web.service.IEhcacheService;
import com.web.service.IMemcacheService;

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
	
	private String ehcache;
	private String memcache;
	
	@Resource
	private IEhcacheService ehcacheService;
	
	@Resource
	private IMemcacheService memcacheService;
	
	@Override
	public String execute() throws Exception {
		if(!ehcacheService.contains(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST)){
			ehcacheService.setValue(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST, "测试ehcache");
		}
		ehcache = ehcacheService.getValue(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST).toString();
		
		if(!memcacheService.contains(Constants.MEMCACHE_KEY_TEST)){
			memcacheService.setValue(Constants.MEMCACHE_KEY_TEST, "测试memcache");
		}
		memcache = memcacheService.getValue(Constants.MEMCACHE_KEY_TEST).toString();
		return "cache";
	}

	public String getEhcache() {
		return ehcache;
	}

	public void setEhcache(String ehcache) {
		this.ehcache = ehcache;
	}

	public String getMemcache() {
		return memcache;
	}

	public void setMemcache(String memcache) {
		this.memcache = memcache;
	}
}