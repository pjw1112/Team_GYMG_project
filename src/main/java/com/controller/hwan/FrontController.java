package com.controller.hwan;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.TestDao;
import com.dto.hwan.RestReviewDto;
import com.service.hwan.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller("hwan-controller")
@Log4j
public class FrontController {
	
	@Autowired
	TestDao testDao;
	
	@RequestMapping("/GoToTestPage.hwan")
	public String Test(Model model) {
		
		model.addAttribute("time", testDao.readTime());
		return "/testPages/test-hwan.jsp";
	}
	
	@Autowired
	ReviewService service;


	@RequestMapping(value = "/likeres.jee", method = RequestMethod.GET)
	public String likeres() {
		log.info("............. likeres");
		return "/resreview/likeres"; /// WEB-INF/views/ + + .jsp

	}

	@RequestMapping(value = "/likewrite.jee", method = RequestMethod.GET)
	public String likewrite() {
		log.info("............. likewrite");
		return "/resreview/likewrite"; /// WEB-INF/views/ + + .jsp

	}

	@RequestMapping(value = "/postwrite.jee", method = RequestMethod.GET)
	public String postwrite() {
		log.info("............. postwrite");
		return "/resreview/postwrite"; /// WEB-INF/views/ + + .jsp

	}

	@RequestMapping(value = "/reviewstar.jee", method = RequestMethod.GET)
	public String reviewstar() {
		log.info("............. reviewstar");
		return "/resreview/reviewstar"; /// WEB-INF/views/ + + .jsp

	}

	@RequestMapping(value = "/writereply.jee", method = RequestMethod.GET)
	public String writereply() {
		log.info("............. writereply");
		return "/resreview/writereply"; /// WEB-INF/views/ + + .jsp

	}

	// list
	@RequestMapping(value = "/writereview.jee", method = RequestMethod.GET)
	public String readAllReview(Model model) {
		model.addAttribute("list", service.readAllReview());
		log.info("............. writereview");
		return "/resreview/writereview"; /// WEB-INF/views/ + + .jsp
	}

	// delete

	@RequestMapping(value = "/deletereview.jee", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> deleteReview(int rno) {
		Map<String, Object> result = new HashMap<>();
		RestReviewDto dto = new RestReviewDto();
		dto.setReview_no(rno);
		result.put("result", service.deleteReview(dto));

		return result;
	}
	
	@RequestMapping( value="/pagingreview", method = RequestMethod.GET )
	public String list(Model model, @RequestParam(value="pstartno", defaultValue="0")int pstartno ) {
		
		Map<String, Integer> para = new HashMap<String, Integer>();
		para.put("pstartno", pstartno);
		para.put("onepagelimit", 10);
		
		/*
		 * model.addAttribute("list", service.listCnt(para));
		 * model.addAttribute("paging",service.paging(pstartno));
		 */
		
		
		return "/resreview/writereview";
	}

	
	
	
	
	/*
	 * @RequestMapping(value = "/writereview.jee", method = RequestMethod.POST)
	 * public String deleteReview(RestReviewDto dto , RedirectAttributes rttr) {
	 * String result = "fail"; if(service.deleteReview(dto)>0) {result = "글삭제성공";}
	 * rttr.addAttribute("success" ,result);
	 * 
	 * return "redirect:/writereview.jee"; }
	 */

	// insert
	/*
	 * @RequestMapping(value = "/writereview.jee", method = RequestMethod.GET)
	 * public String insertReview() { log.info("............. writereview" ); return
	 * "/resreview/writereview"; ///WEB-INF/views/ + + .jsp
	 * 
	 * }
	 */

	// detail
	// edit
	// edit

	// delete
	
	
	
}
