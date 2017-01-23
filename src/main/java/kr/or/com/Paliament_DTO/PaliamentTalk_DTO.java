package kr.or.com.Paliament_DTO;

import org.springframework.web.multipart.MultipartFile;

/*
 * 작성자 : 박성준
 * 작성일 : 2017-01-11
 * 목적   : 국회의원별 한마디 게시판에 쓰이는 DTO
 */

public class PaliamentTalk_DTO {
   private int paliament_talk_seq;
   private String title;
   private String content;
   private String writer;
   private String catego;
   private String writeDate;
   private String num;
   private MultipartFile uploadfile;
   private String filename;
   
   
   
   public String getFilename() {
      return filename;
   }

   public void setFilename(String filename) {
      this.filename = filename;
   }

   public MultipartFile getUploadfile() {
      return uploadfile;
   }

   public void setUploadfile(MultipartFile uploadfile) {
      this.uploadfile = uploadfile;
   }

   public PaliamentTalk_DTO() {
      super();
   }

   public PaliamentTalk_DTO(String title, String content, String writer, String catego, String num, String filename) {
      this.title = title;
      this.content = content;
      this.writer = writer;
      this.catego = catego;
      this.num = num;
      this.filename=filename;
   }

   public PaliamentTalk_DTO(String title, String content, String writer, String catego, String writeDate, String num, String filename) {
      this.title = title;
      this.content = content;
      this.writer = writer;
      this.catego = catego;
      this.writeDate = writeDate;
      this.num = num;
      this.filename=filename;
   }

   public int getPaliament_talk_seq() {
      return paliament_talk_seq;
   }

   public void setPaliament_talk_seq(int paliament_talk_seq) {
      this.paliament_talk_seq = paliament_talk_seq;
   }

   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }

   public String getCatego() {
      return catego;
   }

   public void setCatego(String catego) {
      this.catego = catego;
   }

   public String getNum() {
      return num;
   }

   public void setNum(String num) {
      this.num = num;
   }

   public String getWriteDate() {
      return writeDate;
   }

   public void setWriteDate(String writeDate) {
      this.writeDate = writeDate;
   }

   @Override
   public String toString() {
      return "PaliamentTalk_DTO [paliament_talk_seq=" + paliament_talk_seq + ", title=" + title + ", content="
            + content + ", writer=" + writer + ", catego=" + catego + ", writeDate=" + writeDate + ", num=" + num
            + ", uploadfile=" + uploadfile + ", filename=" + filename + "]";
   }  
}