package com.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Constants;
import com.web.service.IEhcacheService;

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
	
	@Resource
	private IEhcacheService ehcacheService;
	
	@Override
	public String execute() throws Exception {
		if(!ehcacheService.contains(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST)){
			ehcacheService.setValue(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST, "测试ehcache");
		}
		ehcache = ehcacheService.getValue(Constants.EHCACHE_TEST, Constants.EHCACHE_TEST_KEY_TEST).toString();
		return "cache";
	}

	public String getEhcache() {
		return ehcache;
	}

	public void setEhcache(String ehcache) {
		this.ehcache = ehcache;
	}
}