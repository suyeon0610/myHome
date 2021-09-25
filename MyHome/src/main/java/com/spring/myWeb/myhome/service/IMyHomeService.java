package com.spring.myWeb.myhome.service;

import java.util.List;

import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.myhome.util.PageVO;

public interface IMyHomeService {

	//글 등록
	void regist(MyHomeVO vo);
	
	//글 목록 조회
	List<MyHomeVO> getList(PageVO paging);
	
	//글 상세 조회
	MyHomeVO getDetail(int bno);
	
	//총 게시물 수
	int getTotalArticles(PageVO paging);
	
	//글 수정
	void update(MyHomeVO vo);
	
	//글 삭제
	void delete(int bno); 
	
}
