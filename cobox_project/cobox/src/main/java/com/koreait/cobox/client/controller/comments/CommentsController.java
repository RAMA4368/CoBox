package com.koreait.cobox.client.controller.comments;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.admin.controller.AdminMovieController;

import com.koreait.cobox.exception.CommentsDeleteException;
import com.koreait.cobox.exception.CommentsRegistException;
import com.koreait.cobox.exception.DMLException;
import com.koreait.cobox.exception.McartException;
import com.koreait.cobox.model.comments.repository.CommentsDAO;
import com.koreait.cobox.model.comments.repository.MybatisCommentsDAO;
import com.koreait.cobox.model.comments.service.CommentsService;
import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.domain.Comments;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.domain.Movie;
import com.koreait.cobox.model.movie.repository.MovieDAO;

@Controller
public class CommentsController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMovieController.class);
	@Autowired
	private MovieDAO movieDAO;
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private CommentsService commentsService;
	
	
	//댓글 insert
	
	@RequestMapping(value="/comments/json",method=RequestMethod.POST,produces="text/html;charset=utf8")
	@ResponseBody
	public String commentsRegist(HttpSession session,HttpServletRequest request, Comments comments) {
		Member member=(Member)session.getAttribute("member");
		if(session.getAttribute("member")==null) {
			   throw new CommentsRegistException("로그인이 필요한 서비스입니다");
		   }
		
		String movie_id=request.getParameter("movie_id");
		String msg=request.getParameter("msg");
		
		logger.debug(movie_id);
		logger.debug(msg);

		comments.setMovie_id(Integer.parseInt(movie_id));
		comments.setMsg(msg);
		comments.setMember_name(member.getName());
		
		commentsDAO.insert(comments);
		
		StringBuilder sb=new StringBuilder();
		sb.append("{");
		sb.append("\"result\":1,");
		sb.append("\"msg\":\"댓글등록성공\"");
		sb.append("}");
		
		return sb.toString();
	}
	
	//댓글 목록 가져오기
	@RequestMapping(value="/comments/list",method=RequestMethod.GET)
	@ResponseBody
	public List CommentsList(HttpServletRequest request, int movie_id) {
		List<Comments> commentsList = commentsService.selectAll(movie_id);
		return commentsList;
	}
	//댓글 한건 삭제하기 //responseBody가 있어야 비동기 작동 가능, 안적어줘서 계속 sb가 날라가지 못함.
	@RequestMapping(value="/comments/delete",method=RequestMethod.GET,produces="text/html;charset=utf8")
	@ResponseBody
	public String delete(HttpSession session,int comments_id,int movie_id,String member_name) {
		logger.debug("jsp에서 넘어온 삭제하려는 댓글의 member_name은"+member_name); 
		logger.debug("삭제하려고 하는 comments_id는"+comments_id);
		Member member = (Member)session.getAttribute("member"); //로그인한 사람의 session을 가져오자!
		if(session.getAttribute("member")==null) {
			throw new CommentsDeleteException("로그인 후 본인이 쓴 글만 삭제 가능합니다.");
		}
		String name = member.getName();
		logger.debug("현재 로그인된 세션의 name은 " +name);
		StringBuilder sb=null;
		 if(member_name.equals(name)) { //jsp에서 넘어온 member_name과 session의 name이 같다면
			 logger.debug("movie_id는"+movie_id);
			 logger.debug("comments_id는"+comments_id);
			 
			 int result=commentsDAO.delete(comments_id);
			 
			 sb=new StringBuilder();
			 sb.append("{");
			 sb.append("\"result\":1,");
			 sb.append("\"msg\":\"댓글삭제성공\"");
			 sb.append("}");
		 }else {
			 throw new CommentsDeleteException("본인이 쓴 글만 삭제 가능합니다.");
		 }
		return sb.toString();
		
	}
	//영화 댓글 등록 예외처리(관련 메서드와 return 자료형이 같아야 한다.)안맞추면 콘솔창에 예외처리가 됨.
	@ExceptionHandler(CommentsRegistException.class)
	@ResponseBody
	public String handleException(CommentsRegistException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append(" \"result\":0, ");
		sb.append(" \"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		
		return sb.toString();
	}
	//영화 댓글 삭제 예외처리 
	@ExceptionHandler(CommentsDeleteException.class)
	@ResponseBody
	public String handlerException(CommentsDeleteException e) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append(" \"result\":0, ");
		sb.append(" \"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		
		return sb.toString();
	}

}
