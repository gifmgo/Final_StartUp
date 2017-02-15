package kr.or.com.visit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitService {

	@Autowired
	private SqlSession sqlsession;
	 
	private static VisitService instance;
	
	//싱글톤
	private VisitService(){}
	public static VisitService getInstance(){
			if(instance==null){
				instance=new VisitService();
		}
			return instance;
	}
	
	//방문자수 증가
	public void setTotalCount(){
		
		visitDAO dao = sqlsession.getMapper(visitDAO.class);
		
		String checkip = dao.checkIp();
		System.out.println(" 아이피 잇니?============="+checkip);
		
		
	}
}
