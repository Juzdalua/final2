package com.plz.jhy_store.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.jhy_store.model.ImgVO;
import com.plz.jhy_store.model.InterEventDAO;

@Service
public class EventService implements InterEventService {
	
	@Autowired
	private InterEventDAO dao;
	
	//===  이벤트 보여주기 ====
	@Override
	public List<ImgVO> showEvent(HashMap<String, Object> num) {
		
		List<ImgVO> list = dao.showEvent(num);
		return list;
	}

	// === 총 진행중인 이벤트 갯수 세기 ==== 
	@Override
	public int totalIngCount() {
		int n =dao.totalIngCount();
		return n;
	}
	
	// === 총 종료된 이벤트 갯수 세기 ==== 
	@Override
	public int totalEndCount() {
		int n =dao.totalEndCount();
		return n;
	}
	
	//=== 이벤트 디테일 보여주기 ====
	@Override
	public HashMap<String, String> eventDetail(String name) {
		HashMap<String, String> detail = dao.eventDetail(name);
		return detail;
	}
	
	// ==== 이미 다운로드 한 기록이 있는지 확인하기 ==== 
	@Override
	public String checkDownLoad(HashMap<String, String> map) {
		String n =dao.checkDownLoad(map);
		return n;
	}
	
	 // ==== 쿠폰 다운로드 하기 ==== 
	@Override
	public int downLoadCoupon(HashMap<String, String> map) {
		int n =dao.downLoadCoupon(map);
		return n;
	}

	 // ==== 인기 매점 상품 보여주기 ====
	@Override
	public List<HashMap<String, String>>  showBestStore() {
		
		List<HashMap<String, String>> mapList = dao.showBestStore();
		return mapList;
	}

	 // ==== 스낵 상품 보여주기 ====
	@Override
	public List<HashMap<String, String>> showSnackStore() {
		List<HashMap<String, String>> mapList = dao.showSnackStore();
		return mapList;
	}
	
	// ==== 영화이용권 보여주기 ====
	@Override
	public List<HashMap<String, String>> showMovieStore() {
		List<HashMap<String, String>> mapList = dao.showMovieStore();
		return mapList;
	}
	
	// ==== 스토어 상세 페이지 보여주기 ====
	@Override
	public HashMap<String, String> storeDetail(String name) {
		HashMap<String, String> detail = dao.storeDetail(name);
		return detail;
	}
	
	// ==== 구매등록하기 =====
	@Override
	public int buyEnd(HashMap<String, Object> map) {
		int n =dao.buyEnd(map);
		return n;
	}



}
