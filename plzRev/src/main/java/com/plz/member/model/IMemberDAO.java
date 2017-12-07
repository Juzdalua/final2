package com.plz.member.model;

import java.util.HashMap;

public interface IMemberDAO {

	int loginEnd(HashMap<String, String> map);

	MemberVO getLoginMember(String userid);

	int isUseuserid(String userid);

	int registerMember(HashMap<String, String> map);

}
