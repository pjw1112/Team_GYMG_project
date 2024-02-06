package com.service.moon;

import java.util.List;

import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.dto.moon.StepDto;

public interface RecipeService {
	
	public int insertRecipe(RecipeVoDto recipeVoDto);
	
	public int insertRecipeStep(RecipeVoDto recipeVoDto);
	
	public int insertRecipeIngredient(RecipeVoDto recipeVoDto);
	
	public List<RecipeVoDto> recipeAll(RecipeVoDto recipeVoDto);
	
	public List<RecipeVoDto> recipeStep(RecipeVoDto recipeVoDto);
	
	public List<RecipeVoDto> recipeIngredient(RecipeVoDto recipeVoDto);
}
