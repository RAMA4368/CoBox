package com.koreait.cobox.model.comments.repository;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.CommentsDeleteException;
import com.koreait.cobox.exception.CommentsRegistException;
import com.koreait.cobox.model.domain.Comments;
@Repository
public class MybatisCommentsDAO implements CommentsDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List selectAll(int movie_id) {
		return sqlSessionTemplate.selectList("Comments.selectAll",movie_id);
	}

	@Override
	public int insert(Comments comments) throws CommentsRegistException{
		int result= sqlSessionTemplate.insert("Comments.insert",comments);
		if(result==0) {
			throw new CommentsRegistException("로그인이 필요한 서비스입니다.");
		}
		return result;
	}

	@Override
	public int delete(int comments_id) throws CommentsDeleteException{
		int result = sqlSessionTemplate.delete("Comments.delete",comments_id);
		if(result==0) {
			throw new CommentsDeleteException("로그인이 필요한 서비스입니다.");
		}
		return result;
		
	}

}
