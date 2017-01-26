package kr.or.com.Parliament;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.com.FreeBoard.CommentDTO;
import kr.or.com.Member.MemberDAO;
import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;
import kr.or.com.Paliament_DTO.PaliamentTalk_DTO;

@Service
public class PaliamentService {

   @Autowired
   private SqlSession sqlSession;
   
   //국회의원 전체 리스트 디비에서 가져오는 부분
   public List<PaliamentList_DTO> selectPaliamentList(){
      System.out.println("서비스");
      List<PaliamentList_DTO> list = new ArrayList<PaliamentList_DTO>();
      try{
         System.out.println("try");
         PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
         list = dao.selectPaliamentList_DTO();
         System.out.println("리스트 싸이즈 : "+list.size());
      }catch(Exception e){
         e.printStackTrace();
      }
      return list;
   }
   
   
   // 상임 위원회 토탈 카운트 구한는 함수
   public String sangInTotal(String dasu) {
      String total = "";

      try {

         SAXBuilder builder = new SAXBuilder();

         // 넘겨받은 회의번호를 이용해 참석자 리스트를 뽑음
         Document jdomdoc = builder.build(new java.net.URL(
               "http://apis.data.go.kr/9710000/ProceedingInfoService/getAllConInfoList?class_code=2&dae_num="
                     + dasu
                     + "&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));

         Element root = jdomdoc.getRootElement();
         // System.out.println("처음 : "+root.getName());

         Element second = root.getChild("body");
         // System.out.println("두번째 : "+second.getName());
         total = second.getChild("totalCount").getValue();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return total;

   }

   // 본회의 토탈 카운트 구하는 함수
   public String totalCount(String dasu) {

      String total = "";

      try {

         SAXBuilder builder = new SAXBuilder();

         // 넘겨받은 회의번호를 이용해 참석자 리스트를 뽑음
         Document jdomdoc = builder.build(new java.net.URL(
               "http://apis.data.go.kr/9710000/ProceedingInfoService/getAllConInfoList?class_code=1&dae_num="
                     + dasu
                     + "&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D"));

         Element root = jdomdoc.getRootElement();
         // System.out.println("처음 : "+root.getName());

         Element second = root.getChild("body");
         // System.out.println("두번째 : "+second.getName());
         total = second.getChild("totalCount").getValue();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return total;
   }
   
   
   //상세보기 >> 한마디 하기
   public List<PaliamentTalk_DTO> talkToMe(String name){
      PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
      List<PaliamentTalk_DTO> list = dao.talkMember(name);
      System.out.println("db 읽은것 : "+list.toString());
      return list;
   }

   //말, 말, 말 에서 글쓰기 submit 담당 서비스 메서드
   public int talk_Write(PaliamentTalk_DTO talk_dto) {
      int result = 0;
      try{
    	  MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
    	  MemberDTO dto = new MemberDTO();
    	  dto.setId(talk_dto.getId());
    	  dto = mdao.selectMyInfo(dto.getId());
    	  talk_dto.setWriter(dto.getNickName());
    	  
    	  PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
          result = dao.talk_Write(talk_dto); 
      }catch(Exception e){
         e.printStackTrace();
      }
            
      return result;
   }

   //말, 말, 말 에서 글 상세보기 
   public PaliamentTalk_DTO talk_Detail(String seq) {
      
      PaliamentTalk_DTO dto  = null;
      try{
         
         PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
         dto = dao.talk_detailSelect(seq);
      }catch(Exception e){
         e.printStackTrace();
      }
      return dto;
   }
   
   // 말, 말, 말  에서 글 수정하기
   public PaliamentTalk_DTO ModifyTalk(String paliament_talk_seq, String writer){
      PaliamentTalk_DTO dto = null;
      try{
         
         System.out.println("서비스 시퀀스 : "+paliament_talk_seq+ " / 아이디 : "+writer);
         PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
         dto = dao.talk_modify(paliament_talk_seq, writer);
         System.out.println("디비 가서 셀렉트한 결과는 ?? : "+dto.toString());

      }catch(Exception e){
         e.printStackTrace();
      }
      
      return dto;      
   }

   // 말, 말, 말 글 수정하기  POST >> DB 작업 진행해야함
   public int modifyTalk_WriteService(List<String> splitList) {

      int result = 0;
      String title = "";
      String content = "";
      String seq = "";
      
      for(int i = 0; i < splitList.size(); i++){
         seq = splitList.get(3);
         title = splitList.get(5);
         content = splitList.get(6);
      }
      
      System.out.println("서비스 뽑은 데이터 : "+seq+" / 제목 : "+title + " / 내용 : "+content);
      
      try{
         PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
         result = dao.talk_modify_Post(seq, title, content);
      }catch(Exception e){
         e.printStackTrace();
      }
      
      System.out.println("처리 결과 : "+result);
      return result;
   }

   
   //국회의원 데이터 스케쥴러로 뿌려주는곳
   public void paliamentDB(List<PaliamentList_DTO> data) {
      System.out.println("서비스 호출함");
      try{
         PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
         for(int i =0; i < data.size(); i++){
            System.out.println("dto 확인좀 : "+data.get(i).toString());
            dao.paliament_DB(data.get(i));
         }

      }catch(Exception e){
         e.printStackTrace();
      }
   }
   
   
   //댓글 부분
   //대댓글 list
 	public List<CommentDTO> commentList(String no) {
 		PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
        List<CommentDTO> list = dao.commentList(no);
        return list;
 	}
 	
 	
 	//댓글 list 뽑기
 	public List<CommentDTO> commSelect(String no) {
 		PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
 		List<CommentDTO> list = dao.selectComment(no);
 		
 		return list;
 	}
 	//쓰기
 	public int writeComment(CommentDTO cdto) {
 		PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
 		int result = 0;
 		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
 		MemberDTO member = mdao.selectMyInfo(cdto.getId());
 		cdto.setWriter(member.getNickName());
 		if(cdto.getDepth()==0){
 			result = dao.writeComment(cdto);//댓글
 		}else if(cdto.getDepth()==1){
 			result = dao.writeCommentn(cdto);//대댓글
 		}
 		return result;
 	}
 	//제거
 	public int removeComment(int co_no,int depth) {
 		PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
 		int result = 0;
 		if(depth==0){
 			result = dao.deleteAllComment(co_no);			
 		}else if(depth==1){
 			result = dao.deleteComment(co_no);						
 		}
 		return result;
 	}
 	//수정
 	public int modifyComment(CommentDTO dto) {
 		PaliamentTalk_DAO dao = sqlSession.getMapper(PaliamentTalk_DAO.class);
 		int result = 0;
 		result = dao.updateComment(dto);
 		return result;
 	}
   
}