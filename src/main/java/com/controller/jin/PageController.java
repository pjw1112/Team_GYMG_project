package com.controller.jin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.TestDao;

@Controller
public class PageController {

	@Autowired
	TestDao testDao;
		
	
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	@RequestMapping(value = "/GoToTestPage.jin", method = { RequestMethod.GET })
	public String Test(Model model) {

		model.addAttribute("time", testDao.readTime());
		return "/testPages/test-jin.jsp";
	}

	@RequestMapping(value = "/GoToMain.jin", method = { RequestMethod.GET })
	public String gotoMain() {
		return "index.ye";
	}

	@RequestMapping(value = "/GoToLoginPage.jin", method = { RequestMethod.GET })
	public String goToLoginPage() {
		return "/jinPages/login.jsp";
	}

	@RequestMapping(value = "/GoToJoin1Page.jin", method = { RequestMethod.GET })
	public String GoToJoin1Page() {
		return "/jinPages/join1.jsp";
	}

	@RequestMapping(value = "/GoToJoin2Page.jin", method = { RequestMethod.GET })
	public String GoToJoin2Page() {
		return "/jinPages/join2.jsp";
	}

	@RequestMapping(value = "/GoToFind_id1Page.jin", method = { RequestMethod.GET })
	public String GoToFind_id1Page() {
		return "/jinPages/find_id1.jsp";
	}

	@RequestMapping(value = "/GoToFind_id3Page.jin", method = { RequestMethod.GET })
	public String GoToFind_id3Page() {
		return "/jinPages/find_id3.jsp";
	}
	
	@RequestMapping(value = "/GoToFind_id2Page.jin", method = { RequestMethod.GET })
	public String GoToFind_id2Page() {
		return "/jinPages/find_id2.jsp";
	}

	@RequestMapping(value = "/GoToFind_pass1Page.jin", method = { RequestMethod.GET })
	public String GoToFind_pass1Page() {
		return "/jinPages/find_pass1.jsp";
	}

	@RequestMapping(value = "/GoToFind_pass2Page.jin", method = { RequestMethod.GET })
	public String GoToFind_pass2Page() {
		return "find_pass_email_trans.jin";
	}

	@RequestMapping(value = "/GoToFind_pass3Page.jin", method = { RequestMethod.POST })
	public String GoToFind_pass3Page() {
		return "/jinPages/find_pass3.jsp";
	}

	@RequestMapping(value = "/GoToMic_tab1Page.jin", method = { RequestMethod.GET })
	public String GoToMic_tab1Page() {
		return "/jinPages/mic_tab1.jsp";
	}

	@RequestMapping(value = "/GoToMic_tab2Page.jin", method = { RequestMethod.GET })
	public String GoToMic_tab2Page() {
		return "/jinPages/mic_tab2.jsp";
	}

	@RequestMapping(value = "/GoToMic_tab3Page.jin", method = { RequestMethod.GET })
	public String GoToMic_tab3Page() {
		return "/jinPages/mic_tab3.jsp";
	}

	@RequestMapping(value = "/join_successs.jin", method = { RequestMethod.GET })
	public String join_successs() {
		return "/jinPages/join3.jsp";
	}
	
	@RequestMapping(value = "/user_change_succsess.jin", method = { RequestMethod.GET })
	public String user_change_succsess() {
		return "/jinPages/mic_tab1_success.jsp";
	}
	
	@RequestMapping(value = "/user_change_fail.jin", method = { RequestMethod.GET })
	public String user_change_fail() {
		return "/jinPages/mic_tab1_fail.jsp";
	}
	
	
	
	@RequestMapping(value = "/mp_tab1.jin", method = { RequestMethod.GET })
	public String mp_tab1() {
		return "/jinPages/mp_tab1.jsp";
	}
	@RequestMapping(value = "/mp_tab2.jin", method = { RequestMethod.GET })
	public String mp_tab2() {
		return "/jinPages/mp_tab2.jsp";
	}
	@RequestMapping(value = "/mp_tab3.jin", method = { RequestMethod.GET })
	public String mp_tab3() {
		return "/jinPages/mp_tab3.jsp";
	}
	@RequestMapping(value = "/mp_tab4.jin", method = { RequestMethod.GET })
	public String mp_tab4() {
		return "/jinPages/mp_tab4.jsp";
	}
	@RequestMapping(value = "/mp_tab5.jin", method = { RequestMethod.GET })
	public String mp_tab5() {
		return "/jinPages/mp_tab5.jsp";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/message.jin", method = { RequestMethod.POST })
	public String message() {
		return "/jinPages/message.jsp";
	}
	
	
	
	
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	
	
	
	
	@RequestMapping(value = "/user_logout.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String user_logout(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 쿠키 삭제
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("remember_login".equals(cookie.getName())) {
                    cookie.setMaxAge(0); // 쿠키 삭제
                    response.addCookie(cookie);
                }
            }
        }
		
		
		return "redirect:index.ye";
	}
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	
}
