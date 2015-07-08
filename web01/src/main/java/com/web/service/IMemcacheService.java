package com.web.service;

/**
 * 缓存service接口
 * @author Liup
 */
public interface IMemcacheService {
	
	/**
	 * cache是否包含对应key
	 * @param cacheKey
	 * @return
	 */
	boolean contains(String cacheKey) throws Exception ;
	
	/**
	 * cache给对应key设置值
	 * @param cacheKey
	 * @return
	 */
	void setValue( String cacheKey, Object cacheValue) throws Exception ;

	/**
	 * 获取cache key对应值
	 * @param cacheKey
	 * @return
	 */
	Object getValue(String cacheKey) throws Exception ;
}
