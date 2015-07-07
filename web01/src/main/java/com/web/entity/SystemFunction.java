package com.web.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "t_system_function")
@DynamicUpdate(true)
public class SystemFunction implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "function_content")
	private String functionContent;

	private Boolean complete = false;

	private Integer sort = 0;
	
	private Integer important;
	
	private String url;

	@Column(name = "create_time", insertable = false, updatable = false)
	private Date createTime;

	@Column(name = "complete_time")
	private Date completeTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFunctionContent() {
		return functionContent;
	}

	public void setFunctionContent(String functionContent) {
		this.functionContent = functionContent;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getImportant() {
		return important;
	}

	public void setImportant(Integer important) {
		this.important = important;
	}
}