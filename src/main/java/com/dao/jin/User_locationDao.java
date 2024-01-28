package com.dao.jin;

import java.util.List;

import com.dao.MyDao;
import com.dto.jin.LocationDto;
import com.dto.jin.User_locationDto;

@MyDao
public interface User_locationDao {

	public int insert(User_locationDto user_locationdto);
}
