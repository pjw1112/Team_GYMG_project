package com.service.jin;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.dao.jin.Img_fileDao;
import com.dao.jin.UserDao;
import com.dao.jin.User_fileDao;
import com.dao.jin.User_locationDao;
import com.dto.jin.Img_fileDto;
import com.dto.jin.UserDto;
import com.dto.jin.User_fileDto;
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

	@Autowired
	Img_fileDao img_filedao;

	@Autowired
	User_fileDao user_filedao;

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
//	user_duplicateIdCheck	
//	user_duplicateIdCheck	
//	user_duplicateIdCheck

	// user_Insert
	// user_Insert
	// user_Insert
	@Override
	public int user_Insert(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws UnknownHostException {
		// TODO Auto-generated method stub
		try {
			// log.info("....................................1");

			userdto = (UserDto) item.get("userdto");
			userdto.setJoin_type_no(1); // 1-normal, 2-naver, 3-kakao
			userdto.setType_no(2); // 1-admin, 2-user
			userdto.setUser_ip(InetAddress.getLocalHost().getHostAddress());

			// log.info("....................................2");

			if (userdao.insert(userdto) > 0) {
				log.info("......user_insert : SUCCESS");
				userdto = userdao.read(userdto);
			}

			// log.info("....................................3");

			String location = (String) item.get("location");

			insert_user_location(location);

			// log.info("....................................5");

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	// user_Insert
	// user_Insert
	// user_Insert

	// insert_user_location
	// insert_user_location
	// insert_user_location
	public void insert_user_location(String location) {

		String[] locationList = { "서초구", "강남구", "종로구", "중구", "용산구", "성동구", "중랑구", "성북구", "도봉구", "노원구", "은평구", "서대문구",
				"강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "광진구", "동대문구", "마포구", "양천구", "강동구" };

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

	}
	// insert_user_location
	// insert_user_location
	// insert_user_location

	// user_login
	// user_login
	// user_login
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
			if (userdao.read(userdto) != null) {

				UserDto login_user_dto = userdao.read(userdto);

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

			if (userdao.read(userdto) == null) {

				if (userdao.insert(userdto) > 0) {
					System.out.println("...sns최초 로그인 : user inert SUCCESS");
					UserDto login_user_dto = userdao.read(userdto);
					if (login_user_dto != null) {
						session.setAttribute("login_user_dto", login_user_dto);
						System.out.println("...sns최초 로그인 : user login SUCCESS");
						return 1;
					}
				} else {
					System.out.println("...sns최초 로그인 : user inert FAIL");
				}

			} else {
				UserDto login_user_dto = userdao.read(userdto);
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

			UserDto login_user_dto = userdao.read(userdto);

			if (login_user_dto != null) {
				session.setAttribute("login_user_dto", login_user_dto);

				Cookie cookie = new Cookie("remember_login", login_user_dto.getUser_id());
				cookie.setMaxAge(10 * 24 * 60 * 60); // 유효기간 10일
				response.addCookie(cookie);
				System.out.println(".....remember_login check true // MAKE SUCCEESS COOKIE : remember_login "
						+ login_user_dto.getUser_id());
				return 1;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
		return 0;
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

		if (userdao.find_id(userdto) != null) {

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

		if (userdao.updatepw(userdto) > 0) {

			return 1;
		}

		return 0;
	}
//	update_pw	
//	update_pw	
//	update_pw	

//	update_pw2	
//	update_pw2	
//	update_pw2	
	@Override
	public int update_pw2(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String user_pw_before = (String) item.get("user_pw_before");
		userdto = (UserDto) item.get("userdto");

		String user_pw_new = userdto.getUser_pw();

		userdto.setUser_pw(user_pw_before);

		UserDto userdto2 = userdao.read(userdto);

		if (userdto2 != null) {
			if (userdto.getUser_no() == userdto2.getUser_no()) {

				userdto.setUser_pw(user_pw_new);

				if (userdao.updatepw(userdto) > 0) {

					return 1;
				}

			}
		}

		return 0;
	}
//	update_pw2	
//	update_pw2	
//	update_pw2	

	@Override
	public String read_user_profile_img(Map<String, Object> item, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		User_fileDto user_filedto = (User_fileDto) item.get("user_filedto");

		user_filedto = user_filedao.read(user_filedto);

		if (user_filedto != null) {
			Img_fileDto img_filedto = new Img_fileDto();
			img_filedto.setFile_no(user_filedto.getFile_no());
			img_filedto = img_filedao.read(img_filedto);

			if (img_filedto != null) {

				return img_filedto.getFile_name();
			}

		}
		return null;
	}

	@Override
	public String read_user_location(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		User_locationDto user_locationdto = new User_locationDto();

		user_locationdto.setUser_no(Integer.parseInt((String) item.get("user_no")));

		List<User_locationDto> list = user_locationdao.read(user_locationdto);

		String[] locationList = { "서초구", "강남구", "종로구", "중구", "용산구", "성동구", "중랑구", "성북구", "도봉구", "노원구", "은평구", "서대문구",
				"강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "광진구", "동대문구", "마포구", "양천구", "강동구" };

		String result = "";
		for (User_locationDto dto : list) {

			if (result.length() == 0) {
				result = locationList[dto.getLocation_no() - 1];
			} else {
				result += ", " + locationList[dto.getLocation_no() - 1];
			}

		}

		return result;
	}

	@Transactional
	@Override
	public int user_update(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();

		Map<String, Object> item2 = new HashMap<String, Object>();

		MultipartFile file = (MultipartFile) item.get("file");
		userdto = (UserDto) item.get("userdto");
		String user_location = (String) item.get("user_location");
		user_location = user_location == null ? "" : user_location;

		if (userdao.updateuser(userdto) > 0) {

			System.out.println("user_update 1 : 사용자 정보 업데이트 성공");

			if (!file.isEmpty()) {
				// #1. 파일이름 중복 안되게 고유값 설정
				UUID uid = UUID.randomUUID();
				String save = uid.toString() + "_" + file.getOriginalFilename();
				log.info("........save name : " + save);

				// #2. 파일 업로드
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				rootPath += "resources\\upload";
				log.info("...... rootPath : " + rootPath);

				File target = new File(rootPath, save);

				try {
					FileCopyUtils.copy(file.getBytes(), target);
					item2.put("user_no", userdto.getUser_no());
					item2.put("file", save);
					insert_user_profile_img(item2, request, response);
					System.out.println("user_update 2 : 사용자 프로필 이미지 변경 성공");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {
				System.out.println("user_update 2 : 사용자 프로필 이미지 변경 안함");
			}

			user_locationdto.setUser_no(userdto.getUser_no());
			user_locationdao.delete(user_locationdto);
			insert_user_location(user_location);

			System.out.println("user_update 3 : 사용자 관심장소 업데이트 성공");

			userdto = userdao.read(userdto);

			session.setAttribute("login_user_dto", userdto);
			return 1;
		}

		System.out.println("사용자 프로필 이미지 업로드 실패");

		return 0;
	}

	@Override
	public int insert_user_profile_img(Map<String, Object> item, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		User_fileDto user_file_dto = new User_fileDto();
		user_file_dto.setUser_no((int) item.get("user_no"));

		Img_fileDto img_file_dto = new Img_fileDto();
		img_file_dto.setFile_name((String) item.get("file"));
		if (user_filedao.read(user_file_dto) == null) {

			// 유저 no로 검색해서 없으면 img인서트 user_img인서트

			if (img_filedao.insert(img_file_dto) > 0) {

				img_file_dto = img_filedao.read_byFileName(img_file_dto);

				user_file_dto.setFile_no(img_file_dto.getFile_no());

				if (user_filedao.insert(user_file_dto) > 0) {

					System.out.println("...img_filedao.insert 성공");
					System.out.println("...user_filedao.insert 성공");

					return 1;
				}

			}
		} else {

			// 유저 no로 검색해서 있으면 img업데이트
			user_file_dto = user_filedao.read(user_file_dto);

			img_file_dto.setFile_no(user_file_dto.getFile_no());

			if (img_filedao.update(img_file_dto) > 0) {

				System.out.println("...img_filedao.update 성공");

				return 1;
			}

		}

		return 0;
	}

	@Override
	public int delete_user(Map<String, Object> item, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		userdto = (UserDto) item.get("userdto");

		if (userdao.delete(userdto) > 0) {
			
			return 1;
		}

		return 0;
	}

}
