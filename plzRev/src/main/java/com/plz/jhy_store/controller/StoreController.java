package com.plz.jhy_store.controller;

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

import com.plz.jhy_store.model.ImgVO;
import com.plz.jhy_store.service.InterEventService;
import com.plz.member.model.MemberVO;

@Component
@Controller
public class StoreController {
	
	@Autowired
	private InterEventService service;
	
	// ====  이벤트 페이지. =====
	@RequestMapping(value="/event.pz",method={RequestMethod.GET})
	public String event(HttpServletRequest req){
		int totalIngCount = service.totalIngCount();
		int totalEndCount = service.totalEndCount();
		
		req.setAttribute("totalIngCount", totalIngCount);
		req.setAttribute("totalEndCount", totalEndCount);
		
		return "event/event.tiles";
	}
	
	// ====  AJAX, 더보기 =====
	@RequestMapping(value="/eventJSON.pz",method={RequestMethod.GET})
	public String eventJSON(HttpServletRequest req){
		
		String start = req.getParameter("start");
		String len = req.getParameter("len");
		String status =req.getParameter("status");
		
		if (start.trim().isEmpty()) {
			start = "1";
		}
		if (len.trim().isEmpty()) {
			len = "4";
		}
		int startrno = Integer.parseInt(start);              // 시작 행번호
		int endrno = startrno + (Integer.parseInt(len) - 1); // 끝 행번호
		
		HashMap<String, Object> num = new HashMap<String, Object>();
		num.put("startrno", startrno);
		num.put("endrno", endrno);
		num.put("status", status);
		JSONArray jsonMap = new JSONArray();

		
		List<ImgVO> list = service.showEvent(num);	
			if (list != null) {
				for(ImgVO vo : list) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("name", vo.getName());
					jsonObj.put("img_main", vo.getImg_main());
					jsonObj.put("img_detail", vo.getImg_detail());
					jsonMap.put(jsonObj);
				}
		
		}
	
		String str_jsonMap = jsonMap.toString();
		req.setAttribute("str_jsonMap", str_jsonMap);

		return "eventJSON.notiles";
		
	}
	

	// ==== 이벤트 상세정보보기 ====
	@RequestMapping(value="/eventDetail.pz",method={RequestMethod.GET})
	public String  eventDetail(HttpServletRequest req){
		
		String name = req.getParameter("name");
		
		HashMap<String,String> detail = service.eventDetail(name);
		
		req.setAttribute("detail", detail);
		
		return "event/eventDetail.tiles";
	}
	
	// ==== 쿠폰 다운로드하기  ====
	@RequestMapping(value="/download.pz",method={RequestMethod.POST})
	public String requireLogin_downLoad(HttpServletRequest req,  HttpServletResponse res, HttpSession session){
		
		String store_eventno = req.getParameter("store_eventno"); //다운로드할 이벤트 번호
		String price = req.getParameter("coupon_price");
		MemberVO loginuser =(MemberVO)session.getAttribute("loginuser");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("store_eventno", store_eventno);
		map.put("email", loginuser.getEmail());
		map.put("price", price);
		
		String result =service.checkDownLoad(map);
		int n =0;
		System.out.println(result);
		if("0".equals(result)){
			n = service.downLoadCoupon(map);
			
			req.setAttribute("n", n);
				
			return "event/downloadEnd.tiles";	
			
		}else{
			String msg = "이미 다운로드한 쿠폰 입니다.";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}

	
	}
	
	
	// ====  스토어 페이지. =====
	@RequestMapping(value="/store.pz",method={RequestMethod.GET})
	public String store(HttpServletRequest req){
		
		List<HashMap<String, String>> bestList = service.showBestStore();
		
		List<HashMap<String, String>> snackList = service.showSnackStore();
		
		List<HashMap<String, String>> movieList = service.showMovieStore();
		
		req.setAttribute("bestList", bestList);
		req.setAttribute("snackList", snackList);
		req.setAttribute("movieList", movieList);
		
		
		return "event/store.tiles";
	}
	
	// ==== 스토어 상세 페이지 보여주기 =====
	@RequestMapping(value="/storeDetail.pz",method={RequestMethod.GET})
	public String storeDetail(HttpServletRequest req){
			
		
		String name = req.getParameter("name");
		
		HashMap<String,String> detail = service.storeDetail(name);
		
		req.setAttribute("detail", detail);
	

		return "event/storeDetail.tiles";
	}
	
	// ==== 스토어 상세 페이지 보여주기 =====
	@RequestMapping(value="/totalMoneyAjax.pz",method={RequestMethod.GET})
	public String totalMoneyAjax(HttpServletRequest req){
		
		String str_rqty = req.getParameter("rqty");
		
		String str_coupon_price = req.getParameter("coupon_price");
		
		if(str_rqty!=null && str_coupon_price!=null){
			
			int rqty = Integer.parseInt(str_rqty);
			int coupon_price = Integer.parseInt(str_coupon_price);
			
			int totalMoeny = rqty * coupon_price;
			
			req.setAttribute("totalMoeny", totalMoeny);
			
			return "storeDetailAjax.notiles";
					
		}else{
			
			String msg = "잘못 입력되었습니다..";
			String loc = "javascript:history.back();";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
			
			
		}
		
	}	
	// ==== 구매등록하기 =====
		@RequestMapping(value="/buyEnd.pz",method={RequestMethod.POST})
		public String buyEnd(HttpServletRequest req,HttpServletResponse res, HttpSession session){
			
			String store_eventno = req.getParameter("store_eventno"); //다운로드할 이벤트 번호
			int price = Integer.parseInt(req.getParameter("coupon_price"));
			MemberVO loginuser =(MemberVO)session.getAttribute("loginuser");
			int rqty = Integer.parseInt(req.getParameter("rqty"));
			
			int n=0;
			for(int i=0; i<rqty;i++){
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("store_eventno", store_eventno);
				map.put("email", loginuser.getEmail());
				map.put("price", price);
				
				n += service.buyEnd(map);
				System.out.println(n);
			
			}
			
			if(n==rqty){
				req.setAttribute("result", "1");	
			}else{
				req.setAttribute("result","0");
			}
				
			
			return "event/buyEnd.tiles";
						
			
		}	
	
	

}
