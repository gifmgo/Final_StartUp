package kr.or.com.DashBoard_News;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

@Controller
public class Mail_News {

   @Autowired
   private View jsonView;
   
   
     //매일경재 속보 부분
   @RequestMapping("/MailNews.do")
   public View MailNews(Model model)throws Exception{
      URL url = new URL("http://file.mk.co.kr/news/rss/rss_40300001.xml");
      URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

      BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
      String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
         JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
         System.out.println("매일 속보좀 확인 할께요 : "+obj);
        model.addAttribute("mail_news", obj);
        return jsonView;
     }
   

    //매일경재 정치 부분
      @RequestMapping("/MailJung.do")
      public View MailJung(Model model) throws Exception{
         URL url = new URL("http://file.mk.co.kr/news/rss/rss_30200030.xml");
         URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

         BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
         String data="";
           String msg = null;
           while((msg = br.readLine())!=null)
           {
               data += msg;
           }
            JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
         
           model.addAttribute("mail_jung", obj);
           return jsonView;
      }

      //매일경제 경제 부분
      @RequestMapping("/MailGyung.do")
      public View MailGyung(Model model) throws Exception{
         URL url = new URL("http://file.mk.co.kr/news/rss/rss_30100041.xml");
         URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

         BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
         String data="";
           String msg = null;
           while((msg = br.readLine())!=null)
           {
               data += msg;
           }
            JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
            model.addAttribute("mail_gyung", obj);
           return jsonView;
      }
      
   
      
   //매일경제 사회 부분 
   @RequestMapping("/MailSociety.do")
   public View Mail_Society(Model model) throws Exception{
      
      URL url = new URL("http://file.mk.co.kr/news/rss/rss_50400012.xml");
      URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
      
      BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
      String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
         JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
      
      model.addAttribute("mail_society", obj);
      return jsonView;
   }
         
      
   //매일경제 연예 부분 
   @RequestMapping("/MailLove.do")
   public View Mail_Love(Model model) throws Exception{
      URL url = new URL("http://file.mk.co.kr/news/rss/rss_30000023.xml");
      URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
      
      BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
      String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
      JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
       model.addAttribute("mail_love", obj);
       return jsonView;
   }
   
   //매일 스포츠
   @RequestMapping("/MailSports.do")
   public View Mail_Sports(Model model) throws Exception{

      URL url = new URL("http://file.mk.co.kr/news/rss/rss_71000001.xml");
      URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체
      
      BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"euc-kr"));
      String data="";
        String msg = null;
        while((msg = br.readLine())!=null)
        {
            data += msg;
        }
      JSONObject obj = (JSONObject) new XMLSerializer().read(data.toString()); 
       model.addAttribute("mail_sports", obj);
       return jsonView;
   }
}