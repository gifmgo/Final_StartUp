package kr.or.com.admin;

public class BanUserDTO {
	private String id;
	private String nickname;
	private String banUserId;
	
	// 게시 글 수
	private int pageSize; 
	//페이지 번호
	private int pgeNo;
	//시작페이지 번호
	private int startPageNo;
	//끝페이지
	private int endPageNo;
	//총개수
	private int totalCount;
	 
	
	public BanUserDTO() {
	
	}
	
	public BanUserDTO(String id, String nickname, String banUserId) {

		this.id = id;
		this.nickname = nickname;
		this.banUserId = banUserId;
	}
	
	

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBanUserId() {
		return banUserId;
	}

	public void setBanUserId(String banUserId) {
		this.banUserId = banUserId;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPgeNo() {
		return pgeNo;
	}

	public void setPgeNo(int pgeNo) {
		this.pgeNo = pgeNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}
	
	
	
	
}
