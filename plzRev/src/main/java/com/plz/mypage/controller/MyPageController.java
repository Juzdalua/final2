package com.plz.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.member.model.MemberVO;
import com.plz.mypage.service.InterMyPageService;

// ==== Controller 선언 ==== 
@Controller
@Component
/*
    XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면 
    해당 클래스는 bean 으로 자동 등록된다. 
    그리고 bean 의 이름(첫글자는 소문자)은 해당 클래스명이 된다.
 */
public class MyPageController {

   // ==== 의존객체 주입하기(DI : Dependency Injection)====
   @Autowired
   private InterMyPageService service;
   
   
   // ===== 마이페이지 요청 =====
   @RequestMapping(value="/mypage.pz",method={RequestMethod.GET})
   public String requireLogin_mypage(HttpServletRequest req, HttpServletResponse response, HttpSession session){
	   
	   MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	   
	   String name = loginuser.getName();
	   int point = loginuser.getPoint();
	   String email = loginuser.getEmail();

	   //쿠폰 리스트 전체 갯수 얻어오기
	   int totalcntCoupon = service.getTotalCntCoupon(email);
	   
	   //영화티켓 관련 쿠폰 리스트 갯수 얻어오기
	   int cntMovieCoupon = service.getcntMovieCoupon(email);
	   
	   //매점 관련 쿠폰 리스트 갯수 얻어오기
	   int cntStoreCoupon = service.getcntStoreCoupon(email);
	   
	   //사용가능한 영화쿠폰
	   int SerMovieCoupon = service.getSerMovieCoupon(email);
	   
	   //사용가능한 매점쿠폰
	   int serStoreCoupon = service.getserStoreCoupon(email);
	   
	   //문의 내역 리스트 갯수 얻어오기
	   int totalcntQna = service.getTotalCntQna(email);
	   

	   req.setAttribute("totalcntCoupon", totalcntCoupon);
	   req.setAttribute("cntMovieCoupon", cntMovieCoupon);
	   req.setAttribute("cntStoreCoupon", cntStoreCoupon);
	   
	   req.setAttribute("SerMovieCoupon", SerMovieCoupon);
	   req.setAttribute("serStoreCoupon", serStoreCoupon);
	   
	   req.setAttribute("totalcntQna", totalcntQna);
		  
	   req.setAttribute("email", email);
	   session.setAttribute("loginuser", loginuser);
	   req.setAttribute("name", name);
	   req.setAttribute("point", point);
	   
      return "mypage/mypage.tiles";
      
   }// end of logout(HttpSession session) --------------
   
   
   // ===== 마이페이지에서 쿠폰리스트 요청 =====
   @RequestMapping(value="/mypage_coupon.pz",method={RequestMethod.GET})
   public String mypage_coupon(HttpServletRequest req, HttpSession session){
	   	
	   String email = req.getParameter("email");
	   String start = req.getParameter("start");
	   String len = req.getParameter("len");
	   String signal = req.getParameter("category_signal");
	      
	   if (start.trim().isEmpty()) {
			// if (start == null 이 아님!!!!  start 의 값이 "" 이므로
			// 또는 if ("".equals(start.trim())) 으로 해도 된다.
		   start = "1";
	   }
		
	   if (len.trim().isEmpty()) {
			// if (len == null 이 아님!!!!  len 의 값이 "" 이므로
			// 또는 if ("".equals(len.trim())) 으로 해도 된다.
		   len = "8";
	   }
	   int startrno = Integer.parseInt(start);              // 시작 행번호
	   int endrno = startrno + (Integer.parseInt(len) - 1); // 끝 행번호
	   // 공식!! endrno = startrno + (보여줄갯수 - 1)
	   HashMap<String, Object> map = new HashMap<String, Object>();
		
	   map.put("email", email);
	   map.put("startrno", startrno);
	   map.put("endrno", endrno);
	   map.put("signal", signal);
	   /*  <!-- 1 - 영화 관람권 / 2- 매점 교환권  / 3- 영화 할인권 / 4 - 매점 할인권 / 5 - 일반 이벤트 --> */
	   // 전체목록인지, 영화관련인지, 매점관련인지 signal 값을 map으로 넘겨서 sql문을 구분한다.
	   // category_signal --> 1: 전체 / 2: 영화관련 / 3: 매점관련
	   System.out.println("email: "+email);
	   System.out.println(signal);
	   System.out.println(startrno +", "+endrno);
	   //쿠폰리스트 얻어오기
	   List<HashMap<String, String>> couponList = service.getCouponList(map);
		
	   JSONArray jsonMap = new JSONArray();
	   HashMap getValue = new HashMap();
		// rno, category, fk_name, buy_date, unable_date, discount_money, coupon_no, fk_email, status
	   
	   if (couponList != null) {
		   for(int i=0; i<couponList.size(); i++) {
			   getValue = (HashMap)couponList.get(i);
			   JSONObject jsonObj = new JSONObject();
			   
			   jsonObj.put("rno", (String)getValue.get("rno"));
			   
			   /*  <!-- 1 - 영화 관람권 / 2- 매점 교환권  / 3- 영화 할인권 / 4 - 매점 할인권 / 5 - 일반 이벤트 --> */
			   String category = (String)getValue.get("category");
			   String category_name = "";
			   if("1".equals(category)){
				   category_name = "영화 관람권";
			   }
			   else if("2".equals(category)){
				   category_name = "매점 교환권";
			   }
			   else if("3".equals(category)){
				   category_name = "영화 할인권";
			   }
			   else if("4".equals(category)){
				   category_name = "매점 할인권";
			   }
			   else if("5".equals(category)){
				   category_name = "일반 이벤트";
			   }
			   jsonObj.put("category", (String)getValue.get("category"));
			   jsonObj.put("category_name", category_name);
			   jsonObj.put("fk_name", (String)getValue.get("fk_name"));
			   jsonObj.put("buy_date", (String)getValue.get("buy_date"));
			   jsonObj.put("unable_date", (String)getValue.get("unable_date"));
			   jsonObj.put("discount_money", (String)getValue.get("discount_money"));
			   jsonObj.put("coupon_no", (String)getValue.get("coupon_no"));
			   jsonObj.put("fk_email", (String)getValue.get("fk_email"));
			   
			   String status = (String)getValue.get("status");
			   String status_name = "";
			   if("1".equals(status)){
				   status_name = "사용 가능";
			   }
			   else if("0".equals(status)){
				   status_name = "사용 불가";
			   }
			   jsonObj.put("status", (String)getValue.get("status"));
			   jsonObj.put("status_name", status_name);
			   
			   jsonMap.put(jsonObj);
		   }
	   }
	   
	   String str_jsonMap = jsonMap.toString();
	   System.out.println("");
	   System.out.println(str_jsonMap);
	   System.out.println("");
	   req.setAttribute("str_jsonMap", str_jsonMap);
	   return "couponListJSON.notiles";
      
   }// end of mypage_coupon(HttpServletRequest req) ------------------------------------------------
	
   
	// ===== 내정보수정 요청전, 비밀번호가 올바른지 확인하기 =====
	@RequestMapping(value="/editInfo.pz",method={RequestMethod.POST})
	public String editInfo(HttpServletRequest req, HttpServletResponse response, HttpSession session){
	   
	   MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	   
	   String email = loginuser.getEmail();

	   return "mypage/editInfo.tiles";
      
	}// end of logout(HttpSession session) --------------
	
	
	
