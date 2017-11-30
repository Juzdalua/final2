package com.plz.khk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.khk.model.RegionVO;
import com.plz.khk.model.TheaterVO;
import com.plz.rev.service.InterRegionService;

@Controller
public class RegionController {

	// ==== #33. 의존객체 주입하기 (DI : Dependency Injection) ====
	@Autowired
	private InterRegionService service;

	// 영화관 버튼 클릭시 지역 보여주기
	@RequestMapping(value = "/region.pz", method = { RequestMethod.GET })
	public String region(HttpServletRequest req, RegionVO regionvo) {
		List<RegionVO> regionList = service.regionList();
		req.setAttribute("regionList", regionList); // dao 받아온걸 view로 넘김
		return "theater/region.tiles";
	}
	
	
}
