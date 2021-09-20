package com.spring.myWeb.user.mapper;

import com.spring.myWeb.command.UserVO;

public interface IUserMapper {

	// CRUD 기능 메서드
	// 회원등록
	void userJoin(UserVO vo);

	// 회원정보 불러오기
	UserVO userInfo(String id);

	// 회원정보 수정
	void userUpdate(UserVO vo);

	// 회원탈퇴
	void userDelete(String id, String pw);

	// 로그인
	UserVO userLogin(String id, String pw);

}
