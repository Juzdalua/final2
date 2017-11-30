package com.plz.jun.movie.service;

import java.util.HashMap;
import java.util.List;

import com.plz.jun.movie.model.MediaVO;

public interface IJunService {

	//연습용 모든영화 가져오기
	List<HashMap<String,String>> getAllMovies();

	//리스트에 보일 메인사진 가져오기
	List<MediaVO> getAllMainimages();

}
