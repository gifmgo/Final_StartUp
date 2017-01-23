package kr.or.com.FreeBoard;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadDTO{
	private String CKEditorFuncNum;
	private MultipartFile upload;
	private String newFilename;
	private String imageUrl;
	
	
	public FileUploadDTO() {
	}
	
	public MultipartFile getUpload() {
		return upload;
	}
	
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	public String getNewFilename() {
		return newFilename;
	}
	
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}



	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}



	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
}
