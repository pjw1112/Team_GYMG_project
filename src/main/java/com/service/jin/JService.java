package com.service.jin;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface JService {
	
	public int user_duplicateIdCheck(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
	public int user_Insert(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws UnknownHostException;
	
	public int VerifyMobileBySms(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public int user_login(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public int cookie_login(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public int find_id(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	public int update_pw(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	
}
