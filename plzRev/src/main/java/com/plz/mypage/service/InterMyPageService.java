package com.plz.mypage.service;

import java.util.HashMap;
import java.util.List;

public interface InterMyPageService {

	List<HashMap<String, String>> getCouponList(HashMap<String, Object> map);	//쿠폰리스트 얻어오기

	int getTotalCntCoupon(String email);	//쿠폰리스트 전체갯수 얻어오기

	int getcntMovieCoupon(String email);	//영화관련 쿠폰리스트 갯수 얻어오기

	int getcntStoreCoupon(String email);	//매점 관련 쿠폰 리스트 갯수 얻어오기

	int getSerMovieCoupon(String email);	//사용가능한 영화쿠폰

	int getserStoreCoupon(String email);	//사용가능한 매점쿠폰

	HashMap<String, String> getCouponDetail(HashMap<String, String> map);

	List<HashMap<String, String>> getQnaList(HashMap<String, Object> map); //문의 내역 보여주기 

	int getTotalCntQna(String email); //문의 내역 리스트 전체갯수 얻어오기

	HashMap<String, String> getQnaDetail(String serviceno); //문의 정보 상세보기

	int getTotalCntPoint(String email);

	int getTotalCntPoint7(String email);

	int getTotalCntPoint30(String email);

	int getTotalCntPoint90(String email);

	List<HashMap<String, String>> getPointList(HashMap<String, Object> map);

	int getTotalCntRev(String email); // 리뷰 리스트 전체갯수 얻어오기

	List<HashMap<String, String>> getRevList(HashMap<String, Object> map); //리뷰 보여주기 

	int deleteReview(String reviewno); // 리뷰 삭제 요청

	int changePasswd(HashMap<String, String> map); // 내 비번 수정

	int getTotalRev(String email);

	int gettotalCancel(String email);

	List<HashMap<String, String>> getBookingList(HashMap<String, Object> map);

	
	
	

}
