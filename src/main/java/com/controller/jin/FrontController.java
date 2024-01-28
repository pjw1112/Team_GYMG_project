package com.controller.jin;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dao.TestDao;
import com.dao.jin.LocationDao;
import com.dto.jin.UserDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.service.jin.JService;

import lombok.extern.log4j.Log4j;

@Controller("jin-controller")
@Log4j
public class FrontController {

	/* -- Autowired Section -- */
	/* -- Autowired Section -- */
	/* -- Autowired Section -- */
	@Autowired
	TestDao testDao;

	@Autowired
	JService service;

	@Autowired
	LocationDao locationdao;

	/* -- Autowired Section -- */
	/* -- Autowired Section -- */
	/* -- Autowired Section -- */

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
		return "/jinPages/main.jsp";
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
	
	@RequestMapping(value = "/user_logout.jin", method = { RequestMethod.GET })
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
		
		
		return "redirect:GoToMain.jin";
	}
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */
	/* -- Just Page Moving Mappers -- */

	/* -- Ajax Mappers -- */
	/* -- Ajax Mappers -- */
	/* -- Ajax Mappers -- */
	@RequestMapping(value = "/sendsmsverify.jin", method = RequestMethod.POST)
	public void sendOne(String verify_nubmer, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Map<String, Object> item = new HashMap<String, Object>();
		session.setAttribute("verify_nubmer", verify_nubmer);

		if (service.VerifyMobileBySms(item, request, response) > 0) {
			log.info("............verificationCode 발급완료");
			out.print("2000");
		}
	}

	@RequestMapping(value = "/receivesmsverify.jin", method = RequestMethod.POST)
	public void receivesmsverify(String input4number, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String verificationCode = (String) session.getAttribute("verificationCode");
		String verify_nubmer = (String) session.getAttribute("verify_nubmer");

		log.info("verify_nubmer : " + verify_nubmer);
		log.info("verificationCode : " + verificationCode);
		log.info("input4number : " + input4number);

		if (verificationCode != null) {

			if (verify_nubmer != null) {

				if (verificationCode.trim().equals(input4number.trim())) {

					session.removeAttribute("verificationCode");
					session.removeAttribute("verify_nubmer");

					log.info("...............All sms verification SuCCESS");

					out.print("2000");

				} else {
					log.info("...............sms verification FAIL : CAUSE input4number != verificationCode ");
					out.print("2001");
				}

			} else {
				log.info("...............sms verification FAIL : CAUSE verify_nubmer = null ");
				out.print("2001");
			}

		} else {
			log.info("...............sms verification FAIL : CAUSE verificationCode = null");
			out.print("2001");

		}

	}
	@RequestMapping(value = "/receiveemailverify.jin", method = RequestMethod.POST)
	public void receiveemailverify(String input4number, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String email4number = (String)session.getAttribute("email4number");
		
		log.info("email4number : " + email4number);
		log.info("input4number : " + input4number);
		log.info("일치 여부 : " + (input4number==email4number));

		if (  email4number != null) {

			if (input4number != null) {

				if (input4number.trim().equals(  email4number)) {

					session.removeAttribute("email4number");
					

					log.info("...............All Email verification SuCCESS");

					out.print("2000");

				} else {
					log.info("...............Email verification FAIL : CAUSE input4number != email4number ");
					out.print("2001");
				}

			} else {
				log.info("...............Email verification FAIL : CAUSE input4number = null ");
				out.print("2001");
			}

		} else {
			log.info("...............Email verification FAIL : CAUSE email4number = null");
			out.print("2001");

		}

	}
	@RequestMapping(value = "/IDduplicateCheck.jin", method = RequestMethod.POST)
	public void idduplicateCheck(String inputID, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		Map<String, Object> item = new HashMap<String, Object>();

		item.put("inputID", inputID);

		out.print(service.user_duplicateIdCheck(item, request, response));

	}

	@RequestMapping(value = "/locationListPull.jin", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> locationListPull(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Map<String, Object> result = new HashMap<String, Object>();

		result.put("data", locationdao.readAllLocation());

		return result; // 경로로 넘길게 - view
	}

	@RequestMapping(value = "/join_user_form_transfer.jin", method = { RequestMethod.POST })
	@ResponseBody
	public String join_user_form_transfer(UserDto dto, @RequestParam("user_location") String location,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		Map<String, Object> item = new HashMap<String, Object>();

		item.put("userdto", dto);
		item.put("location", location);

		log.info(".........dto : " + dto);
		log.info(".........location : " + location);
		if (service.user_Insert(item, request, response) > 0) {

			return "2000";
		}
		;

		return "2001";
	}

	@RequestMapping(value = "/user_login.jin", method = { RequestMethod.POST })
	@ResponseBody
	public String normal_login(UserDto dto, 
			@RequestParam("login_type") String login_type,
			@RequestParam("remember_id") String remember_id, 
			@RequestParam("remember_login") String remember_login,
			HttpServletRequest request, HttpServletResponse response) 
					throws IOException, ServletException {

		Map<String, Object> item = new HashMap<String, Object>();

		item.put("userdto", dto);
		item.put("remember_id", remember_id);
		item.put("remember_login", remember_login);
		item.put("login_type", login_type);

		log.info(".........dto : " + dto);
		log.info(".........remember_id : " + remember_id);
		if (service.user_login(item, request, response) > 0) {

			return "2000";
		}
		

		return "2001";
	}

	@RequestMapping(value = "/user_login_byCookie.jin", method = { RequestMethod.POST })
	@ResponseBody
	public String cookie_login( 
			@RequestParam("remember_login") String remember_login,
			
			HttpServletRequest request, HttpServletResponse response) 
					throws IOException, ServletException {

		Map<String, Object> item = new HashMap<String, Object>();

		item.put("remember_login", remember_login);
		
		log.info(".........remember_login : " + remember_login);
		if (service.cookie_login(item, request, response) > 0) {

			return "2000";
		}
		;

		return "2001";
	}
	
	
	
	

	
	

	@RequestMapping(value = "/upload.jin", method = {RequestMethod.POST} )
	public String upload_post(MultipartFile file, HttpServletRequest request, Model model) throws IOException {
	
    	log.info("........POST");
		log.info("........NAME : " + file.getOriginalFilename());
		log.info("........size : " + file.getSize());
		log.info("........contentType : " + file.getContentType());
		/*				*/
		/*				*/
		//#1. 파일이름 중복 안되게 고유값 설정
		UUID uid = UUID.randomUUID();
		String save = uid.toString() + "_" + file.getOriginalFilename();
		log.info("........save name : " + save);
		//#2. 파일 업로드
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		rootPath += "resources\\upload";
		log.info("...... rootPath : " + rootPath);
		
		File target = new File(rootPath, save );
		
			try {
				FileCopyUtils.copy(file.getBytes(), target);
				/*
				model.addAttribute("title", request.getParameter("title"));
				model.addAttribute("file", save);
			*/
				return "redirect:GoToMic_tab1Page.jin";
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		
		
		return "file_upload_fail";
    	
    }
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* -- Ajax Mappers -- */
	/* -- Ajax Mappers -- */
	/* -- Ajax Mappers -- */

	
	
	
	/* -- Kakao Login Mappers -- */
	/* -- Kakao Login Mappers -- */
	/* -- Kakao Login Mappers -- */
	@RequestMapping(value = "/Kakao_login.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String Kakao_login(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String code = request.getParameter("code");
		String error = request.getParameter("error");
		String error_description = request.getParameter("error_description");
		
		System.out.println("code : "+code);
		System.out.println("error : " +error);
		System.out.println("error_description : "+error_description);
		
		// 인가 코드 받기
		//////////////////////////////////////////////////////////////////////
		// 토큰 받기 
		
		String urlapi = "https://kauth.kakao.com/oauth/token";

		String parameter ="?grant_type=authorization_code" +
				"&client_id=5311dcef4df09cce6029d72479addf8c" +
				"&redirect_uri=http://localhost:8080/Team_GYMG/Kakao_login.jin" +
				"&code="+code;
		
		urlapi+= parameter;
		URL url = null;
		HttpURLConnection conn = null;
		BufferedReader br = null;

		url = new URL(urlapi);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true); //서버한테 전달
		conn.setDoOutput(true);
				
		DataOutputStream out = new DataOutputStream(conn.getOutputStream());
		out.writeBytes(parameter);
		out.close();
		
		
		
		if (conn.getResponseCode() == 200) {
			System.out.println("정상실행");
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			System.out.println("비정상실행");
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		
		String line = "";
		StringBuffer buffer = new StringBuffer();
		
		while ((line = br.readLine()) != null) {
			buffer.append(line);
		}
		br.close();
		conn.disconnect();
		
		String result =  buffer.toString();
		System.out.println("===========================");
		System.out.println("로긴서블릿1페이지 결과 : "+result);
		// JSON 문자열을 JsonElement로 파싱
		JsonParser parser = new JsonParser();
		JsonElement jsonElement = parser.parse(result);
        // JsonElement를 JsonObject로 변환
		
		
        if (jsonElement.isJsonObject()) {
            JsonObject j_ob = jsonElement.getAsJsonObject();
            
            String access_token = j_ob.get("access_token").toString();
            
            request.setAttribute("access_token", access_token);
            request.getSession().setAttribute("access_token", access_token);
           /*
            request.getRequestDispatcher("/Kakao_login2.jin").forward(request, response);
             */
        }
        
         //   JsonObject 내의 모든 키-값 출력
         //   for (Map.Entry<String, JsonElement> entry : jsonObject.entrySet()) {
         //      System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
         //   }
         //   } else {
         //   System.out.println("Given JSON is not an object.");
         //   }
	return "Kakao_login2.jin";
	}
	
	@RequestMapping(value = "/Kakao_login2.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String Kakao_login2(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
	
		System.out.println("서블릿2진입");
		
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String access_token = (String)request.getAttribute("access_token");
		
		//////////////////////////////////////////////////////////////////////
		// 사용자 정보 받기
		
		String urlapi = "https://kapi.kakao.com/v2/user/me";
		URL url = null;
		HttpURLConnection conn = null;
		BufferedReader br = null;

		url = new URL(urlapi);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization","Bearer "+ access_token);
		conn.setRequestProperty("Content-type", "x-www-form-urlencoded;charset=utf-8");
		conn.setDoOutput(true); //서버한테 전달
		conn.setDoOutput(true);
		
		if (conn.getResponseCode() == 200) {
			System.out.println("정상실행");
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			System.out.println("비정상실행");
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		
		String line = "";
		StringBuffer buffer = new StringBuffer();
		
		while ((line = br.readLine()) != null) {
			buffer.append(line);
		}
		
		String result =  buffer.toString();
		System.out.println("===========================");
		System.out.println("로긴서블릿2페이지 결과 : "+result);
        JsonParser parser = new JsonParser();
        
        JsonObject obj = (JsonObject)parser.parse(result);
		
        if(obj != null) {//카카오 로긴 성공 > 코드, 아이디 모두 수령 완료
        	
        String kakao_id = obj.get("id").getAsString();
        String kakao_email = obj.get("kakao_account").getAsJsonObject().get("email").getAsString();
        String kakao_nick = obj.get("properties").getAsJsonObject().get("nickname").getAsString();
        
        
        System.out.println("카카오 로긴 성공 ");
        System.out.println("kakao_id : "+kakao_id);
        System.out.println("kakao_email : "+kakao_email);
        System.out.println("kakao_nick : "+kakao_nick);
        
        Map<String, Object> item = new HashMap<String, Object>();
        UserDto dto = new UserDto();
		
        dto.setJoin_type_no(3);
        dto.setType_no(2);
        dto.setUser_id(kakao_email);
        dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
        dto.setUser_name(kakao_nick);
        dto.setUser_nick(kakao_nick);
        dto.setUser_phone("00000000000");
        dto.setUser_pw(kakao_id);
        
        item.put("userdto", dto);
		item.put("login_type", "3");

		log.info(".........dto : " + dto);
		
		if (service.user_login(item, request, response) > 0) {

			return "/jinPages/login_kakao.jsp";
		}
        
        
        
        }
        br.close();
		conn.disconnect();
	
		return "";
	}
	
	/* -- Kakao Login Mappers -- */
	/* -- Kakao Login Mappers -- */
	/* -- Kakao Login Mappers -- */
	
	
	
	
	
	
	
	
	
	
	
	/* -- naver Login Mappers -- */
	/* -- naver Login Mappers -- */
	/* -- naver Login Mappers -- */
	@RequestMapping(value = "/naver_login.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String naver_login(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		 	String clientId = "jjoG5L0Odeyao6UOPCVc";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "EX0nHpNPpN";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://localhost:8080/Team_GYMG/naver_login.jin", "UTF-8");
		    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
		        + "&client_id=" + clientId
		        + "&client_secret=" + clientSecret
		        + "&redirect_uri=" + redirectURI
		        + "&code=" + code
		        + "&state=" + state;
		    String accessToken = "";
		    String refresh_token = "";
		    JsonParser parser = new JsonParser();
		    JsonObject my_object = null;
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if (responseCode == 200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuilder res = new StringBuilder();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if (responseCode == 200) {
		        System.out.println(res.toString());
		        my_object = (JsonObject) parser.parse(res.toString());
		      }
		    } catch (Exception e) {
		      // Exception 로깅
		    }
		    accessToken = my_object.get("access_token").getAsString();
		    refresh_token = my_object.get("refresh_token").getAsString();
		    String token_type = my_object.get("token_type").getAsString();
		    String expires_in = my_object.get("expires_in").getAsString();
		    
		    request.setAttribute("accessToken", accessToken);
		    
		    
		return "get_naver_member_profile.jin";
	}
	@RequestMapping(value = "/get_naver_member_profile.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String get_naver_member_profile(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		        String token = (String)request.getAttribute("accessToken"); // 네이버 로그인 접근 토큰;
		        String header = "Bearer " + token; // Bearer 다음에 공백 추가


		        String apiURL = "https://openapi.naver.com/v1/nid/me";


		        Map<String, String> requestHeaders = new HashMap<>();
		        requestHeaders.put("Authorization", header);
		        String responseBody = get(apiURL,requestHeaders);


		        System.out.println(responseBody);
		        JsonParser parser = new JsonParser();
		        JsonObject jsonObject = parser.parse(responseBody).getAsJsonObject();
		        System.out.println(jsonObject.get("message").getAsString());
		        if(jsonObject.get("message").getAsString().equals("success")) {
		        
		        
		        JsonObject jresponse = jsonObject.get("response").getAsJsonObject();

		        // Extract and format values
		        String id = jresponse.get("id").getAsString();
		        String nickname = jresponse.get("nickname").getAsString();
		        String profile_image = jresponse.get("profile_image").getAsString();
		        String email = jresponse.get("email").getAsString();
		        String mobile = jresponse.get("mobile").getAsString().replaceAll("-", "");
		        String name = jresponse.get("name").getAsString();

		        // Print values (for demonstration)
		        System.out.println("ID: " + id);
		        System.out.println("Nickname: " + nickname);
		        System.out.println("Profile Image: " + profile_image);
		        System.out.println("Email: " + email);
		        System.out.println("Mobile: " + mobile);
		        System.out.println("Name: " + name);
		        
		        
		        Map<String, Object> item = new HashMap<String, Object>();
		        UserDto dto = new UserDto();
				
		        dto.setJoin_type_no(2);
		        dto.setType_no(2);
		        dto.setUser_id(email);
		        dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
		        dto.setUser_name(name);
		        dto.setUser_nick(nickname);
		        dto.setUser_phone(mobile);
		        dto.setUser_pw(id);
		        
		        item.put("userdto", dto);
				item.put("login_type", "2");

				log.info(".........dto : " + dto);
				
				if (service.user_login(item, request, response) > 0) {

					return "/jinPages/login_naver.jsp";
				}
		        
		        
		        
		        
		        
		        
		        
		        }
		
		return "";
	}
	
	
	public String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    public HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    public String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
		/* -- naver Login Mappers -- */
		/* -- naver Login Mappers -- */
		/* -- naver Login Mappers -- */
	
    
    
    
    
    
    
    
    
    
    
    /* find_id.jin */
    /* find_id.jin */
    /* find_id.jin */
    @RequestMapping(value = "/find_id.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String find_id_form_transfer( UserDto userdto,
			HttpServletRequest request, HttpServletResponse response) 
					throws IOException, ServletException {

		Map<String, Object> item = new HashMap<String, Object>();

		item.put("userdto", userdto);
		
		log.info(".........find_id : ");
		log.info(userdto.getUser_name());
		log.info(userdto.getUser_phone());
		if (service.find_id(item, request, response) > 0) {

			return "GoToFind_id2Page.jin";
		}
		
		return "redirect:GoToFind_id3Page.jin";
				}
    /* find_id.jin */
    /* find_id.jin */
    /* find_id.jin */	
    
    
    
    
    /* find_pass_email_trans.jin */
    /* find_pass_email_trans.jin */
    /* find_pass_email_trans.jin */
	@RequestMapping(value = "/find_pass_email_trans.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public String find_pass_email_trans(String user_id, HttpServletRequest request) {
		log.info("...............비번 찾기 이메일 전송 시작");
		 	System.out.println(user_id);
			//1. 보내는 쪽
			String host = "smtp.naver.com";
			String user = "bananasyndro@naver.com"; //본인 naver 아이디 (이메일형식)
			String password="Ogsily121@"; //본인 naver 아이디 비밀번호
			
			//2. 받는 사람
			String to = user_id;
			/*String to = "bananasyndro@naver.com";*/
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.port", "587");

			props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		    props.put("mail.smtp.ssl.protocols", "TLSv1.2"); 
			
			Session session = Session.getDefaultInstance(props,
					new Authenticator() {
				
						@Override
						protected PasswordAuthentication getPasswordAuthentication() {
							// TODO Auto-generated method stub
							return new PasswordAuthentication(user, password);
						}
						
					});
					
			MimeMessage message = new MimeMessage(session);
			try {
				Random random = new Random();

				int randomNumber = random.nextInt(10000);

				String formattedNumber = String.format("%04d", randomNumber);
				log.info("4자리 난수 : " + formattedNumber);
				
				request.getSession().setAttribute("email4number", formattedNumber);
				
				message.setFrom( new InternetAddress(user) );  // 보내는 사람
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to) );//받는사람
				
				message.setSubject("가봄,맛봄 비밀번호 찾기 서비스 입니다.");
				message.setContent(""
						
						+ "<h3>인증번호를 확인해주세요</h3><br>"
						+ "<p>[ "+formattedNumber+" ]</p><br><br><br>"
						+ "</div>" , "text/html; charset=euc-kr");
				
				Transport.send(message);
				System.out.println("........... Successfully ......................");
				
				return "/jinPages/find_pass2.jsp";
				
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return "/jinPages/find_pass4.jsp";
			
	}
	/* find_pass_email_trans.jin */
    /* find_pass_email_trans.jin */
    /* find_pass_email_trans.jin */	
	
	
	/* changeUserPass.jin */
	/* changeUserPass.jin */
	/* changeUserPass.jin */
	@RequestMapping(value = "/changeUserPass.jin", method = { RequestMethod.POST })
	public String changeUserPass(UserDto userdto, HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
			log.info("...............비번 변경 맵퍼 시작");
		 	System.out.println(".... 입력받은 dto : "+userdto);
			
		 	Map<String, Object> item = new HashMap<String, Object>();

			item.put("userdto", userdto);
			
			log.info(".........update_pw go");
			
			if (service.update_pw(item, request, response) > 0) {

				return "redirect:/jinPages/find_pass5.jsp";
			}
			
		 	
		 	
		 	
			return "/jinPages/find_pass4.jsp";
			
	}
	/* changeUserPass.jin */
	/* changeUserPass.jin */
	/* changeUserPass.jin */
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/pageleave.jin", method = { RequestMethod.GET, RequestMethod.POST })
	public void pageleave() {
		log.info("...............사용자가 회원가입 페이지를 떠남");
	}

}
