package com.spring.myWeb.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.user.mapper.IUserMapper;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserMapper mapper;

	@Override
	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
	}

	@Override
	public UserVO userInfo(String id) {
		return null;
	}

	@Override
	public void userUpdate(UserVO vo) {
		mapper.userUpdate(vo);
	}

	@Override
	public void userDelete(String id, String pw) {
		mapper.userDelete(id, pw);
	}

	@Override
	public UserVO userLogin(String id, String pw) {
		return userLogin(id, pw);
	}

}
