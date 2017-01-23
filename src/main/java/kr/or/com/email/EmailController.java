package kr.or.com.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {

	   @Autowired
	   private EmailSender emailSender;
 	   @Autowired
	   private EmailDTO email;

 	   @RequestMapping("/startMail.do")
 	   public String startMail(){
 		   return "StartMail";
 	   }
 	   
 	   @RequestMapping("/sendMail.do")
 	   public String sendMailAction(String id, String s_email) throws Exception{
 		
 		       System.out.println("메일 전송했어욥 !! 아이디 : " +id + " 이메일 ?? : "+s_email);
 		       email.setContent("반가워요 테스트입니다");
 		       email.setSubject(id+" 님 비밀번호 찾기 메일 입니다.");
 			   email.setReceiver(s_email);
 			   emailSender.SendEmail(email);
 			   return "index.do";
 	   }

}
