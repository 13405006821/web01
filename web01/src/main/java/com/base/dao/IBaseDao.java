package com.base.dao;

import java.util.List;

public interface IBaseDao<T> {
	/**
	 * 根据Id一个对象
	 * 
	 * @param Long
	 * @return
	 */
	public T load(Long id);

	public T load(int id);

	public T load(String id);

	/**
	 * 添加一个对象
	 * 
	 * @param obj
	 * @return
	 */
	public T save(T obj);

	public void merge(T o);

	/**
	 * 更新一个对象
	 * 
	 * @param obj
	 * @return
	 */
	public T updatef(T obj);

	public T updateClear(T obj);

	public T update(T obj);

	/**
	 * 新增或更新一个对象
	 * 
	 * @param obj
	 * @return
	 */
	public T saveOrUpdate(T obj);

	/**
	 * 新增或更新一个对象
	 * 
	 * @param obj
	 * @return
	 */
	public void delete(T obj);

	/**
	 * 新增或更新一个对象(根据Id删除)
	 * 
	 * @param Long
	 * @return
	 */
	public void delete(Long id);

	/**
	 * 根据Id删除
	 * 
	 * @param int
	 * @return
	 */
	public void delete(int id);

	/**
	 * 执行hql查询
	 * 
	 * @param String
	 * @return
	 */
	public List<T> query(String hql);

	/**
	 * 执行hql查询(分页)
	 * 
	 * @param String
	 * @param int 第几页
	 * @param int 每页显示个数
	 * @return
	 */
	public List<T> query(String hql, int start, int length);

	/**
	 * 执行SQL查询 + 分页
	 * 
	 * @param sql
	 * @param start
	 * @param length
	 * @param entity
	 * @param param
	 * @return
	 */
	public List<?> queryBySql(String sql, int start, int length,
			Class<?> entity, List<Object> param);

	/**
	 * 执行sql查询(分页)
	 * 
	 * @param sql
	 * @param start
	 * @param length
	 * @return
	 */
	public List<T> queryBySql(String sql, int start, int length);

	/**
	 * 执行sql查询
	 * 
	 * @param sql
	 * @param entity
	 *            Model
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List queryBySql(String sql, Class<?> entity);

	/**
	 * 执行sql查询
	 * 
	 * @param sql
	 * @return
	 */
	public List<T> queryBySql(String sql);

	/**
	 * 查询集合
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> queryFind(String hql, Object[] param);

	/**
	 * 查询集合
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> queryFind(String hql);

	/**
	 * 查询集合
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> queryFind(String hql, List<Object> param);

	/**
	 * 查询集合(带分页)
	 * 
	 * @param hql
	 * @param param
	 * @param start
	 *            查询第几页
	 * @param length
	 *            每页显示几条记录
	 * @return
	 */
	public List<T> queryFind(String hql, int start, int length);

	/**
	 * 查询集合(带分页)
	 * 
	 * @param hql
	 * @param param
	 * @param start
	 *            查询第几页
	 * @param length
	 *            每页显示几条记录
	 * @return
	 */
	public List<T> queryFind(String hql, Object[] param, int start, int length);

	/**
	 * 查询集合(带分页)
	 * 
	 * @param hql
	 * @param param
	 * @param start
	 * @param length
	 * @return
	 */
	public List<T> queryFind(String hql, List<Object> param, int start,
			int length);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @return
	 */
	public Long count(String hql);

	public int countInt(String hql);

	/**
	 * 
	 * SQL查询COUNT
	 * 
	 * @param sql
	 *            count(*) 语句
	 * @param param
	 *            List<Object> param : 用?作为占位符 sb.append(" AND sd.user_id = ?");
	 *            param.add(currentUserID);
	 * @return
	 */
	public Long countBySql(String sql, List<Object> param);

	/**
	 * SQL查询COUNT
	 * 
	 * @param sql
	 * @return
	 */
	public Long countBySql(String sql);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, Object[] param);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, List<Object> param);

	public T refresh(T obj);

	/**
	 * 清空缓存
	 */
	public void clearSession();

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @return 响应数目
	 */
	public int executeHql(String hql);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @param param
	 * @return 响应数目
	 */
	public int executeHql(String hql, Object[] param);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public int executeHql(String hql, List<Object> param);

	/**
	 * 执行SQL语句
	 * 
	 * @param sql
	 *            SQL语句
	 * @return 响应行数
	 */
	public int executeSql(String sql);

	/**
	 * 批量更新
	 * 
	 * @param List
	 *            lists
	 */
	public void batchUpdates(List<T> lists);

	/***** use with ConditionBuilder ,it's more easy *****/
	public List<T> find(String condition, List<?> params);

	public List<T> find(String condition, int start, int length);

	public List<T> find(String condition, List<?> params, int start, int length);
	/***** use with ConditionBuilder ,it's more easy *****/
}