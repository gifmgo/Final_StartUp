package kr.or.com.Parliament;

import kr.or.com.FreeBoard.CommentDTO;

public class PCommentDTO extends CommentDTO {
	private String img;
	private String name;
	private String deptcd;
	private String orignm;
	
	public PCommentDTO() {
		super();
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeptcd() {
		return deptcd;
	}
	public void setDeptcd(String deptcd) {
		this.deptcd = deptcd;
	}
	@Override
	public String toString() {
		return "PCommentDTO [img=" + img + ", name=" + name + ", deptcd=" + deptcd + ", getImg()=" + getImg()
				+ ", getName()=" + getName() + ", getDeptcd()=" + getDeptcd() + ", getNo()=" + getNo() + ", getCo_no()="
				+ getCo_no() + ", getContent()=" + getContent() + ", getRegdate()=" + getRegdate() + ", getGood()="
				+ getGood() + ", getBed()=" + getBed() + ", getDepth()=" + getDepth() + ", getGrporder()="
				+ getGrporder() + ", getWriter()=" + getWriter() + ", getId()=" + getId() + ", getGrpno()=" + getGrpno()
				+ ", toString()=" + super.toString() + ", getRegdatePO()=" + getRegdatePO() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}

	public String getOrignm() {
		return orignm;
	}

	public void setOrignm(String orignm) {
		this.orignm = orignm;
	}
	
}
