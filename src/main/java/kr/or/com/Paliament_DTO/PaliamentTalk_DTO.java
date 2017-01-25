package kr.or.com.Paliament_DTO;

/*
 * 작성자 : 박성준
 * 작성일 : 2017-01-11
 * 목적   : 국회의원별 한마디 게시판에 쓰이는 DTO
 */

public class PaliamentTalk_DTO {
   //국회의원 번호
   private String num;
   //국회의원 이름
   private String catego;
   
   private int paliament_talk_seq;
   private String title;
   private String content;
   private String writer;
   private String id;
   private String writeDate;
   private String filename;
   private String filepath;
   private int good;
   private int viewcnt;
   

   public PaliamentTalk_DTO() {
      super();
   }
   
   public PaliamentTalk_DTO(String num, String catego, String title, String content, String writer, String id,
		String filename, String filepath) {
		super();
		this.num = num;
		this.catego = catego;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.id = id;
		this.filename = filename;
		this.filepath = filepath;
	}

   public String getFilename() {
	   return filename;
   }
   
   public void setFilename(String filename) {
	   this.filename = filename;
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

	public String getFilepath() {
		return filepath;
	}
	
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	public int getGood() {
		return good;
	}
	
	public void setGood(int good) {
		this.good = good;
	}
	
	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "PaliamentTalk_DTO [num=" + num + ", catego=" + catego + ", paliament_talk_seq=" + paliament_talk_seq
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + ", writeDate=" + writeDate
				+ ", filename=" + filename + ", filepath=" + filepath + ", good=" + good + ", viewcnt=" + viewcnt + "]";
	}


}