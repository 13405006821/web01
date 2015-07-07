package com.base.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.text.MessageFormat;
import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.base.dao.IBaseDao;

public class BaseDaoImpl<T> implements IBaseDao<T> {

	public final Class<T> modelClass;

	public final String HQL_QUERY;

	public final String HQL_COUNT;

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		super();
		modelClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
		HQL_QUERY = "from " + modelClass.getSimpleName()
				+ " t where 1 = 1 {0} ";
		HQL_COUNT = "select cast(count(*) as int) from "
				+ modelClass.getSimpleName() + " t where 1 = 1 {0} ";
	}

	@SuppressWarnings("unchecked")
	public T load(Long id) {
		return (T) getCurrentSession().get(modelClass, id);
	}

	@SuppressWarnings("unchecked")
	public T load(int id) {
		return (T) getCurrentSession().get(modelClass, id);
	}

	@SuppressWarnings("unchecked")
	public T load(String id) {
		return (T) getCurrentSession().get(modelClass, id);
	}

	public T save(T obj) {
		getCurrentSession().save(obj);
		return obj;
	}
	
	public T updateClear(T obj) {
		getCurrentSession().clear();
		getCurrentSession().update(obj);
		return obj;
	}
	
	public T updatef(T obj) {
		getCurrentSession().clear();
		getCurrentSession().update(obj);
		getCurrentSession().flush();
		return obj;
	}

	public T update(T obj) {
		getCurrentSession().update(obj);
		return obj;
	}

	public T saveOrUpdate(T obj) {
		getCurrentSession().saveOrUpdate(obj);
		return obj;
	}

	public void delete(T obj) {
		getCurrentSession().delete(obj);
	}

	public void delete(int id) {
		delete(load(id));
	}

	public void delete(Long id) {
		delete(load(id));
	}

	@SuppressWarnings("unchecked")
	public List<T> query(String hql) {
		return getCurrentSession().createQuery(
				MessageFormat.format(HQL_QUERY, hql)).list();
	}

	@SuppressWarnings("unchecked")
	public List<T> query(String hql, int start, int length) {
		Query query = getCurrentSession().createQuery(
				MessageFormat.format(HQL_QUERY, hql));
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	// add by jwl str
	public List<?> queryBySql(String sql, int start, int length, Class<?> entity, List<Object> param) {
		Query query = getCurrentSession().createSQLQuery(sql)
				.setResultTransformer(Transformers.aliasToBean(entity));
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryBySql(String sql, int start, int length) {
		Query query = getCurrentSession().createSQLQuery(sql);
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	public List<?> queryBySql(String sql, Class<?> entity) {
		Query query = getCurrentSession().createSQLQuery(sql)
				.setResultTransformer(Transformers.aliasToBean(entity));
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public List<T> queryBySql(String sql) {
		Query query = getCurrentSession().createSQLQuery(sql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql, Object[] param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter("" + i + "", param[i]);
			}
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql, List<Object> param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter("" + i + "", param.get(i));
			}
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql, int start, int length) {
		Query query = this.getCurrentSession().createQuery(hql);
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql, Object[] param, int start, int length) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter("" + i + "", param[i]);
			}
		}
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryFind(String hql, List<Object> param, int start,
			int length) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter("" + i + "", param.get(i));
			}
		}
		query.setFirstResult(start - 1);
		query.setMaxResults(length);
		return query.list();
	}

	public Long count(String hql) {
		// 封装单一数字返回值
		return ((Number) getCurrentSession().createQuery(
				MessageFormat.format(HQL_COUNT, hql)).uniqueResult())
				.longValue();
	}

	public int countInt(String hql) {
		// 封装单一数字返回值
		return ((Number) getCurrentSession().createQuery(
				MessageFormat.format(HQL_COUNT, hql)).uniqueResult())
				.intValue();
	}

	@Override
	public Long countBySql(String sql, List<Object> param) {
		Query query = getCurrentSession().createSQLQuery(sql);
		
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		
		return 	((Number) query.uniqueResult()).longValue();
	}

	@Override
	public Long countBySql(String sql) {
		Query query = getCurrentSession().createSQLQuery(sql);
		return 	((Number) query.uniqueResult()).longValue();
	}
	
	
	@Override
	public Long count(String hql, Object[] param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter("" + i + "", param[i]);
			}
		}
		return ((Number) query.uniqueResult()).longValue();
	}

	@Override
	public Long count(String hql, List<Object> param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter("" + i + "", param.get(i));
			}
		}
		return ((Number) query.uniqueResult()).longValue();
	}

	public T refresh(T obj) {
		getCurrentSession().flush();
		getCurrentSession().refresh(obj);
		return obj;
	}

	public void clearSession() {
		getCurrentSession().flush();
		getCurrentSession().clear();
	}

	@Override
	public int executeHql(String hql) {
		this.getCurrentSession().flush();
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}

	@Override
	public int executeHql(String hql, Object[] param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter("" + i + "", param[i]);
			}
		}
		return query.executeUpdate();
	}

	@Override
	public int executeHql(String hql, List<Object> param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter("" + i + "", param.get(i));
			}
		}
		return query.executeUpdate();
	}

	@Override
	public int executeSql(String sql) {
		this.getCurrentSession().flush();
		return this.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}

	@Override
	public void merge(T o) {
		this.getCurrentSession().merge(o);
	}

	@Override
	public void batchUpdates(List<T> lists) {
		Session session = this.getCurrentSession();
		for(int i=0;i<lists.size();i++){
			session.merge(lists.get(i));
			if(i % 20 == 0){
				session.flush();
				session.clear();
			}
		}
	}
	
	
	/***** use with ConditionBuilder ,it's more easy *****/
	protected Query setParams(Query query, List<?> params) {
		if (params != null) {
			for (int i = 0; i < params.size(); ++i) {
				if (params.get(i) instanceof Collection) {
					query.setParameterList("p" + (i + 1),
							(Collection<?>) params.get(i));
				} else {
					query.setParameter("p" + (i + 1), params.get(i));
				}
			}
		}

		return query;
	}
	
	protected Query setStart(Query query, int start) {
		if (start >= 0) {
			query.setFirstResult(start);
		}

		return query;
	}
	
	protected Query setLength(Query query, int length) {
		if (length > 0) {
			query.setMaxResults(length);
		}

		return query;
	}
	

	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<T> find(String condition, List<?> params) {
		Query query = getCurrentSession().createQuery(
				MessageFormat.format(HQL_QUERY, condition));
		return setParams(query, params).list();
	}

	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<T> find(String condition, int start, int length) {
		Query query = getCurrentSession().createQuery(
				MessageFormat.format(HQL_QUERY, condition));
		setStart(query, start);
		setLength(query, length);

		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public List<T> find(String condition, List<?> params, int start, int length) {
		Query query = getCurrentSession().createQuery(
				MessageFormat.format(HQL_QUERY, condition));
		setParams(query, params);
		setStart(query, start);
		setLength(query, length);
		return query.list();
	}
	/***** use with ConditionBuilder ,it's more easy *****/
}