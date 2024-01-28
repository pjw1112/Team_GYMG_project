package com.service.ye;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.dto.ye.MenuDto;
import com.dto.ye.RestBizDto;
import com.dto.ye.RestFileDto;
import com.dto.ye.RestInfoDto;

public interface RestService {
	/* list */
	public List<RestInfoDto> listRestInfo();
	public List<RestInfoDto> mainLocRecList();
	public List<RestInfoDto> mainLikeRecList();
	public List<Map<String, Object>> readCtg();
	public void searchResult(String searchKey, List<Integer> ctgNos, Model model);
	
	/* readOne */
	public List<Object> readRest(int restNo); // test
	
	/* insert */
	public int insertRest(RestInfoDto infoDto, ArrayList<RestBizDto> bizList, ArrayList<MenuDto> menuList);
	
	/* update */
	public int updateRest(RestInfoDto infoDto, ArrayList<RestBizDto> bizList, ArrayList<MenuDto> menuList);

	/* delete */
	public int deleteRest(int restNo, String pw); // test
}
