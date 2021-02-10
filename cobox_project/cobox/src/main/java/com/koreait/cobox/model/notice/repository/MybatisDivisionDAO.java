package com.koreait.cobox.model.notice.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.model.domain.Division;

@Repository
public class MybatisDivisionDAO implements DivisionDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Division> selectAll() {
		return sqlSessionTemplate.selectList("Division.selectAll");
	}

	@Override
	public String select(int division_id) {
		return sqlSessionTemplate.selectOne("Division.selectByDivisionId", division_id);
	}
}
