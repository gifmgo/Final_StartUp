package kr.or.com.blog;

public class BlogContents_DTO extends BlogList_DTO{

	private int posting_seq;
	private String posting_id;
	private String posting_url;
	private String posting_title;
	private String posting_content;
	private String posting_date;
	
	public int getPosting_seq() {
		return posting_seq;
	}
	public void setPosting_seq(int posting_seq) {
		this.posting_seq = posting_seq;
	}
	public String getPosting_id() {
		return posting_id;
	}
	public void setPosting_id(String posting_id) {
		this.posting_id = posting_id;
	}
	public String getPosting_url() {
		return posting_url;
	}
	public void setPosting_url(String posting_url) {
		this.posting_url = posting_url;
	}
	public String getPosting_title() {
		return posting_title;
	}
	public void setPosting_title(String posting_title) {
		this.posting_title = posting_title;
	}
	public String getPosting_content() {
		return posting_content;
	}
	public void setPosting_content(String posting_content) {
		this.posting_content = posting_content;
	}
	public String getPosting_date() {
		return posting_date;
	}
	public void setPosting_date(String posting_date) {
		this.posting_date = posting_date;
	}
	
	@Override
	public String toString() {
		return "BlogContents_DTO [posting_seq=" + posting_seq + ", posting_id=" + posting_id + ", posting_url="
				+ posting_url + ", posting_title=" + posting_title + ", posting_content=" + posting_content
				+ ", posting_date=" + posting_date + "]";
	}
	
}
