
package com.koreait.cobox.model.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class Pager {
	private List list;
	private int totalRecord; //전체 게시물수
	private int pageSize = 5; //한페이지당 보여줄 블
	private int totalPage; //전체 페이지 수
	private int blockSize = 5;// [1][2][3][4][5] ...한페이지당 블럭 수
	private int currentPage = 1; //처음에 보여줄 현재 페이지
	private int firstPage; //첫번째 페이지 [1]
	private int lastPage; //마지막 페이지[5]
	private int curPos; //페이지별 시작하는 게시물number ex)현재 2page라면 6,7,8,9,10  
	private int num; //게시물 number

	public List getList() {
		return list;
	}

	public void init(HttpServletRequest request, List list) {
		this.list = list;
		totalRecord = list.size();
		totalPage = (int) Math.ceil((float) totalRecord / pageSize);

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		firstPage = currentPage - (currentPage - 1) % blockSize;
		lastPage = firstPage + (blockSize - 1);
		curPos = (currentPage - 1) * pageSize;
		num = totalRecord - curPos;
	}
}