package com.service.jin;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.jin.UserDao;
import com.dao.jin.User_locationDao;
import com.dto.jin.UserDto;
import com.dto.jin.User_locationDto;
import com.mysql.cj.Session;

import lombok.extern.log4j.Log4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@Log4j
public class JService_Impl implements JService {

	@Autowired
	UserDto userdto;

	@Autowired
	User_locationDto user_locationdto;

	@Autowired
	UserDao userdao;

	@Autowired
	User_locationDao user_locationdao;

//	sms verification
//	sms verification
//	sms verification	
	final DefaultMessageService messageService;

	public JService_Impl() {

		this.messageService = NurigoApp.INSTANCE.initialize("NCSXGMKFZT9LVJFL", "FS9GLBGHQXWZA7UZVWM88SBBFHUL5ZPA",
				"https://api.coolsms.co.kr");
	}

	@Override
	public int VerifyMobileBySms(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		Message message = new Message();

		message.setFrom("01039502803");
		message.setTo((String) session.getAttribute("verify_nubmer"));

		Random random = new Random();

		int randomNumber = random.nextInt(10000);

		String formattedNumber = String.format("%04d", randomNumber);
		log.info("4자리 난수 : " + formattedNumber);

		message.setText("안녕하세요. '가봄,맛봄 휴대폰 인증 서비스 입니다. 인증 번호는 [" + formattedNumber + "] 입니다.");

		SingleMessageSentResponse sresponse = this.messageService.sendOne(new SingleMessageSendingRequest(message));
		log.info(sresponse);

		if (sresponse.getStatusCode().equals("2000")) {

			session.setAttribute("verificationCode", formattedNumber);

			Timer timer = new Timer(true);
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					session.removeAttribute("verificationCode");
					session.removeAttribute("verify_nubmer");
				}
			}, 5 * 60 * 1000);

			return 1;

		}

		return 0;
	}
//	sms verification
//	sms verification
//	sms verification

