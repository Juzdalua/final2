package com.plz.chatting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//=== #174. (웹채팅관련7) === 

@Controller
public class ChattingController {
	
	@RequestMapping(value="/chatting/multichat.pz", method={RequestMethod.GET})
	public String requireLogin_multichat(HttpServletRequest req, HttpServletResponse res){
		
		return "chatting/multichat.tiles";
		
	//  /WEB-INF/views2/chatting/multichat.jsp 파일을 생성한다.
	}
	
}
