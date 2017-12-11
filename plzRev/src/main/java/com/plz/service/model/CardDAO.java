package com.plz.service.model;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Category;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CardDAO implements ICardDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> getAllcardList() {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.getAllcardList");
		return list;
	}

	@Override
	public List<HashMap<String, String>> getcardcompany() {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.getcardcompany");
		return list;
	}

	@Override
	public List<HashMap<String, String>> cardSearch(HashMap<String, String> map) {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.cardSearch", map);
		return list;
	}
	


	




	
}
