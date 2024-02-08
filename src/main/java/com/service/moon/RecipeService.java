package com.service.moon;

import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.dto.moon.StepDto;

public interface RecipeService {
	
	public int insertRecipe(RecipeVoDto recipeVoDto);
	
	public int insertRecipeStep(RecipeVoDto recipeVoDto);
	
	public int insertRecipeIngredient(RecipeVoDto recipeVoDto);
}
