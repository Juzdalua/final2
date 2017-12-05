package com.plz.rev;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.plz.common.MyUtil;

/*
 	주업무(로그인필요)를 위해 보조업무(Aspect)로 로그인여부 확인.
*/
@Aspect
@Component
public class LoginCheck {

	@Pointcut("execution(public * com.plz..*.*Controller.requireLogin_*(..))")
	public void requireLogin(){
		
	}
	
	@Before("requireLogin()")
	public void before(JoinPoint joinPoint){
		
		// 로그인 유무를 확인하기 위해서는 request를 통해 session을 얻어온다.
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginuser") == null){
			//로그인을 하지 않은 상태
			String msg = "먼저 로그인 하세요~";
			String loc = "/rev/login.pz";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			// >>> 로그인 성공 후, 로그인하기 전 페이지로 돌아가는 작업
			// 현재페이지의 주소(URL)알아내기
			String url = MyUtil.getCurrentURL(request);
			
			session.setAttribute("gobackURL", url);	//세션에 돌아갈 페이지url을 저장한다.
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
			
			try {
				dispatcher.forward(request, response);
				
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}//before
}
