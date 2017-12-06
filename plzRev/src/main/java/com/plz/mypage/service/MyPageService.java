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
	
}
