package com.plz.jun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.jun.movie.model.MediaVO;
import com.plz.jun.movie.model.MovieVO;
import com.plz.jun.movie.service.IJunService;

@Controller
@Component
public class JunController {
	
	@Autowired
	private IJunService service;
	
	//헤더 영화 메뉴 클릭--> 연습용 전체영화보기
	@RequestMapping(value="/jun_movie.pz", method={RequestMethod.GET})
	public String jun_movie(HttpServletRequest req){
		
		//리스트에 보일 영화정보 가져오기
		List<HashMap<String,String>> movieList = service.getAllMovies();
		req.setAttribute("movieList", movieList);
		
		//리스트에 보일 메인사진 가져오기
		List<MediaVO> mainimgList = service.getAllMainimages();
		req.setAttribute("mainimgList", mainimgList);
		
		return "jun/movieIndex.tiles2";
	}
	
	//영화-박스오피스
	@RequestMapping(value="/jun_boxoffice.pz", method={RequestMethod.GET})
	public String jun_boxoffice(){
		
		
		return "jun/boxoffice.tiles2";
	}
	
	
	
	
}//class
