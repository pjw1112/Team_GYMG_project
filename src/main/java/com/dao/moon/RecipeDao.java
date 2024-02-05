package com.dao.moon;

import com.dao.MyDao;
import com.dto.moon.RecipeDto;

@MyDao
public interface RecipeDao {
	public int insertRecipe(RecipeDto recipeDto);
	
}
