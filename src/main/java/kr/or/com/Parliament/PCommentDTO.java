package kr.or.com.Parliament;

import kr.or.com.FreeBoard.CommentDTO;

public class PCommentDTO extends CommentDTO {
	private String img;
	private String name;
	private String deptcd;
	private String orignm;
	private String polyNm;
	
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
	
	public String getOrignm() {
		return orignm;
	}

	public void setOrignm(String orignm) {
		this.orignm = orignm;
	}

	public String getPolyNm() {
		return polyNm;
	}

	public void setPolyNm(String polyNm) {
		this.polyNm = polyNm;
	}

	@Override
	public String toString() {
		return "PCommentDTO [img=" + img + ", name=" + name + ", deptcd=" + deptcd + ", orignm=" + orignm + ", polyNm="
				+ polyNm + "]" +  super.toString();
	}
}
