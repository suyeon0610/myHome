package com.spring.myWeb.quiz.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuizPageVO {
	
	private int pageNum; //현재 페이지 번호
	private int countPerPage; //한 페이지 당 게시물 수
	private String condition;
	private String keyword; 
	
	public QuizPageVO() {
		this.pageNum = 1;
		this.countPerPage = 10;	
	}

}
