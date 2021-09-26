package com.spring.myWeb.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender mailSender;


	//회원가입페이지(일반)이동
	@GetMapping("normalJoinPage")
	public String joinPageNormal() {
		return "user/normalJoin";
	}

	//회원가입페이지(전문가)이동
	@GetMapping("proJoinPage")
	public String joinPagePro() {
		return "user/proJoin";
	}

	//회원가입요청
	@PostMapping("/userJoin")
	public String join(UserVO vo) {
		System.out.println("회원가입요청");
		service.userJoin(vo);
		return "user/loginPage";
	}
	
	// 회원정보 수정화면 요청
	@GetMapping("/userModify")
	public void userModify(HttpSession session, Model model) {
		System.out.println("/user/userModify: GET");
		
		String id = ((UserVO)session.getAttribute("user")).getId();
		model.addAttribute("userInfo", service.userInfo(id));
		
	}

	// 회원정보수정요청
	@PostMapping("/userModify")
	public void userUpdate(UserVO vo) {
		System.out.println("/user/userModify: POST");
		service.userUpdate(vo);
	}

	//회원탈퇴요청
	@PostMapping("/userDelete")
	public String userDelete(@Param("id")String id, @Param("pw")String pw,
								RedirectAttributes ra, HttpSession session) {
		System.out.println("/user/userDelete: POST");
		
		int pwCheck = service.pwCheck(id, pw);
		if(pwCheck == 1) {
			service.userDelete(id);
			session.invalidate();
			ra.addFlashAttribute("msg", "delSuccess");
			return "redirect:/";
		} else {
			ra.addFlashAttribute("msg", "delFail");
			return "redirect:/user/mypage";
		}		
	}

	//로그인페이지이동
	@GetMapping("/userLoginPage")
	public String loginPage() {
		return "user/loginPage";
	}

	//로그인요청
	@PostMapping("/login")
	public String userLogin(String id, String pw, HttpSession session) {
		System.out.println("로그인요청");

		UserVO vo = service.userLogin(id, pw);

		if(vo != null) {
			System.out.println("로그인성공");
			session.setAttribute("user", vo);
			return "/user/loginsuccess";
		} else {
			return "/user/loginfail";
		}
	}

	//아이디중복체크
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String id) {
		int chk = service.idCheck(id);
		if(chk == 1) {
			return "exist";
		} else {
			return "send";
		}

	}

	//이메일 인증관련
	@ResponseBody
	@PostMapping("/mailCheck")
	public String mailCheck(@RequestBody String id) {

		System.out.println("메일인증요청");
		System.out.println(id);

		//인증번호생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		//전송될메일관련
		String setFrom = "jashome.master@gmail.com";
		String toMail = id;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"인증 번호는 " + checkNum + "입니다." + 
						"<br>" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}

		String code = Integer.toString(checkNum);
		System.out.println(code);
		return code;
	}
	
	// 마이페이지 요청
	@GetMapping("/mypage")
	public void getMypage(HttpSession session, Model model) {
		System.out.println("/user/mypage: GET");
		
		String id = ((UserVO) session.getAttribute("user")).getId();
		model.addAttribute("userInfo", service.userInfo(id));
	}

}
