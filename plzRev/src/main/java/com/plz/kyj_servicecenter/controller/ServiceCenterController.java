package com.plz.kyj_servicecenter.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.common.MyUtil;
import com.plz.kyj.service.IPlzRevService;

@Component
@Controller
public class ServiceCenterController {
	
	@Autowired
	private IPlzRevService service;
	
	//메인페이지(FAQ)
	@RequestMapping(value = "/list1.pz", method = RequestMethod.GET)
	public String list1(HttpServletRequest req) {	
	
		String categorycode = req.getParameter("categorycode");
		String search = req.getParameter("search");
		
		List<HashMap<String, String>> faqList = null;
		
		List<HashMap<String, String>> codeList = service.codeList();
		
		// 카테고리별 목록
		if(search!=null){
			faqList = service.faqListSearch(search);
		}	
		else{
			faqList = service.faqList();
		}
		
		
		
		req.setAttribute("codeList", codeList);
		req.setAttribute("faqList", faqList);
		
		
		if ( categorycode != null && !categorycode.trim().isEmpty() ) {
			req.setAttribute("categorycode", categorycode);
		}
		
		if ( search != null && !search.trim().isEmpty() ) {
			req.setAttribute("search", search);
		}
				
		
		return "service/list1.tiles";
	 }


	// FAQ 카테고리별 검색목록
	@RequestMapping(value = "/categorylist.pz", method = RequestMethod.GET)
	public String categorylist(HttpServletRequest req) {
	
		
		String categorycode = req.getParameter("categorycode");
		String search = req.getParameter("search");
		
		List<HashMap<String, String>> faqList = null;
		List<HashMap<String, String>> codeList = service.codeList();
		
		List<HashMap<String, String>> cList = service.getcategoryList(categorycode);
		
		// 카테고리별 목록
		if(search!=null){
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("categorycode", categorycode);
			map.put("search", search);
			
			faqList = service.faqListSearch(map);
		}	
		else{
			faqList = service.faqList();
		}
		
		req.setAttribute("search", search);
		req.setAttribute("codeList", codeList);
		req.setAttribute("faqList", faqList);
		req.setAttribute("categorycode", categorycode);
		req.setAttribute("cList", cList);
		
		return "service/categorylist.tiles";
		
	}


	//공지사항
	@RequestMapping(value = "/list2.pz", method = RequestMethod.GET)
	public String list2(HttpServletRequest req, HttpSession session) {		
		
		List<HashMap<String, String>> noticeList = null;
		
		List<HashMap<String, String>> noticeCategory = service.getNoticeCategoryList();
		req.setAttribute("noticeCategory", noticeCategory);
		
		// 돌아갈 페이지를 위해서 현재페이지의 주소를 뷰단으로 넘겨준다.
		String gobackURL = MyUtil.getCurrentURL(req);	
		req.setAttribute("gobackURL", gobackURL);
		
		session.setAttribute("readCountPermission", "yes");
		
		String title = req.getParameter("title");
		String search = req.getParameter("search");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("title", title);
		map.put("search", search);
		
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		
		int totalCount = 0; 		// 총게시물 건수
		int sizePerPage = 5;		// 한페이지당 보여줄 글갯수
		int currentShowPageNo = 0;	// 현재 보여주는 페이지번호에서, 초기치는 1페이지로 한다.
		int totalPage = 0;			// 총페이지 수(웹브라우저 상에 보여줄 총 페이지수)
		
		int startRno = 0;			// 시작 행 번호
		int endRno = 0;				// 끝 행 번호
		
		int blockSize = 5;			// "페이지바"에 보여줄 페이지의 갯수
		
		if(str_currentShowPageNo == null) {
			// 게시판의 초기화면
			currentShowPageNo = 1;
		}
		else {
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
		}
		
		
		startRno = ((currentShowPageNo-1)*sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		if (search != null ) {  // 검색어가 있는경우
			
			noticeList = service.getNoticeList2(map);
			System.out.println(search);
			req.setAttribute("noticeList", noticeList);
		}
		else { // 검색어가 없는경우
			noticeList = service.getNoticeList(map);
			req.setAttribute("noticeList", noticeList);
		}
		
		
		
		if (search != null) {  // 검색어가 있는경우
			
			totalCount = service.getTotalCount2(map);
			req.setAttribute("totalCount", totalCount);
		}
		else { // 검색어가 없는경우
			totalCount = service.getTotalCount1();
			req.setAttribute("totalCount", totalCount);
		}
		
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
		
		String pagebar = "<ul>";
		
		pagebar += MyUtil.getPageBarNoticeWithSearch(sizePerPage, blockSize, totalPage, currentShowPageNo, title, search, "list2.pz");
		
		pagebar += "</ul>"; 
		
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("title", title);
		req.setAttribute("search", search);
		
		
		
		return "service/list2.tiles";
	}
	
	
	//공지사항
   @RequestMapping(value = "/list2Detail.pz", method = RequestMethod.GET)
   public String list2Detail(HttpServletRequest req, HttpSession session) {      
      
      String serviceno = req.getParameter("serviceno");

      HashMap<String, String> noticevo = null;
       
      if (session.getAttribute("readCountPermission") != null &&
         "yes".equals(session.getAttribute("readCountPermission"))   
         ) {
         // session에서 "readCountPermission" 키값을 읽었을때
         // 그 값이 "yes" 이라면 글조회수를 1증가를 해주겠다.
         
         noticevo = service.showNoticeDetail(serviceno);
         
         session.removeAttribute("readCountPermission");
      }
      else {
         // 웹브라우저에서 새로고침(F5)을 했을 경우
         
         noticevo = service.showNoticeDetailNoAddCount(serviceno); 
         // 조회수(readCount) 증가 없이 그냥 글1개를 보여주어야 한다.
      }
      
      req.setAttribute("noticevo", noticevo);
      
      return "service/list2Detail.tiles";
   }
		
	//1:1 문의
	@RequestMapping(value = "/list3.pz", method = RequestMethod.GET)
	public String requireLogin_list3(HttpServletRequest req, HttpServletResponse response) {
		
		return "service/list3.tiles";
	}
	
	//1:1 문의
	@RequestMapping(value = "/list3_insert.pz", method = RequestMethod.GET)
	public String list3_insert(HttpServletRequest req) {
		
		String email = req.getParameter("email");
		String title = req.getParameter("title");
		String msg = req.getParameter("msg");
		String movie = req.getParameter("movie");
		
		String theaterno = service.selectTheaterno(movie);
		
		System.out.println(theaterno);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("title", title);
		map.put("msg", msg);
		map.put("theaterno", theaterno);
		
		int n = 0;
		
		if(map.isEmpty()){
			n = service.getQnAInsert(map);
		}
		
		
		req.setAttribute("n", n);
		
		
		return "insertEnd.notiles";
	}
	
	//1:1 문의 개인정보
	@RequestMapping(value = "/agree.pz", method = RequestMethod.GET)
	public String agree() {		
		
		return "agree.notiles";
	}
	
	

	@RequestMapping(value = "/movieList.pz", method = RequestMethod.GET)
	public String movieList(HttpServletRequest req) {
	
		
		String search = req.getParameter("search");
		
		List<HashMap<String, String>> movieList = service.movieList(search);
		
		req.setAttribute("movieList", movieList);
		
		
		return "movieListAjax.notiles";
	}
	
	
	
	
	
	
}
