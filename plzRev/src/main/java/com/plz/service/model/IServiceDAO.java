package com.plz.service.model;

import java.util.HashMap;
import java.util.List;

public interface IServiceDAO {

	List<HashMap<String, String>> faqList();			// 고객센터 메인(FAQ)

	List<HashMap<String, String>> getNoticeList(HashMap<String, String> map);		// 공지사항 메인
	
	List<HashMap<String, String>> getNoticeList2(HashMap<String, String> map);
	
	List<HashMap<String, String>> getCodeList(); 		// 카테고리

	List<HashMap<String, String>> getcategoryCodeList(String categorycode);// 카테고리 목록리스트

	List<HashMap<String, String>> faqListSearch(String search);

	List<HashMap<String, String>> getNoticeCategoryList();

	int getTotalCount1();

	int getTotalCount2(HashMap<String, String> map);

	List<HashMap<String, String>> getMovieList(String regionno);

	List<HashMap<String, String>> movieList(String search);







	
}
