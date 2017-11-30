package com.plz.khk.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TheaterDAO implements InterTheaterDAO {

	// ==== 의존객체 주입하기(DI : Dependency Injection) ====
	@Autowired
	private SqlSessionTemplate sqlsession;	
	
	// 지역 선택시 해당 지역의 영화관 보여주기 
	@Override
	public List<TheaterVO> TheaterList() {
	 	List<TheaterVO> showTheaterList = sqlsession.selectList("theater.TheaterList");
		return showTheaterList;
	}

}
