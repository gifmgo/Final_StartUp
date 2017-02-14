package kr.or.com.visit;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

public class VisitSessionListener implements HttpSessionListener{

	@Autowired
	private VisitService service;
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {

     //세션이 새로 생성되면 execute() 실행한다
		if(sessionEve.getSession().isNew()){
			execute(sessionEve);
		}
		
	}
   
	//방문자수 확인
	private void execute(HttpSessionEvent sessionEve){
	  VisitService visitservice = service.getInstance();
	
	  visitservice.setTotalCount();
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

}
