package com.plz.rev.service;

import java.util.HashMap;

import com.plz.member.model.MemberVO;

public interface IPlzService {

	int loginEnd(HashMap<String, String> map);

	MemberVO getLoginMember(String userid);


	int isUseuserid(String userid);

	int registerMember(HashMap<String, String> map);	//회원가입

}
