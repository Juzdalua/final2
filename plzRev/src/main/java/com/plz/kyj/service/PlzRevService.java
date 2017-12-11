package com.plz.kyj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.service.model.FaqVO;
import com.plz.service.model.IServiceDAO;
import com.plz.service.model.ServiceCategotyVO;

@Service
public class PlzRevService implements IPlzRevService {
	
	@Autowired
	private IServiceDAO dao;

	// 고객센터 메인(FAQ)
	@Override
	public List<HashMap<String, String>> faqList() {
		
		 List<HashMap<String, String>> list = dao.faqList();
		return list;
	}

	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> map) {
		 
		List<HashMap<String, String>> noticeList = dao.getNoticeList(map);
			return noticeList;
	}
	
	@Override
	public List<HashMap<String, String>> getNoticeList2(HashMap<String, String> map) {
		List<HashMap<String, String>> noticeList = dao.getNoticeList2(map);
		return noticeList;
	}


	@Override
	public List<HashMap<String, String>> codeList() {
		List<HashMap<String, String>> codeList = dao.getCodeList();
		return codeList;
	}

	@Override
	public List<HashMap<String, String>> getcategoryList(String categorycode) {
		List<HashMap<String, String>> list = dao.getcategoryCodeList(categorycode);
		return list;
	}

	@Override
	public List<HashMap<String, String>> faqListSearch(String search) {
		List<HashMap<String, String>> list = dao.faqListSearch(search);
		return list;
	}

	@Override
	public List<HashMap<String, String>> getNoticeCategoryList() {
		List<HashMap<String, String>> list = dao.getNoticeCategoryList();
		return list;
	}

	@Override
	public int getTotalCount1() {
		int count = dao.getTotalCount1();
		return count;
	}

	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = dao.getTotalCount2(map);
		return count;
	}


	@Override
	public List<HashMap<String, String>> movieList(String search) {
		List<HashMap<String, String>> list = dao.movieList(search);
		return list;
	}

	@Override
	public String selectTheaterno(String movie) {
		String no = dao.selectTheaterno(movie);
		return no;
	}

	@Override
	public int getQnAInsert(HashMap<String, String> map) {
		int n = dao.getQnAInsert(map);
		return n;
	}

	@Override
	public List<HashMap<String, String>> faqCategoryListSearch(String search) {
		List<HashMap<String, String>> list = dao.faqCategoryListSearch(search);
		return list;
	}

	@Override
	public List<HashMap<String, String>> faqListSearch(HashMap<String, String> map) {
		List<HashMap<String, String>> list = dao.faqListSearch(map);
		return list;
	}


}
