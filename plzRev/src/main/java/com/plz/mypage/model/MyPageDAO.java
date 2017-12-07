package com.plz.mypage.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO implements InterMyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, String>> getCouponList(HashMap<String, Object> map) {
		List<HashMap<String, String>> couponList = sqlsession.selectList("mypage.getCouponList", map);
		return couponList;
	}

	@Override
	public int getTotalCntCoupon(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getTotalCntCoupon", email);
		return totalcnt;
	}

	@Override
	public int getcntMovieCoupon(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getcntMovieCoupon", email);
		return totalcnt;
	}

	@Override
	public int getcntStoreCoupon(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getcntStoreCoupon", email);
		return totalcnt;
	}

	@Override
	public int getSerMovieCoupon(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getSerMovieCoupon", email);
		return totalcnt;
	}

	@Override
	public int getserStoreCoupon(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getserStoreCoupon", email);
		return totalcnt;
	}

	@Override
	public HashMap<String, String> getCouponDetail(HashMap<String, String> map) {
		HashMap<String, String> getCouponDetail = sqlsession.selectOne("mypage.getCouponDetail", map);
		return getCouponDetail;
	}
	
	public List<HashMap<String, String>> getQnaList(HashMap<String, Object> map) {
		List<HashMap<String, String>> qnaList = sqlsession.selectList("mypage.getQnaList", map);
		return qnaList;
	}

	@Override
	public int getTotalCntQna(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getTotalCntQna", email);
		return totalcnt;
	}

	@Override
	public HashMap<String, String> getQnaDetail(String serviceno) {
		HashMap<String, String> qnavo = sqlsession.selectOne("mypage.getQnaDetail", serviceno);
		return qnavo;
	}

	@Override
	public int getTotalCntPoint(String email) {
		int cnt = sqlsession.selectOne("mypage.getTotalCntPoint", email);
		return cnt;
	}

	@Override
	public int getTotalCntPoint7(String email) {
		int cnt = sqlsession.selectOne("mypage.getCntPointF", email);
		return cnt;
	}

	@Override
	public int getTotalCntPoint30(String email) {
		int cnt = sqlsession.selectOne("mypage.getCntPointS", email);
		return cnt;
	}

	@Override
	public int getTotalCntPoint90(String email) {
		int cnt = sqlsession.selectOne("mypage.getCntPointT", email);
		return cnt;
	}

	@Override
	public List<HashMap<String, String>> getPointList(HashMap<String, Object> map) {
		List<HashMap<String, String>> List = sqlsession.selectList("mypage.getPointList", map);
		return List;
	}
	
	@Override
	public int getTotalCntRev(String email) {
		int totalcnt = sqlsession.selectOne("mypage.getTotalCntRev", email);
		return totalcnt;
	}

	@Override
	public List<HashMap<String, String>> getRevList(HashMap<String, Object> map) {
		List<HashMap<String, String>> reviewList = sqlsession.selectList("mypage.getRevList", map);
		return reviewList;
	}

	@Override
	public int deleteReview(String reviewno) {
		int n = sqlsession.delete("mypage.deleteReview", reviewno);
		return n;
	}

	@Override
	public int changePasswd(HashMap<String, String> map) {
		int n = sqlsession.update("mypage.changePasswd", map);
		return n;
	}
	
}


















