package com.test;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dao.TestDao;
import com.dao.jin.UserDao;
import com.dto.jin.UserDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class Test_jinwoo {

	@Autowired
	ApplicationContext context;

	@Autowired
	TestDao testDao;

	@Autowired
	UserDao userDao;

	@Test
	@Ignore
	public void test_ApplicationContext() {
		System.err.println("ApplicationContext  : " + context);
	}

	@Test
	@Ignore
	public void test_TestDao() {
		System.err.println("testDao : " + testDao.readTime());
	}

	@Test @Ignore
	public void test_UserDao() throws UnknownHostException {
		UserDto dto = new UserDto();
		dto.setUser_id("user1");
		dto.setJoin_type_no(1);
		dto.setType_no(1);
		dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
		dto.setUser_name("진");
		dto.setUser_nick("dn");
		dto.setUser_phone("01028038894");
		dto.setUser_pw("1234");

		System.err.println("##########"+userDao.insert(dto));
		
	}
	
	@Test @Ignore
	public void test7() {
		Map<String, Object> item = new HashMap<String, Object>();
		item.put("item", "jinwoo");
		
		System.out.println( (String)item.get("item"));
	}
	
	@Test
	public void test8() {
		
		String[] locationList = { "서초구", "강남구", "종로구", "중구", "용산구", "성동구", "중랑구", "성북구", "도봉구", "노원구", "은평구",
				"서대문구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "광진구", "동대문구", "마포구", "양천구", "강동구" };

		String location = "서초구, 종로구, 중구";
		
		
		String[] locationArray = location.split(", ");
		System.out.println("......location_before : " + locationArray.toString());
		for (int i = 0; i < locationArray.length; i++) {
			for (int j = 0; j < locationList.length; j++) {
				if (locationArray[i].equals(locationList[j])) {
					locationArray[i] = "" + (j + 1);
				}
			}
		}

		System.out.println("......location_after : " + locationArray.toString());

		for (int i = 0; i < locationArray.length; i++) {
			
			System.out.println("locationArray["+i+"] : "+locationArray[i]); 
		}
		
		
		
	}
	
	
	
	
	

}
