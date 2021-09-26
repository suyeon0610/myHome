package com.spring.myWeb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;

	// 회원가입페이지(일반)이동
	@GetMapping("normalJoinPage")
	public String joinPageNormal() {
		return "user/normalJoin";
	}

	// 회원가입페이지(전문가)이동
	@GetMapping("proJoinPage")
	public String joinPagePro() {
		return "user/proJoin";
	}

	// 회원가입요청
	@PostMapping("/userJoin")
	public String join(UserVO vo) {
		System.out.println("회원가입요청");
		service.userJoin(vo);
		return "user/loginPage";
	}

	// 로그인페이지이동
	@GetMapping("/userLoginPage")
	public String loginPage() {
		return "user/loginPage";
	}

	// 로그인요청
	@PostMapping("/login")
	public String userLogin(String id, String pw, HttpSession session) {
		System.out.println("로그인요청");

		UserVO vo = service.userLogin(id, pw);

		if (vo != null) {
			System.out.println("로그인성공");
			session.setAttribute("userId", vo.getId());
			return "/user/loginsuccess";
		} else {
			return "/user/loginfail";
		}
	}
	
	// 회원 정보 요청
	@GetMapping("/mypage")
	public void getMypage(HttpSession session, Model model) {
		System.out.println("/user/mypage: GET");
		
		// 세션
		String id = (String) session.getAttribute("");
		
		UserVO vo = service.userInfo(id);
		model.addAttribute("userInfo", vo);
	}
	
	// 회원 정보 수정 페이지
	@GetMapping("/userUpdate")
	public void userUpdate(HttpSession session) {
		System.out.println("/user/userModify: GET");
		
		// 세션 이름
		UserVO vo = (UserVO) session.getAttribute("");
		service.userUpdate(vo);
		
	}
	
	// 회원 정보 수정 요청
	@PostMapping("/userUpdate")
	public void update(UserVO vo) {
		System.out.println("/user/userUpdate: POST");
		
		service.userUpdate(vo);
	}
	
	// 회원 정보 탈퇴 요청
	@PostMapping("/userDelete")
	public void delete(@RequestParam String id, @RequestParam String pw) {
		System.out.println("/user/userDelete: POST");
		
		service.userDelete(id, pw);
	}

}
