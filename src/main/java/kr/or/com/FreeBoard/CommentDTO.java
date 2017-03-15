package kr.or.com.FreeBoard;

public class CommentDTO {
	private int no;
	private int co_no;
	private String content;
	private String writer;
	private String id;
	private String regdate;
	private String regdatePO;
	private int good;
	private int bed;
	private int grpno;
	private int depth;
	private int grporder;
	
	public CommentDTO() {
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getGrporder() {
		return grporder;
	}
	public void setGrporder(int grporder) {
		this.grporder = grporder;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGrpno() {
		return grpno;
	}


	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}


	@Override
	public String toString() {
		return "CommentDTO [no=" + no + ", co_no=" + co_no + ", content=" + content + ", writer=" + writer + ", id="
				+ id + ", regdate=" + regdate + ", good=" + good + ", bed=" + bed + ", grpno=" + grpno + ", depth="
				+ depth + ", grporder=" + grporder + "]";
	}

	public String getRegdatePO() {
		return regdatePO;
	}

	public void setRegdatePO(String regdatePO) {
		this.regdatePO = regdatePO;
	}


}
