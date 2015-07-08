package com.base.util;

public class MemcacheConfig {

	private Integer minConn;
	private Integer maxConn;
	private Long maxIdle;
	private Long maxBusyTime;
	private Integer socketTO;
	private Integer socketConnectTO;
	private Integer bufferSize;

	public Integer getMinConn() {
		return minConn;
	}

	public void setMinConn(Integer minConn) {
		this.minConn = minConn;
	}

	public Integer getMaxConn() {
		return maxConn;
	}

	public void setMaxConn(Integer maxConn) {
		this.maxConn = maxConn;
	}

	public Long getMaxIdle() {
		return maxIdle;
	}

	public void setMaxIdle(Long maxIdle) {
		this.maxIdle = maxIdle;
	}

	public Long getMaxBusyTime() {
		return maxBusyTime;
	}

	public void setMaxBusyTime(Long maxBusyTime) {
		this.maxBusyTime = maxBusyTime;
	}

	public Integer getSocketTO() {
		return socketTO;
	}

	public void setSocketTO(Integer socketTO) {
		this.socketTO = socketTO;
	}

	public Integer getSocketConnectTO() {
		return socketConnectTO;
	}

	public void setSocketConnectTO(Integer socketConnectTO) {
		this.socketConnectTO = socketConnectTO;
	}

	public Integer getBufferSize() {
		return bufferSize;
	}

	public void setBufferSize(Integer bufferSize) {
		this.bufferSize = bufferSize;
	}
}