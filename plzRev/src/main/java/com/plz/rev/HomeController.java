package com.plz.rev;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plz.member.model.MemberVO;
import com.plz.rev.service.IPlzService;

/**
 * Handles requests for the application home page.
 */
@Component
@Controller
public class HomeController {
	
	@Autowired
	private IPlzService service;
	
	//메인페이지
	@RequestMapping(value = "/index.pz", method = RequestMethod.GET)
	public String index() {		
		
		return "index.tiles";
	}
		
	
	// ====  로그인 페이지 요청. =====
	@RequestMapping(value="/login.pz",method={RequestMethod.GET})
	public String login(HttpServletRequest req){
		
		return "login/loginform.tiles";
	}

	
	// ====  로그인 완료 요청. =====
	@RequestMapping(value="/loginEnd.pz",method={RequestMethod.POST})
	public String loginEnd(HttpServletRequest req, MemberVO loginuser, HttpSession session){
		
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("pwd", pwd);
		
		int n = service.loginEnd(map);
		req.setAttribute("n", n);
		
		if(n==1){
			loginuser = service.getLoginMember(userid);
			session.setAttribute("loginuser", loginuser);
			
			//세션에 저장된 돌아갈 페이지 불러오기
			String gobackURL = (String)session.getAttribute("gobackURL");
			req.setAttribute("gobackURL", gobackURL);
			
			//url 저장하고 삭제하기
			session.removeAttribute("gobackURL");
		}//if
		
		return "login/loginEnd.tiles";
	}//loginEnd

	
	// 로그아웃
	@RequestMapping(value="/logout.pz",method={RequestMethod.GET})
	public String logout(HttpSession session){
		
		session.invalidate();			
		
		return "index.tiles";
	}
	
	
	
}
