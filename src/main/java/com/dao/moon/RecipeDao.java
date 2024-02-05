package com.dao.moon;

import com.dao.MyDao;
import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.dto.moon.StepDto;

@MyDao
public interface RecipeDao {
	public int insertRecipe(RecipeVoDto recipeVoDto);
	
	public int insertRecipeStep(RecipeVoDto recipeVoDto);
	
	public int insertRecipeIngredient(RecipeVoDto recipeVoDto);
	
}
