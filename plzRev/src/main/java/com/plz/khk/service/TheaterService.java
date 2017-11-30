package com.plz.khk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.khk.model.InterRegionDAO;
import com.plz.khk.model.InterTheaterDAO;
import com.plz.khk.model.RegionVO;
import com.plz.khk.model.TheaterVO;

//==== Service 선언 ==== 
@Service
public class TheaterService implements InterTheaterService {

	// ==== 의존객체 주입하기(DI : Dependency Injection)====
	@Autowired
	public InterTheaterDAO dao;

	// 지역선택시 해당지역 영화관 보여주기
	@Override
	public List<TheaterVO> showTheaterList() {
		List<TheaterVO> list = dao.TheaterList();
		return null;
	}
	
}
