package com.controller.ye;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.TestDao;
import com.dto.ye.MenuDto;
import com.dto.ye.RestBizDto;
import com.dto.ye.RestInfoDto;
import com.service.ye.RestService;

@Controller("ye-controller")
public class FrontController {
   
   @Autowired
   TestDao testDao;
   
   @Autowired
   RestService service;
   
   @RequestMapping("/GoToTestPage.ye")
   public String Test(Model model) {
      
      model.addAttribute("time", testDao.readTime());
      return "/testPages/test-ye.jsp";
   }
   
   // 사용자 
   @RequestMapping(value="/index.ye", method=RequestMethod.GET)
   public String main(Model model) {
	   model.addAttribute("locList",service.mainLocRecList());
	   model.addAttribute("likeList",service.mainLikeRecList());
	   model.addAttribute("ctgList",service.readCtg());
	   return "/yeeunPages/index.jsp";
   }
   
   @RequestMapping(value="/detail.ye",method=RequestMethod.GET)
   public String detail(int rest_no, Model model) {
      model.addAttribute("list",service.readRest(rest_no));
      return "/yeeunPages/restaurantDetail.jsp";
   }
   
   @RequestMapping(value="/searchResult.ye",method=RequestMethod.GET)
   public String searchResult(
	        @RequestParam(name = "ctg_no", required = false) List<Integer> ctgNos,
	        @RequestParam(name = "searchKey", required = false) String searchKey,
	        Model model) {
	   
	   
	   
	   // ctgNos만 있음 
	    if (ctgNos != null && !ctgNos.isEmpty() && searchKey == null  || searchKey.isEmpty()) {
	        service.searchResult(null, ctgNos, model);
	    }

	    // searchKey만 있음 
	    if (searchKey != null && !searchKey.isEmpty() && ctgNos == null  || ctgNos.isEmpty()) {
	    	 service.searchResult(searchKey, null,  model);
	    }
	    
	    // 둘다 있음
	    if(ctgNos != null && !ctgNos.isEmpty() && searchKey != null && !searchKey.isEmpty()) {
	    	service.searchResult(searchKey, ctgNos, model);
	    }
	  
	   
	   model.addAttribute("ctgList", service.readCtg());
      return "/yeeunPages/searchResult.jsp";
   }
   
   
   // 관리자
   @RequestMapping(value="/adminRestList.ye",method=RequestMethod.GET)
   public String adminRestList(Model model) {
      model.addAttribute("list",service.listRestInfo());
      return "/yeeunPages/adminRestList.jsp";
   }
   
   @RequestMapping(value="/adminRestWrite.ye",method=RequestMethod.GET)
   public String adminRestWriteView() {
      return "/yeeunPages/adminRestWrite.jsp";
   }
   
   @RequestMapping(value="/adminRestWrite.ye",method=RequestMethod.POST)
   public String adminRestWrite(@ModelAttribute RestInfoDto infoDto, @RequestParam Map<String, String> param) {
	  
	  ArrayList<RestBizDto> bizList = new ArrayList<RestBizDto>();
	  ArrayList<MenuDto> menuList = new ArrayList<MenuDto>();
	  
	  for(int i = 1; i<8; i++) {
		  RestBizDto dto = new RestBizDto();
		  dto.setBiz_open(param.get("biz_open"+i));
		  dto.setBiz_close(param.get("biz_close"+i));
		  dto.setBiz_off(param.get("biz_off"+i)==null?0:1);
		  bizList.add(dto);
	  }

	  for(int i = 1; i<Integer.parseInt(param.get("menuSize"))+1; i++) {
		  MenuDto dto = new MenuDto();
		  dto.setMenu_name(param.get("menu_name"+i));
		  dto.setMenu_price(Integer.parseInt(param.get("menu_price"+i)));
		  menuList.add(dto);
	  }
	  
	  service.insertRest(infoDto, bizList, menuList);
      return "redirect:/adminRestList.ye";
   }
   
   @RequestMapping(value="/adminRestEdit.ye",method=RequestMethod.GET)
   public String adminRestEditView(int rest_no, Model model) {
      model.addAttribute("list",service.readRest(rest_no));
      return "/yeeunPages/adminRestEdit.jsp";
   }
   
   @RequestMapping(value="/adminRestEdit.ye",method=RequestMethod.POST)
   public String adminRestEdit(RestInfoDto infoDto, @RequestParam Map<String,String> param) {
	   
	   ArrayList<RestBizDto> bizList = new ArrayList<RestBizDto>();
		  ArrayList<MenuDto> menuList = new ArrayList<MenuDto>();
		  
		  for(int i = 1; i<8; i++) {
			  RestBizDto dto = new RestBizDto();
			  dto.setBiz_open(param.get("biz_open"+i));
			  dto.setBiz_close(param.get("biz_close"+i));
			  dto.setBiz_off(param.get("biz_off"+i)==null?0:1);
			  bizList.add(dto);
		  }

		  for(int i = 1; i<Integer.parseInt(param.get("menuSize"))+1; i++) {
			  MenuDto dto = new MenuDto();
			  dto.setMenu_name(param.get("menu_name"+i));
			  dto.setMenu_price(Integer.parseInt(param.get("menu_price"+i)));
			  menuList.add(dto);
		  }
		  service.updateRest(infoDto, bizList, menuList);
	      return "redirect:/adminRestEdit.ye?rest_no=" + Integer.parseInt(param.get("rest_no"));
	      
   }
   
   @RequestMapping(value="/adminRestDelete.ye",method=RequestMethod.GET)
   public String adminRestDeleteView(int rest_no) {
      return "/yeeunPages/adminRestDelete.jsp";
   }
   
   @RequestMapping(value="/adminRestDelete.ye",method=RequestMethod.POST)
   public String adminRestDelete(int rest_no, String pw) {
      service.deleteRest(rest_no, pw);
      return "redirect:/adminRestList.ye";
   }


}