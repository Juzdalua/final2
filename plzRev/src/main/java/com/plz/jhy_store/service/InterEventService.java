package com.plz.jhy_store.service;

import java.util.HashMap;
import java.util.List;

import com.plz.jhy_store.model.ImgVO;

public interface InterEventService {

	List<ImgVO> showEvent(HashMap<String, Object> num); //===이벤트 보여주기 ====

	int totalIngCount(); // === 총 진행하고 있는 이벤트 갯수 세기 ===
	
	int totalEndCount(); // === 총 종료된 이벤트 갯수 세기 ===
	
	HashMap<String, String> eventDetail(String name); // ==== 이벤트 상세보기 ====

	String checkDownLoad(HashMap<String, String> map); // ==== 이미 다운로드 한 기록이 있는지 확인하기 ==== 
	
	int downLoadCoupon(HashMap<String, String> map); // ==== 쿠폰 다운로드 하기 ==== 

	List<HashMap<String, String>> showBestStore(); // ==== 인기 매점 상품 보여주기 ====

	List<HashMap<String, String>> showSnackStore(); // ==== 스낵 상품 보여주기 ====

	List<HashMap<String, String>> showMovieStore(); // ==== 영화이용권 보여주기 ====

	HashMap<String, String> storeDetail(String name); // ==== 스토어 상세 페이지 보여주기 ====

	int buyEnd(HashMap<String, Object> map); // ==== 구매등록하기 =====
	



}
