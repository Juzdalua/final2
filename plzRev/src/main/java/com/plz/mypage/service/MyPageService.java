package com.plz.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.mypage.model.InterMyPageDAO;

@Service
public class MyPageService implements InterMyPageService {

	@Autowired
	private InterMyPageDAO dao;

	@Override
	public List<HashMap<String, String>> getCouponList(HashMap<String, Object> map) {
		List<HashMap<String, String>> couponList = dao.getCouponList(map);
		return couponList;
	}

	@Override
	public int getTotalCntCoupon(String email) {
		int totalcnt = dao.getTotalCntCoupon(email);
		return totalcnt;
	}

	@Override
	public int getcntMovieCoupon(String email) {
		int totalcnt = dao.getcntMovieCoupon(email);
		return totalcnt;
	}

	@Override
	public int getcntStoreCoupon(String email) {
		int totalcnt = dao.getcntStoreCoupon(email);
		return totalcnt;
	}

	@Override
	public int getSerMovieCoupon(String email) {
		int totalcnt = dao.getSerMovieCoupon(email);
		return totalcnt;
	}

	@Override
	public int getserStoreCoupon(String email) {
		int totalcnt = dao.getserStoreCoupon(email);
		return totalcnt;
	}

	@Override
	public HashMap<String, String> getCouponDetail(HashMap<String, String> map) {
		HashMap<String, String> getCouponDetail = dao.getCouponDetail(map);
		return getCouponDetail;
	}
	
	public List<HashMap<String, String>> getQnaList(HashMap<String, Object> map) {
		List<HashMap<String, String>> qnaList = dao.getQnaList(map);
		return qnaList;
	}

	@Override
	public int getTotalCntQna(String email) {
		int totalcnt = dao.getTotalCntQna(email);
		return totalcnt;
	}

	@Override
	public HashMap<String, String> getQnaDetail(String serviceno) {
		HashMap<String, String> qnavo = dao.getQnaDetail(serviceno);
		return qnavo;

	}

	@Override
	public int getTotalCntRev(String email) {
		int totalcnt = dao.getTotalCntRev(email);
		return totalcnt;
	}

	@Override
	public List<HashMap<String, String>> getRevList(HashMap<String, Object> map) {
		List<HashMap<String, String>> reviewList = dao.getRevList(map);
		return reviewList;
	}

	@Override
	public int deleteReview(String reviewno) {
		int n = dao.deleteReview(reviewno);
		return n;
	}

	@Override
	public int changePasswd(HashMap<String, String> map) {
		int n = dao.changePasswd(map);
		return n;
	}
	
}
