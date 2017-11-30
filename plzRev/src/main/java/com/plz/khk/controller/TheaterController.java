package com.plz.khk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.khk.model.TheaterVO;
import com.plz.khk.service.InterTheaterService;

@Controller
public class TheaterController {

	// ==== #33. 의존객체 주입하기 (DI : Dependency Injection) ====
	@Autowired
	private InterTheaterService service;

	// 지역내에서 해당 지역 영화관 보여주기
	@RequestMapping(value = "/theater.pz", method = { RequestMethod.GET })
	public String theater(HttpServletRequest req, TheaterVO theatervo) {
		List<TheaterVO> showTheater = service.showTheaterList();
		
		req.setAttribute("showTheater", showTheater); // dao 받아온걸 view로 넘김
		
		return "theater/theater.tiles";
		
	}
}
