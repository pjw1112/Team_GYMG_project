package com.service.moon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.moon.RecipeDao;
import com.dto.moon.RecipeDto;

@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	RecipeDao dao;

	@Override
	public int insertRecipe(RecipeDto recipeDto) {
		return dao.insertRecipe(recipeDto);
	}
	

}
