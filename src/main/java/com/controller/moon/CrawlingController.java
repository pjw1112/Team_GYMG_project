package com.controller.moon;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.util.CrawlingRecipe;
import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.service.moon.RecipeService;

@Controller
public class CrawlingController {
	
	@Autowired
	RecipeService service;
	
	 @RequestMapping(value = "/goCrawling.moon", method = RequestMethod.GET)
	    public String goCrawling(Model model, RecipeVoDto recipeVoDto) {
		 	CrawlingRecipe recipe = new CrawlingRecipe();
		 	recipe.Crawling(recipeVoDto);
		 	
			return null;
	    }

	
	
}
