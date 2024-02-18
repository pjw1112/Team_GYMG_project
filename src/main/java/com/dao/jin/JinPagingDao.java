package com.dao.jin;

import java.util.List;
import java.util.Map;

import com.dao.MyDao;
import com.dto.moon.BoardDto;
import com.dto.moon.BoardReplyDto;
import com.dto.moon.ReviewDto;

@MyDao
public interface JinPagingDao {

	public List<BoardDto> listCnt(Map<String, Integer> para);
	public int listtotal(int user_no);
	public int listLike(int board_no);
	
	public List<BoardReplyDto> replylistCnt(Map<String, Integer> para);
	public int replylisttotal(int user_no);
	
	public List<ReviewDto> reviewlistCnt(Map<String, Integer> para);
	public int reviewlisttotal(int user_no);
	
	
	
}
