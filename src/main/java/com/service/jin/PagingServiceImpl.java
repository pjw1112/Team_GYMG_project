package com.service.jin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.jin.JinPagingDao;
import com.dto.jin.JinPagingDto;
import com.dto.moon.BoardDto;
import com.dto.moon.BoardReplyDto;
import com.dto.moon.ReviewDto;

@Service
public class PagingServiceImpl implements PagingService{

	@Autowired
	JinPagingDao dao;
	
	/*												*/
	/*												*/
	/*												*/
	
	@Override
	public List<BoardDto> listCnt(Map<String, Integer> para) {
		// TODO Auto-generated method stub
		return dao.listCnt(para);
	}

	@Override
	public JinPagingDto paging(int user_no, int pstartno) {
		// TODO Auto-generated method stub
		return new JinPagingDto(dao.listtotal(user_no), pstartno);
	}

	@Override
	public int listLike(int board_no) {
		// TODO Auto-generated method stub
		return dao.listLike(board_no);
	}

	/*												*/	
	/*												*/
	/*												*/
	
	@Override
	public List<BoardReplyDto> replylistCnt(Map<String, Integer> para) {
		// TODO Auto-generated method stub
		return dao.replylistCnt(para);
	}

	@Override
	public JinPagingDto replypaging(int user_no, int pstartno) {
		// TODO Auto-generated method stub
		return new JinPagingDto(dao.replylisttotal(user_no), pstartno);
	}

	/*												*/	
	/*												*/
	/*												*/
	
	@Override
	public List<ReviewDto> reviewlistCnt(Map<String, Integer> para) {
		// TODO Auto-generated method stub
		return dao.reviewlistCnt(para);
	}

	@Override
	public JinPagingDto reviewpaging(int user_no, int pstartno) {
		// TODO Auto-generated method stub
		return new JinPagingDto(dao.reviewlisttotal(user_no), pstartno);
	}
	
	
	
	
	
	
	
	
	

}
