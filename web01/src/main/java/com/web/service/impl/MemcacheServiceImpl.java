package com.web.service.impl;

import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.base.util.MemcacheConfig;
import com.web.service.IMemcacheService;
import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;

@Service("memcacheService")
public class MemcacheServiceImpl implements IMemcacheService {
	
	private MemCachedClient memCachedClient = null;
	
	@Resource
	private MemcacheConfig config;
	
	@Override
	public boolean contains(String cacheKey) throws Exception {
		MemCachedClient cache = getCache();
		Object value = cache.get(cacheKey);
		if (value == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void setValue(String cacheKey, Object cacheValue) throws Exception {
		MemCachedClient cache = getCache();
		cache.set(cacheKey, cacheValue);
	}

	@Override
	public Object getValue(String cacheKey) throws Exception {
		MemCachedClient cache = getCache();
		return cache.get(cacheKey);
	}
	
	public MemCachedClient getCache() throws Exception {
		if (memCachedClient == null) {
			boolean result = initPoolAndClient();
			if (!result) {
				throw new Exception("Cache初始化错误!");
			}
		}
		return memCachedClient;
	}

	private synchronized boolean initPoolAndClient() {
		// 从cache-servers.properties中读取server列表
		Properties properties = new Properties();
		try {
			properties.load(MemcacheServiceImpl.class.getClassLoader()
					.getResourceAsStream("cache-servers.properties"));
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		if (properties.size() == 0) {
			return false;
		}
		String[] servers = new String[properties.size()];
		properties.keySet().toArray(servers);
		Integer[] weights = new Integer[servers.length];
		for (int i = 0; i < servers.length; i++) {
			weights[i] = Integer.valueOf(properties.getProperty(servers[i]));
		}

		// 初始化SockIOPool
		SockIOPool pool = SockIOPool.getInstance();
		pool.setServers(servers);
		pool.setWeights(weights);
		pool.setNagle(false);
		pool.setBufferSize(config.getBufferSize());
		pool.setMinConn(config.getMinConn());
		pool.setMaxConn(config.getMaxConn());
		pool.setMaxIdle(config.getMaxIdle());
		pool.setMaxBusyTime(config.getMaxBusyTime());
		pool.setSocketTO(config.getSocketTO());
		pool.setSocketConnectTO(config.getSocketConnectTO());
		pool.initialize();

		memCachedClient = new MemCachedClient(true);
		return true;
	}
}