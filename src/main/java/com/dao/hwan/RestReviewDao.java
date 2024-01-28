package com.dao.hwan;

import java.util.List;
import java.util.Map;



import com.dao.MyDao;
import com.dto.hwan.RestReviewDto;

@MyDao
public interface RestReviewDao {
	public int deleteReview(RestReviewDto dto);
	public RestReviewDto read(int review_no);
	public List<RestReviewDto> readAllReview();
	public List<RestReviewDto> reviewCnt(Map<String, Integer> para);
	public int listtotal();
	
	
	
	
	
	
	
	
	 public int insertReview(RestReviewDto dto); public int
	 updateReview(RestReviewDto dto); public int updateReview_hit(RestReviewDto
	  dto);
	  
	  public RestReviewDto userread(int user_no); public List<RestReviewDto>
	  userreadAll(int user_no);
	  
	  
	  public RestReviewDto restread(int rest_no); public List<RestReviewDto>
	  restreadAll(int rest_no);
	 
	
	
	
	
	
	
	
}
