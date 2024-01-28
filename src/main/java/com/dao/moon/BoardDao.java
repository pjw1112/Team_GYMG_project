package com.dao.moon;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dao.MyDao;
import com.dto.moon.BoardDto;
import com.dto.moon.BoardLikeDto;
import com.dto.moon.BoardReplyDto;
import com.dto.moon.BoardResultDto;


@MyDao
public interface BoardDao {
	
	/*
	public List<BoardDto> readAllBoard(int ctg_no);
	public List<BoardDto> readTitleBoard(Map<String, Object> para);
	public List<BoardDto> readNickBoard(Map<String, Object> para);
	public List<BoardDto> readContentBoard(Map<String, Object> para);
	
	public int updateBoardLike(BoardDto bdto);
	public int updateBoardLikeCancle(BoardDto bdto);
	*/
	
	public List<BoardDto> noticeList(int ctg_no);
	
	public int listCnt(Map<String, Object> map);
	public List<BoardDto> boardList(Map<String, Object> map);

	public int insertBoard(BoardDto bdto);
	
	public BoardDto readOneBoard(BoardResultDto boardResultDto);
	public int updateBoardHit(BoardResultDto boardResultDto);
	
	public int updateBoard(BoardResultDto boardResultDto);

	public int deleteBoard(BoardResultDto boardResultDto);
	
	public int insertBoardReply(BoardReplyDto boardReplyDto);
	
	public int readReplyCnt(Map<String, Object> map);
	
	public List<BoardReplyDto> readAllReply(Map<String, Object> map);
	
	public int deleteBoareReply(BoardReplyDto boardReplyDto);
	
	public int boardLikeCnt(BoardLikeDto boardLikeDto);
	
	public int boardLikeCheck(BoardLikeDto boardLikeDto);
	
	public int boardUnLike(BoardLikeDto boardLikeDto);
	
	public int boardLike(BoardLikeDto boardLikeDto);
}