//	user_duplicateIdCheck	
//	user_duplicateIdCheck	
//	user_duplicateIdCheck	
	@Override
	public int user_duplicateIdCheck(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		log.info((String) item.get("inputID"));
		UserDto userdto = new UserDto();
		userdto.setUser_id((String) item.get("inputID"));

		return userdao.duplicateIdCheck(userdto);
	}

	@Override
	public int user_Insert(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws UnknownHostException {
		// TODO Auto-generated method stub
		try {
			log.info("....................................1");

			userdto = (UserDto) item.get("userdto");
			userdto.setJoin_type_no(1); // 1-normal, 2-naver, 3-kakao
			userdto.setType_no(2); // 1-admin, 2-user
			userdto.setUser_ip(InetAddress.getLocalHost().getHostAddress());

			log.info("....................................2");

			if (userdao.insert(userdto) > 0) {
				log.info("......user_insert : SUCCESS");
				userdto = userdao.read_user_no(userdto);
			}

			log.info("....................................3");

			String location = (String) item.get("location");
			String[] locationList = { "서초구", "강남구", "종로구", "중구", "용산구", "성동구", "중랑구", "성북구", "도봉구", "노원구", "은평구",
					"서대문구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "광진구", "동대문구", "마포구", "양천구", "강동구" };

			String[] locationArray = location.split(", ");
			System.out.println("......location_before : " + locationArray.toString());
			for (int i = 0; i < locationArray.length; i++) {
				for (int j = 0; j < locationList.length; j++) {
					if (locationArray[i].equals(locationList[j])) {
						locationArray[i] = "" + (j + 1);
					}
				}
			}

			log.info("....................................4");

			log.info("......location_after : " + locationArray);

			for (int i = 0; i < locationArray.length; i++) {
				if (!locationArray[0].equals("")) {
					user_locationdto.setUser_no(userdto.getUser_no());
					user_locationdto.setLocation_no(Integer.parseInt(locationArray[i]));

					user_locationdao.insert(user_locationdto);

					log.info("......user_location_insert : SUCCESS" + (i + 1) + "th");
				}
			}

			log.info("....................................5");
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
//	user_duplicateIdCheck	
//	user_duplicateIdCheck	
//	user_duplicateIdCheck

//	user_login
//	user_login
//	user_login
	@Override
	public int user_login(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		userdto = (UserDto) item.get("userdto");
		String login_type = (String) item.get("login_type");
		String remember_id = (String) item.get("remember_id");
		String remember_login = (String) item.get("remember_login");

		if (login_type.equals("1")) {
			if (userdao.user_login(userdto) != null) {

				UserDto login_user_dto = userdao.user_login(userdto);

				session.setAttribute("login_user_dto", login_user_dto);

				System.out.println("remember_id : " + remember_id);
				System.out.println("remember_login : " + remember_login);

				if (remember_id.equals("true")) {
					Cookie cookie = new Cookie("remember_id", login_user_dto.getUser_id());
					cookie.setMaxAge(10 * 24 * 60 * 60); // 유효기간 10일
					response.addCookie(cookie);
					System.out.println(".....remember_id check true // MAKE SUCCEESS COOKIE : remember_id "
							+ login_user_dto.getUser_id());
				} else {
					// 쿠키 삭제
					Cookie[] cookies = request.getCookies();
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if ("remember_id".equals(cookie.getName())) {
								cookie.setMaxAge(0); // 쿠키 삭제
								response.addCookie(cookie);
								System.out.println(".....remember_id check false // DELETE COOKIE : remember_id "
										+ login_user_dto.getUser_id());
							}
						}
					}
				}

				if (remember_login.equals("true")) {
					Cookie cookie = new Cookie("remember_login", login_user_dto.getUser_id());
					cookie.setMaxAge(10 * 24 * 60 * 60); // 유효기간 10일
					response.addCookie(cookie);
					System.out.println(".....remember_login check true // MAKE SUCCEESS COOKIE : remember_login "
							+ login_user_dto.getUser_id());
				}
				return 1;
			}

		} else {

			if (userdao.user_login(userdto) == null) {
				
				if (userdao.insert(userdto) > 0) {
					System.out.println("...sns최초 로그인 : user inert SUCCESS");
					UserDto login_user_dto = userdao.user_login(userdto);
					if (login_user_dto != null) {
						session.setAttribute("login_user_dto", login_user_dto);
						System.out.println("...sns최초 로그인 : user login SUCCESS");
						return 1;
					}
				} else {
					System.out.println("...sns최초 로그인 : user inert FAIL");
				}

			} else {
				UserDto login_user_dto = userdao.user_login(userdto);
				if (login_user_dto != null) {
					session.setAttribute("login_user_dto", login_user_dto);
					System.out.println("...sns후속 로그인 : user login SUCCESS");
					return 1;
				}

			}

		}

		return 0;
	}
//	user_login
//	user_login
//	user_login

//	cookie_login
//	cookie_login
//	cookie_login
	@Override
	public int cookie_login(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			HttpSession session = request.getSession();

			userdto.setUser_id((String) item.get("remember_login"));

			UserDto login_user_dto = userdao.read_user_no(userdto);

			if (userdto != null) {
				session.setAttribute("login_user_dto", login_user_dto);

			}

			Cookie cookie = new Cookie("remember_login", login_user_dto.getUser_id());
			cookie.setMaxAge(10 * 24 * 60 * 60); // 유효기간 10일
			response.addCookie(cookie);
			System.out.println(".....remember_login check true // MAKE SUCCEESS COOKIE : remember_login "
					+ login_user_dto.getUser_id());
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}

	}
//	cookie_login
//	cookie_login
//	cookie_login

	
	
//	find_id	
//	find_id	
//	find_id	
	@Override
	public int find_id(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		userdto = (UserDto) item.get("userdto");
		
		if(userdao.find_id(userdto) != null ) {
			
			UserDto result = userdao.find_id(userdto);
			request.setAttribute("find_id_result", result.getUser_id());
			
			return 1;
		}
		
		return 0;
	}
//	find_id	
//	find_id	
//	find_id	

	
//	update_pw	
//	update_pw	
//	update_pw	
	@Override
	public int update_pw(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		userdto = (UserDto) item.get("userdto");
		
		if(userdao.updatepw(userdto) > 0 ) {
			
			return 1;
		}
		
		return 0;
	}
//	update_pw	
//	update_pw	
//	update_pw	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
