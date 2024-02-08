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

import com.dto.moon.RecipeDto;
import com.dto.moon.RecipeVoDto;
import com.service.moon.RecipeService;

@Controller
public class CrawlingController {
	
	@Autowired
	RecipeService service;
	
	 @RequestMapping(value = "/goCrawling.moon", method = RequestMethod.GET)
	    public String goCrawling(Model model, RecipeVoDto recipeVoDto) {
	        String baseUrl = "https://www.10000recipe.com";
	        int i = 1;
	        int j = 1;
	        
	        try {
	        	Document doc = Jsoup.connect(baseUrl + "/index.html").get();
	            
	            //베스트 레시피 10개 목록
	            Elements elements = doc.select(".common_sp_list_li .common_sp_thumb a");

	            for (Element element : elements) {
	                String relativeHref = element.attr("href");
	                String completeUrl = makeAbsoluteUrl(baseUrl, relativeHref);

	                try {
	                	//목록 10개의 url 링크 주소
	                    Document subDoc = Jsoup.connect(completeUrl).get();
	                    Elements imgElements = subDoc.select(".centeredcrop img");
	                    Elements titleElements = subDoc.select(".view2_summary h3");
	                    Elements servElements = subDoc.select(".view2_summary_info .view2_summary_info1");
	                    Elements hourElements = subDoc.select(".view2_summary_info .view2_summary_info2");
	                    Elements levelElements = subDoc.select(".view2_summary_info .view2_summary_info3");
	                    Elements steps = subDoc.select(".view_step .view_step_cont");
	                    Elements ingredients = subDoc.select("div.cont_ingre2 div.ready_ingre3 ul:not(.case1) li");
	                    
	                    //
//	                    for (Element imgElement : imgElements) {
//	                        String imageUrl = imgElement.attr("src");
//	                        String title = titleElements.text();
//	                        String serv = servElements.text();
//	                        String hour = hourElements.text();
//	                        String level = levelElements.text();
//	                        
//	                        recipeVoDto.setImg_url(imageUrl);
//	                        recipeVoDto.setTitle(title);
//	                        recipeVoDto.setServings(serv);
//	                        recipeVoDto.setCooking_time(hour);
//	                        recipeVoDto.setDifficulty(level);
//	                        model.addAttribute("recipeVoDto", service.insertRecipe(recipeVoDto));
//	                    }
	                    
//	                    for(Element step : steps) {
//	                    	String step_html = step.html();
//	                    	recipeVoDto.setRecipe_id(i);
//	                    	recipeVoDto.setInstruction(step_html);
//	                    	model.addAttribute("recipeStep", service.insertRecipeStep(recipeVoDto));
//	                    }
//	                    i++;
	                    
	                    for (Element ingredient : ingredients) {
	                        String text = ingredient.text();

	                        int endIndex = text.indexOf("구매");
	                        String name = text.substring(0, endIndex);

	                        String quantity = ingredient.select("span.ingre_unit").text();

	                        recipeVoDto.setRecipe_id(j);
	                        recipeVoDto.setIngredient_name(name);
	                        recipeVoDto.setIngredient_amount(quantity);
	                        model.addAttribute("recipeIngredient", service.insertRecipeIngredient(recipeVoDto));
	                        
	                     }
	                     j++;
	                    
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return "crawling";
	    }

	
	private String makeAbsoluteUrl(String baseUrl, String relativeHref) {
        try {
            URL base = new URL(baseUrl);
            URL absolute = new URL(base, relativeHref);
            return absolute.toString();
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return null;
        }
    }
	
}
