package com.koreait.cobox.model.snack.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.SnackDeleteFailException;
import com.koreait.cobox.exception.SnackRegistException;
import com.koreait.cobox.exception.SnackUpdateFailException;
import com.koreait.cobox.model.domain.Snack;

@Repository
public class MybatisSnackDAO implements SnackDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Snack.selectAll");
	}
	
	@Override
	public List selectById(int topcategory_id) {
		return sqlSessionTemplate.selectList("Snack.selectByTopCategoryId", topcategory_id);
	}
	
	@Override
	public Snack select(int snack_id) {
		return sqlSessionTemplate.selectOne("Snack.select", snack_id);
	}

	@Override
	public void insert(Snack snack) throws SnackRegistException{
		int result = sqlSessionTemplate.insert("Snack.insert", snack);
		if(result==0) {
			throw new SnackRegistException("스넥테이블에 입력실패");
		}
	}

	@Override
	public void update(Snack snack) throws SnackUpdateFailException{
		int result = sqlSessionTemplate.update("Snack.update", snack);
		if(result==0) {
			throw new SnackUpdateFailException("스낵 정보 수정에 실패했습니다");
		}
	}

	@Override
	public void delete(int snack_id) throws SnackDeleteFailException{
		int result = sqlSessionTemplate.delete("Snack.delete", snack_id);
		if(result==0) {
			throw new SnackDeleteFailException("스낵 정보 삭제에 실패했습니다");
		}
		
	}

}
