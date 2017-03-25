package kr.or.com.blog;

import org.springframework.web.multipart.MultipartFile;

/*
 * 사용목적 : 신청 할 때 사용하는 dto
 */
public class BlogerApply_DTO {

	private int applyUser_seq; 
	private String applyUser_email;
	private String applyUser_page;
	private String applyUser_date;
	private MultipartFile upload;
	private String filename;
	private String filepath;
	private String applyUser_NickName;
	
	public int getApplyUser_seq() {
		return applyUser_seq;
	}
	public void setApplyUser_seq(int applyUser_seq) {
		this.applyUser_seq = applyUser_seq;
	}
	public String getApplyUser_email() {
		return applyUser_email;
	}
	public void setApplyUser_email(String applyUser_email) {
		this.applyUser_email = applyUser_email;
	}
	public String getApplyUser_page() {
		return applyUser_page;
	}
	public void setApplyUser_page(String applyUser_page) {
		this.applyUser_page = applyUser_page;
	}
	public String getApplyUser_date() {
		return applyUser_date;
	}
	public void setApplyUser_date(String applyUser_date) {
		this.applyUser_date = applyUser_date;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	public String getApplyUser_NickName() {
		return applyUser_NickName;
	}
	public void setApplyUser_NickName(String applyUser_NickName) {
		this.applyUser_NickName = applyUser_NickName;
	}
	
	@Override
	public String toString() {
		return "BlogerApply_DTO [applyUser_seq=" + applyUser_seq + ", applyUser_email=" + applyUser_email
				+ ", applyUser_page=" + applyUser_page + ", applyUser_date=" + applyUser_date + ", upload=" + upload
				+ ", filename=" + filename + ", filepath=" + filepath + ", applyUser_NickName=" + applyUser_NickName
				+ "]";
	}
	
	
	
	
	
	
}
