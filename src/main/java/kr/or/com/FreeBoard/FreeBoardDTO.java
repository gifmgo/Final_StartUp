package kr.or.com.FreeBoard;

public class FreeBoardDTO {

	private int no;
	private String category;
	private String title;
	private String content;
	private String writer;
	private String id;
	private String regdate;
	private String filename;
	private String filepath;
	private int good;
	private int viewcnt;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "FreeBoardDTO [no=" + no + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", id=" + id + ", regdate=" + regdate + ", filename=" + filename
				+ ", filepath=" + filepath + ", good=" + good + ", viewcnt=" + viewcnt + "]";
	}
	
}
