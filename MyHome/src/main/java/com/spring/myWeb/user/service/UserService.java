package com.spring.myWeb.user.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;
	
	@Override
	//회원등록
	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
	}

	@Override
	//회원정보
	public UserVO userInfo(String nick) {
		return mapper.userInfo(nick);
	}
	
	//로그인
	@Override
	public UserVO userLogin(@Param("id") String id, @Param("pw") String pw) {
		return mapper.userLogin(id, pw);
	}
	

	@Override
	//회원정보 수정
	public void userUpdate(UserVO vo) {
		mapper.userUpdate(vo);
	}


	@Override
	public int pwCheck(String id, String pw) {
		return mapper.pwCheck(id, pw);
	}
	
	@Override
	public void userDelete(String id) {
		mapper.userDelete(id);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	
	@Override
	public int nickCheck(String nickName) {
		return mapper.nickCheck(nickName);
	}

}
