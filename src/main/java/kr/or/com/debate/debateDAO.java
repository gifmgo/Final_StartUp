package kr.or.com.debate;

public interface debateDAO {
	
	public String selectKeyWord();
	
	public int debateWrite(debateDTO dto);
	
}
