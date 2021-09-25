package com.spring.myWeb.myhome.util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVO {
	
	//페이지 정보 관련
	private int nowPage;
	private int countPerPage;
	
	//정렬 관련
	private int sort;
	private String homeForm;
	private String money;
	private String homeSize;
	
	public PageVO() {		
		this.nowPage = 1;
		this.countPerPage = 9;
		this.sort = 1;
	}

}
