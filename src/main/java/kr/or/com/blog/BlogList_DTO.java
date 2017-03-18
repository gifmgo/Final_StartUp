package kr.or.com.blog;

public class BlogList_DTO {
	private String bloger_id;
	private String bloger_img;
	private String bloger_mainUrl;
	
	public String getBloger_id() {
		return bloger_id;
	}
	public void setBloger_id(String bloger_id) {
		this.bloger_id = bloger_id;
	}
	
	public String getBloger_img() {
		return bloger_img;
	}
	public void setBloger_img(String bloger_img) {
		this.bloger_img = bloger_img;
	}
	public String getBloger_mainUrl() {
		return bloger_mainUrl;
	}
	public void setBloger_mainUrl(String bloger_mainUrl) {
		this.bloger_mainUrl = bloger_mainUrl;
	}
	@Override
	public String toString() {
		return "BlogList_DTO [bloger_id=" + bloger_id + ", bloger_img=" + bloger_img + ", bloger_mainUrl="
				+ bloger_mainUrl + "]";
	}
}
