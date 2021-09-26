package com.spring.myWeb.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.myWeb.command.UserVO;

public interface IUserMapper {

	//CRUD 기능 메서드
		//회원등록
		void userJoin(UserVO vo);
		
		//회원정보 불러오기
		UserVO userInfo(String id);
		
		//회원정보 수정
		void userUpdate(UserVO vo);
		
		// 비밀번호 확인
		int pwCheck(@Param("id") String id, @Param("pw") String pw);
		
		// 회원탈퇴
		void userDelete(String id);
		
		//로그인
		UserVO userLogin(@Param("id") String id, @Param("pw") String pw);
		
		//아이디 중복체크
		int idCheck(String id);
		
		

}
