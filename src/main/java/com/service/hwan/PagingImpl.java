package com.service.hwan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.hwan.RestReviewDao;
import com.dto.hwan.PagingDto2;


@Service
public class PagingImpl {
	@Autowired RestReviewDao dao;
	
	@Autowired PagingDto2 dto;


	
}