	// ===== 내 포인트 사용내역 조회 =====
	@RequestMapping(value="/checkPoint.pz",method={RequestMethod.GET})
	public String checkPoint(HttpServletRequest req, HttpServletResponse response, HttpSession session){
	   
	   String email = req.getParameter("email");
	   String point = req.getParameter("point");
	   //최근 7일 사이의 포인트 사용내역 조회하기
	   
	   
	   
	   return "mypage/checkPoint.tiles";
      
	}// end of logout(HttpSession session) --------------
   
	// ===== 마이페이지에서 쿠폰리스트 요청 =====
	   @RequestMapping(value="/mypage_qna.pz",method={RequestMethod.GET})
	   public String mypage_qna(HttpServletRequest req, HttpSession session){
		   	
		   String email = req.getParameter("email");
		   String start = req.getParameter("start");
		   String len = req.getParameter("len");

		   if (start.trim().isEmpty()) {
			   start = "1";
		   }
			
		   if (len.trim().isEmpty()) {
				len = "4";
		   }
		   int startrno = Integer.parseInt(start);              // 시작 행번호
		   int endrno = startrno + (Integer.parseInt(len) - 1); // 끝 행번호
		
		   // 공식!! endrno = startrno + (보여줄갯수 - 1)
		   HashMap<String, Object> map = new HashMap<String, Object>();
			
		   map.put("email", email);
		   map.put("startrno", startrno);
		   map.put("endrno", endrno);
		 
		   System.out.println("email: "+email);
		   System.out.println(startrno +", "+endrno);
		   //문의 내역 보여주기 
		   List<HashMap<String, String>> qnaList = service.getQnaList(map);
			
		   JSONArray jsonMap = new JSONArray();
		   HashMap getValue = new HashMap();
			// rno, title, writedate, commentcount,fk_email,serviceno
		   
		   if (qnaList != null) {
			   for(int i=0; i<qnaList.size(); i++) {
				   getValue = (HashMap)qnaList.get(i);
				   
				   JSONObject jsonObj = new JSONObject();
				   
				   jsonObj.put("rno", (String)getValue.get("rno"));
				   jsonObj.put("serviceno", (String)getValue.get("serviceno"));
				   jsonObj.put("title", (String)getValue.get("title"));
				   jsonObj.put("writedate", (String)getValue.get("writedate"));
				   String status = (String)getValue.get("commentcount");
				   String status_name = "";
				   if("1".equals(status)){
					   status_name = "답변 완료";
				   }
				   else if("0".equals(status)){
					   status_name = "답변 대기중";
				   }
				   jsonObj.put("status", (String)getValue.get("status"));
				   jsonObj.put("status_name", status_name);
				   jsonObj.put("fk_email", (String)getValue.get("fk_email"));
				   
				    jsonMap.put(jsonObj);
			   }
		   }
		   
		   String str_jsonMap = jsonMap.toString();
		  
		   req.setAttribute("str_jsonMap", str_jsonMap);
		   return "qnaListJSON.notiles";
	      
	   }// end of mypage_qna(HttpServletRequest req) ------------------------------------------------
	   
		// ===== 마이페이지에서 문의 상세정보 보기 요청 =====
		@RequestMapping(value="/qnaDetail.pz",method={RequestMethod.GET})
		 public String qnaDetail(HttpServletRequest req){
		
			 String serviceno = req.getParameter("serviceno");
			 HashMap<String, String> qnavo = service.getQnaDetail(serviceno);  
			 req.setAttribute("qnavo", qnavo);
			   
			 return "qnaDetailAjax.notiles";
			 
		 }// end of qnaDetail(HttpServletRequest req) ------------------------------------------------

   
}



