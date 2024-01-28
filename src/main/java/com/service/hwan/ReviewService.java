package com.service.hwan;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dto.hwan.RestReviewDto;

@Service
public interface ReviewService {  // 컨트롤러로
	public int insertReview(RestReviewDto dto);
	public int updateReview(RestReviewDto dto);
	public int deleteReview(RestReviewDto dto);
	public RestReviewDto readDetailReview(int review_no);
	public RestReviewDto updateViewReview(int review_no);
	
	public List<RestReviewDto> readAllReview();
	
}
