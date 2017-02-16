package kr.or.com.intercepter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class sessionIntercepter extends HandlerInterceptorAdapter {
	
	public boolean preHandler(HttpServletRequest request, Object handler) throws Exception{
		HttpSession session = request.getSession(false);
		
		/*if(session == null){
			session= request.getSession();
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			System.out.println(format.format(now));
			session.setAttribute("connectId", format.format(now));
		}*/
		
		return true;
	}

}
