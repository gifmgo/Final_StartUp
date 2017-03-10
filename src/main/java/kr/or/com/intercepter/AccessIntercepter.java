package kr.or.com.intercepter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.com.Data.TodayUserDAO;
import kr.or.com.Data.TodayUserDTO;

public class AccessIntercepter extends HandlerInterceptorAdapter {
	
	private static Logger logger = LoggerFactory.getLogger(AccessIntercepter.class);
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object object){
		HttpSession session = request.getSession(false);
		
		try{
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			String acc = "remote :"+ request.getRemoteAddr() + "\n";
			logger.warn(acc);
			
			if(request.getRemoteAddr().equals("0:0:0:0:0:0:0:1") || request.getRemoteAddr().equals("127.0.0.1") ){
				return true;
			}
			
			if(session == null){
				session = request.getSession();
				session.setAttribute("connectId", format.format(now));
				updateTodayUser(format.format(now));
				System.out.println("session : " + session.getAttribute("connectId"));
				logger.warn(acc);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	
	public int updateTodayUser(String date){
		int result = 0;
		
		TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
		
		TodayUserDTO tdto = new TodayUserDTO();
		tdto.setAdate(date);
	    TodayUserDTO dto = dao.selectTodayUser(tdto);
		
	    if(dto==null){
			dto = new TodayUserDTO();
			dto.setAdate(date);
			result = dao.insertTodayUser(dto);
		}else{
			dao.updateTodayUser(dto);
			dao.updateTotalUser(dto);
		}
		return result;
	}

}
