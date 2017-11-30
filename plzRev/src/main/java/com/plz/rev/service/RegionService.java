package com.plz.rev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.khk.model.InterRegionDAO;
import com.plz.khk.model.RegionVO;

//==== Service 선언 ==== 
@Service
public class RegionService implements InterRegionService {
	
	// ==== 의존객체 주입하기(DI : Dependency Injection)====
	@Autowired
	public InterRegionDAO dao;

	@Override
	public List<RegionVO> regionList() {
		List<RegionVO> list = dao.regionList();
		return list;
	}
	
}
