package com.service.hwan;

import java.util.List;
import java.util.Map;

import com.dto.hwan.PagingDto2;
import com.dto.hwan.RestReviewDto;

public interface PagingService {
	//list 가져오거
	public List<RestReviewDto> reviewCnt(Map<String , Integer> para);
	
	//paging
	public PagingDto2 paging(int pstartno);
}
