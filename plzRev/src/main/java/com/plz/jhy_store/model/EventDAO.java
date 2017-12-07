package com.plz.jhy_store.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO implements InterEventDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;

	//=== 이벤트 보여주기 ====
	@Override
	public List<ImgVO> showEvent(HashMap<String, Object> num) {
		
		List<ImgVO> list = sqlsession.selectList("plz.showEvent",num);
		
		return list;
	}
	
	//=== 총 진행중인 이벤트 갯수 세기 ====
	@Override
	public int totalIngCount() {
		int n = sqlsession.selectOne("plz.totalIngCount");
		return n;
	}
	
	//=== 총 종료된 이벤트 갯수 세기 ====
	@Override
	public int totalEndCount() {
		int n = sqlsession.selectOne("plz.totalEndCount");
		return n;
	}
	
	//=== 이벤트 상세정보 보여주기 ====
	@Override
	public HashMap<String, String> eventDetail(String name) {
		
		HashMap<String, String> detail = sqlsession.selectOne("plz.eventDetail",name);
		
		return detail;
	}

	 // ==== 이미 다운로드 한 기록이 있는지 확인하기 ==== 
	@Override
	public String checkDownLoad(HashMap<String, String> map) {
		String n = sqlsession.selectOne("plz.checkDownLoad",map);
		return n;
	}
	
	// ==== 쿠폰등록하기  ====
	@Override
	public int downLoadCoupon(HashMap<String, String> map) {
		int n = sqlsession.insert("plz.downLoadCoupon",map);
		return n;
	}

	 // ==== 인기 매점 상품 보여주기 ====
	@Override
	public List<HashMap<String, String>> showBestStore() {
	
		List<HashMap<String, String>> list = sqlsession.selectList("plz.showBestStore");
		
		return list;
	}

	// ==== 스낵 상품 보여주기 ====
	@Override
	public List<HashMap<String, String>> showSnackStore() {
		
		List<HashMap<String, String>> list = sqlsession.selectList("plz.showSnackStore");
		
		return list;
	}
	
	// ==== 영화이용권 보여주기 ====
	@Override
	public List<HashMap<String, String>> showMovieStore() {

		List<HashMap<String, String>> list = sqlsession.selectList("plz.showMovieStore");
		
		return list;
	}
	
	// ==== 스토어 상세 페이지 보여주기 ====
	@Override
	public HashMap<String, String> storeDetail(String name) {
		
		HashMap<String, String> detail = sqlsession.selectOne("plz.storeDetail",name);
		
		return detail;
	}

	// ==== 구매등록하기 =====
	@Override
	public int buyEnd(HashMap<String, Object> map) {
		int n = sqlsession.insert("plz.buyEnd",map);
		return n;
	}





}
