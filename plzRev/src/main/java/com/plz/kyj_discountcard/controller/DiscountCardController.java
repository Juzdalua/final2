package com.plz.kyj_discountcard.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.jhy_store.model.ImgVO;
import com.plz.kyj_card.service.ICardService;

@Component
@Controller
public class DiscountCardController {

	@Autowired
	private ICardService service;
	
	//할인카드메인
	@RequestMapping(value = "/cardMain.pz", method = RequestMethod.GET)
	public String cardmain(HttpServletRequest req) {	
	
		
		String search = req.getParameter("search");
		String name = req.getParameter("name");
		
		List<HashMap<String, String>> companyList = service.getcardcompany();
		req.setAttribute("companyList", companyList);
		
		List<HashMap<String,String>> cardlist = null;
		
		
		
		if(name != null){
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("search", search);
			cardlist = service.cardSearch(map);
		}
		else {
			cardlist = service.getAllcardList();
		}
		
		req.setAttribute("cardlist", cardlist);
		return "card/cardMain.tiles";
	}


}
