package com.web.service.impl;

import javax.annotation.Resource;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.springframework.stereotype.Service;

import com.web.service.ICacheService;

@Service("cacheService")
public class CacheServiceImpl implements ICacheService {
	
	@Resource
	private CacheManager cacheManager;
	
	private Cache getCache(String cacheName){
		return cacheManager.getCache(cacheName);
	}

	@Override
	public boolean isCacheContainKey(String cacheName, String cacheKey) {
		Cache cache = getCache(cacheName);
		Element element = cache.get(cacheKey);
		if (element == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void setCacheContainKey(String cacheName, String cacheKey, Object cacheValue) {
		Cache cache = getCache(cacheName);
		Element element = new Element(cacheKey, cacheValue);
		cache.put(element);
	}

	@Override
	public Object getCacheContainKey(String cacheName, String cacheKey) {
		Cache cache = getCache(cacheName);
		Element element = cache.get(cacheKey);
		return element.getValue();
	}
}