package com.test;

import javax.annotation.Resource;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-hibernate.xml", "classpath:spring.xml" })
public class WebServiceTest extends AbstractJUnit4SpringContextTests {
	@Resource
	private CacheManager cacheManager;

	@Test
	public void test() {
		Cache testCache = cacheManager.getCache("testCache");
		Element element = testCache.get("key");
		for (int i = 0; i < 10; i++) {
			if (element == null) {
				element = new Element("key", "asdadadaddadadad");
				testCache.put(element);
				System.out.println("无法从缓存中取到");
			} else {
				String val = (String) element.getValue();
				System.out.println(val);
				System.out.println("从缓存中取到");
			}
		}
	}
}