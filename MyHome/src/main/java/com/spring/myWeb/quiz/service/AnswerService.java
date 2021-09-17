package com.spring.myWeb.quiz.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.AnswerVO;
import com.spring.myWeb.quiz.mapper.IAnswerMapper;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Service
public class AnswerService implements IAnswerService {

	@Autowired
	private IAnswerMapper mapper;
	
	@Override
	public void regist(AnswerVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, Object> getList(int quizNum, QuizPageVO paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(AnswerVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int answerNum) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getTotalCount(int quizNum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
