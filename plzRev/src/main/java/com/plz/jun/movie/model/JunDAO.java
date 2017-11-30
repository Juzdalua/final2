package com.plz.jun.movie.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JunDAO implements IJunDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	//연습용 모든영화 가져오기
	@Override
	public List<HashMap<String,String>> getAllMovies() {
		
		List<HashMap<String,String>> movieList = sqlsession.selectList("jun_movie.getAllMovies");
		
		return movieList;
	}//getAllMovies

	
	//리스트에 보일 메인사진 가져오기
	@Override
	public List<MediaVO> getAllMainimages() {
		
		List<MediaVO> mainimgList = sqlsession.selectList("jun_movie.getAllMainimages");
		
		return mainimgList;
	}//getAllMainimages
	
	
}
