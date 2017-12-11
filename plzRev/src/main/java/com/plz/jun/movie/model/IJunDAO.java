package com.plz.jun.movie.model;

import java.util.HashMap;
import java.util.List;

public interface IJunDAO {

	//연습용 모든영화 가져오기
	List<HashMap<String,String>> getAllMovies();

	//리스트에 보일 메인사진 가져오기
	List<MediaVO> getAllMainimages();

}
