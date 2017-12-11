package com.plz.service.model;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Category;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAO implements IServiceDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> faqList() {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.faqList");
		return list;
	}

	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> map) {
		List<HashMap<String, String>> noticeList = sqlsession.selectList("plz.getNoticeList", map);
		return noticeList;
	}
	

	@Override
	public List<HashMap<String, String>> getNoticeList2(HashMap<String, String> map) {
		List<HashMap<String, String>> noticeList = sqlsession.selectList("plz.getNoticeList2",map);
		return noticeList;
	}


	@Override
	public List<HashMap<String, String>> getCodeList() {
		List<HashMap<String, String>> faqList = sqlsession.selectList("plz.getCodeList");
		return faqList;
	}

	@Override
	public List<HashMap<String, String>> getcategoryCodeList(String categorycode) {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.getcategoryCodeList", categorycode);
		return list;
	}

	@Override
	public List<HashMap<String, String>> faqListSearch(String search) {
		List<HashMap<String, String>> faqList = sqlsession.selectList("plz.faqListSearch", search);
		return faqList;
	}

	@Override
	public List<HashMap<String, String>> getNoticeCategoryList() {
		List<HashMap<String, String>> noticeCategory = sqlsession.selectList("plz.getNoticeCategoryList");
		return noticeCategory;
	}

	@Override
	public int getTotalCount1() {
		int count = sqlsession.selectOne("plz.getTotalCount1");
		return count;
	}

	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = sqlsession.selectOne("plz.getTotalCount2", map);
		return count;
	}

	@Override
	public List<HashMap<String, String>> getMovieList(String regionno) {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.getMovieList", regionno);
		return list;
	}

	@Override
	public List<HashMap<String, String>> movieList(String search) {
		List<HashMap<String, String>> list = sqlsession.selectList("plz.movieList", search);
		return list;
	
	}

	@Override
	public HashMap<String, String> showNoticeDetail(String serviceno) {
		HashMap<String, String> noticevo = sqlsession.selectOne("plz.showNoticeDetail",serviceno);
		return noticevo;
	}

	@Override
	public void setAddReadCount(String serviceno) {
		sqlsession.update("plz.setAddReadCount",serviceno);
	}






	
}
