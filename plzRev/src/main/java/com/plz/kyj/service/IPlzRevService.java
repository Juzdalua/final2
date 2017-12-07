package com.plz.kyj.service;

import java.util.HashMap;
import java.util.List;

import com.plz.service.model.FaqVO;
import com.plz.service.model.ServiceCategotyVO;

public interface IPlzRevService {

	List<HashMap<String, String>> faqList();  		// 고객센터 메인(FAQ)

	List<HashMap<String, String>> getNoticeList(HashMap<String, String> map);	// 공지사항 메인

	List<HashMap<String, String>> getNoticeList2(HashMap<String, String> map);
	
	List<HashMap<String, String>> codeList();		// FAQ 카테고리

	List<HashMap<String, String>> getcategoryList(String categorycode);	// FAQ 카테고리별 목록

	List<HashMap<String, String>> faqListSearch(String search);			// faq 검색목록		

	List<HashMap<String, String>> getNoticeCategoryList();				

	int getTotalCount1();
	
	int getTotalCount2(HashMap<String, String> map);
	
	List<HashMap<String, String>> getMovieList(String regionno);

	List<HashMap<String, String>> movieList(String search);


	

	




	

}
