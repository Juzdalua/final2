package com.plz.rev;



import javax.servlet.RequestDispatcher;
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
		
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginuser") == null){
			
			//돌아갈 페이지 설정하기.
			String url = MyUtil.getCurrentURL(request);
			session.setAttribute("gobackURL", url);
			
			String msg = "로그인먼저";
			String loc = "/login.pz";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
								
			HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} //try~
			return;
		}//if
	}//before
}
