package com.spring.myWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.myWeb.command.AnswerVO;
import com.spring.myWeb.quiz.service.IAnswerService;
import com.spring.myWeb.quiz.util.QuizPageCreator;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private IAnswerService service;
	
	@PostMapping("/answerRegist")
	public String regist(@RequestBody AnswerVO vo) {
		System.out.println("/answer/answerRegist: POST");
		
		service.regist(vo);
		return "registSuccess";
	}
	
	@GetMapping("/answerList/{quizNum}/{pageNum}")
	public String getList(@PathVariable int quizNum, @PathVariable int pageNum ) {
		System.out.println("/answer/answerList: GET");
		
		QuizPageVO paging = new QuizPageVO();
		paging.setPageNum(pageNum);
		paging.setCountPerPage(5);
		
		QuizPageCreator qpc = new QuizPageCreator();
		qpc.setPage(paging);
		qpc.setPageTotalCount(service.getTotalCount(quizNum));
		
		service.getList(quizNum, paging);
		return "regitSuccess"; //비동기
	}
	
	@PostMapping("/answerDelete")
	public String delete(@RequestBody int answerNum) {
		System.out.println("/answer/answerDelete: POST");
		
		return "delSuccess";
	}
	
}
