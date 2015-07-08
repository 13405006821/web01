package com.web.service;

/**
 * 缓存service接口
 * @author Liup
 */
public interface ICacheService {
	
	/**
	 * cache是否包含对应key
	 * @param cacheName
	 * @param cacheKey
	 * @return
	 */
	boolean contains(String cacheName, String cacheKey);
	
	/**
	 * cache给对应key设置值
	 * @param cacheName
	 * @param cacheKey
	 * @return
	 */
	void setValue(String cacheName, String cacheKey, Object cacheValue);

	/**
	 * 获取cache key对应值
	 * @param cacheName
	 * @param cacheKey
	 * @return
	 */
	Object getValue(String cacheName, String cacheKey);
}
