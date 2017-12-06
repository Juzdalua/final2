package com.plz.mypage.model;

import java.util.HashMap;
import java.util.List;

public interface InterMyPageDAO {

	List<HashMap<String, String>> getCouponList(HashMap<String, Object> map);	//쿠폰리스트 얻어오기

	int getTotalCntCoupon(String email);	//쿠폰리스트 전체갯수 얻어오기

	int getcntMovieCoupon(String email);

	int getcntStoreCoupon(String email);

	int getSerMovieCoupon(String email);

	int getserStoreCoupon(String email);

	HashMap<String, String> getCouponDetail(HashMap<String, String> map);

	List<HashMap<String, String>> getQnaList(HashMap<String, Object> map); // 문의내역 리스트 얻어오기

	int getTotalCntQna(String email);

	HashMap<String, String> getQnaDetail(String serviceno);
	
}
