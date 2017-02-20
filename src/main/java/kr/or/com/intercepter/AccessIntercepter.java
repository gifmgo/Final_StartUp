package kr.or.com.intercepter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.com.Data.TodayUserDAO;
import kr.or.com.Data.TodayUserDTO;

public class AccessIntercepter extends HandlerInterceptorAdapter {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object object)throws Exception{

		HttpSession session = request.getSession(false);
		if(request.getRemoteAddr().equals("0:0:0:0:0:0:0:1")){
			System.out.println("local");
			return true;
		}
		
		if(session == null){
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			session = request.getSession();
			session.setAttribute("connectId", format.format(now));
			
			updateTodayUser();
		}

		return true;
	}
	
	public int updateTodayUser(){
		int result = 0;
		
		TodayUserDAO dao = sqlSession.getMapper(TodayUserDAO.class);
	    TodayUserDTO dto = dao.selectTodayUser();
		if(dto==null){
			dao.updateTotalUser(dto);
		}else{
			dao.updateTodayUser();
			dao.updateTotalUser(dto);
		}
		return result;
	}

}
