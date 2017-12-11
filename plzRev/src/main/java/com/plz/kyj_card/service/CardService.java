package com.plz.kyj_card.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.service.model.FaqVO;
import com.plz.service.model.ICardDAO;
import com.plz.service.model.IServiceDAO;
import com.plz.service.model.ServiceCategotyVO;

@Service
public class CardService implements ICardService {
	
	@Autowired
	private ICardDAO dao;

	@Override
	public List<HashMap<String, String>> getAllcardList() {
		List<HashMap<String, String>> list = dao.getAllcardList();
		return list;
	}


	@Override
	public List<HashMap<String, String>> getcardcompany() {
		List<HashMap<String, String>> list = dao.getcardcompany();
		return list;
	}

	@Override
	public List<HashMap<String, String>> cardSearch(HashMap<String, String> map) {
		List<HashMap<String, String>> list = dao.cardSearch(map);
		return list;
	}




}
