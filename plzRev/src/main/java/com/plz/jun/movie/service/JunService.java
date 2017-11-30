package com.plz.jun.movie.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.jun.movie.model.IJunDAO;
import com.plz.jun.movie.model.MediaVO;
import com.plz.jun.movie.model.MovieVO;

@Service
public class JunService implements IJunService {

	@Autowired
	private IJunDAO dao;

	//연습용 모든영화 가져오기
	@Override
	public List<HashMap<String,String>> getAllMovies() {
		
		List<HashMap<String,String>> movieList = dao.getAllMovies();
		
		return movieList;
	}//getAllMovies

	
	//리스트에 보일 메인사진 가져오기
	@Override
	public List<MediaVO> getAllMainimages() {

		List<MediaVO> mainimgList = dao.getAllMainimages();
		
		return mainimgList;
	}//getAllMainimages
}
