package com.service.moon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.moon.RecipeDao;
import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.dto.moon.StepDto;

@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	RecipeDao dao;

	@Override
	public int insertRecipe(RecipeVoDto recipeVoDto) {
		return dao.insertRecipe(recipeVoDto);
	}

	@Override
	public int insertRecipeStep(RecipeVoDto recipeVoDto) {
		return dao.insertRecipeStep(recipeVoDto);
	}

	@Override
	public int insertRecipeIngredient(RecipeVoDto recipeVoDto) {
		return dao.insertRecipeIngredient(recipeVoDto);
	}

}
