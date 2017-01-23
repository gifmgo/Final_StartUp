package kr.or.com.email;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
public class EmailSender {

	   @Autowired
       protected JavaMailSender  mailSender;

	   public void SendEmail(EmailDTO email_dto) throws Exception{

		   MimeMessage msg = mailSender.createMimeMessage();
		   System.out.println("센드 메세지 : "+email_dto.toString());
		   try{
			   
			   msg.setSubject(email_dto.getSubject());
			   msg.setText(email_dto.getContent());
			   msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email_dto.getReceiver()));
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   try {
               mailSender.send(msg);
           }catch(MailException e) {
               System.out.println("MailException발생");
               e.printStackTrace();
           }
	   }

}
