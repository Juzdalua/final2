package com.plz.khk.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegionDAO implements InterRegionDAO {

	// ==== 의존객체 주입하기(DI : Dependency Injection) ====
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<RegionVO> regionList() {
		List<RegionVO> list = sqlsession.selectList("theater.regionList");
		return list;
	}

}
