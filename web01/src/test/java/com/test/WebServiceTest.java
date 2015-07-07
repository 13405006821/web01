package com.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.service.IFunctionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-hibernate.xml", "classpath:spring.xml"})
public class WebServiceTest extends AbstractJUnit4SpringContextTests{

	@Resource
	private IFunctionService functionService;
	
	@Test
	public void test(){
		System.out.println("===123456");
	}
}