package com.service.hwan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.hwan.RestReviewDao;
import com.dto.hwan.RestReviewDto;


@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired RestReviewDao dao;

	@Override
	public int insertReview(RestReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.insertReview(dto);
	}

	@Override
	public int updateReview(RestReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.updateReview(dto);
	}

	@Override
	public int deleteReview(RestReviewDto dto) {
		// TODO Auto-generated method stub
		return dao.deleteReview(dto);
	}

	@Override
	public RestReviewDto readDetailReview(int review_no) {
		
		return dao.read(review_no);
	}

	@Override
	public RestReviewDto updateViewReview(int review_no) {
		// TODO Auto-generated method stub
		return dao.read(review_no);
	}

	@Override
	public List<RestReviewDto> readAllReview() {
		// TODO Auto-generated method stub
		return dao.readAllReview();
	}
	


}
