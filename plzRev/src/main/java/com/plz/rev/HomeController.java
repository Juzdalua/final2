package com.plz.rev;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		System.out.println("loginEnd");
		String userid = "";
		String pwd = "";
		
		if( req.getParameter("email-head") == null && req.getParameter("userid") != null ){
			
			userid = req.getParameter("userid");
			pwd = req.getParameter("pwd");
		}
		else{
			
			userid = req.getParameter("email-head");
			pwd = req.getParameter("passwd-head");
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", userid);
		map.put("passwd", pwd);
		
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
	
	
	//회원가입 폼 열기
	@RequestMapping(value="/register.pz",method={RequestMethod.GET})
	public String register(HttpServletRequest req, HttpServletResponse res){
		
		return "login/register.tiles";
	}
	
	//회원가입 id중복검사
	@RequestMapping(value="/idcheck.pz")
	public String idcheck(HttpServletRequest req, HttpServletResponse res){
		
		String method = req.getMethod();
		
		//처음이라면 아이디를 입력하는 폼 띄우기
		if(req.getMethod() == "GET"){
			System.out.println("1111");
			
		}//if
		
		//
		else if(req.getMethod() == "POST"){
			System.out.println("222222");
			String email = req.getParameter("userid");
			//1이면 존재하는 id
			int isUseuserid = service.isUseuserid(email);
			//System.out.println(userid+isUseuserid);
			req.setAttribute("isUseuserid",isUseuserid);
			req.setAttribute("userid", email);
			
		}//else
		
		System.out.println("method"+method);
		req.setAttribute("method", method);
		
		return "idcheck.notiles";
	}
	
	//회원가입 폼 열기
	@RequestMapping(value="/memberRegister.pz",method={RequestMethod.POST})
	public String memberRegister(HttpServletRequest req, HttpServletResponse res){
		
		String userid = req.getParameter("userid");
		String passwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("email", userid);
		map.put("passwd", passwd);
		map.put("name", name);
		map.put("birth", birth);
		
		int result = service.registerMember(map);
		
		String msg = (result==1)?"회원가입 성공!":"회원가입 실패..";
		String loc = (result==1)?"index.pz":"javascript:history.back();";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg.notiles";
	}
	
}





