package com.plz.rev.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plz.member.model.IMemberDAO;
import com.plz.member.model.MemberVO;

@Service
public class PlzService implements IPlzService {
	
	@Autowired
	private IMemberDAO memberdao;
	
	// ====  로그인여부 알아오기====
	@Override
	public int loginEnd(HashMap<String, String> map) {
		
		int n = memberdao.loginEnd(map);
		
		return n;
	}

	// ====  로그인한 사용자정보 알아오기====
	@Override
	public MemberVO getLoginMember(String userid) {

		MemberVO mvo = memberdao.getLoginMember(userid);
		return mvo;
	}

	// 아이디 중복을 검사하는 메소드
	@Override
	public int isUseuserid(String email) {
		int isUseuserid = memberdao.isUseuserid(email);
		return isUseuserid;
	}

	// 회원가입
	@Override
	public int registerMember(HashMap<String, String> map) {
		int registerMember = memberdao.registerMember(map);
		return registerMember;
	}
	
	
	
}
