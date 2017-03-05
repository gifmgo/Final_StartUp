package kr.or.com.Point;

import java.util.List;

import kr.or.com.Paliament_DTO.PaliamentList_DTO;

public interface PointDAO {
	//내가 산 국회의원 리스트 보여주는 부분
	public List<PointDTO> buyPaliamentIndex(String userId);
	
	public List<PaliamentList_DTO> countPaliament();

	//국회의원 검색시 사용됨 - ajax 용
	public List<PaliamentList_DTO> searchPaliament(String name);

	//국회의원 포인트 구매
	public int buyPoint(PointDTO dto);
	
	//국회의원 포인트 구매후 내 포인트 변경
	public int updateMyPoint(PointDTO dto);

	//국회의원 - 셀렉트 박스 이용시 - > point 중간 부분
	public List<PaliamentList_DTO> selectBoxPaliament(PaliamentList_DTO dto);
	
	//국회의원 정보 보기
	public PaliamentList_DTO selectPaliamentTotalCount(String deptCd);
	
	////유저가 구매시 국회의원 count 증가하는 부분
	public int updatePaliamentCount(PaliamentList_DTO dto);
	
	//유저가 구매시 국회의원 count, point 증가하는 부분
	public int updatePaliamentPointCount(PaliamentList_DTO dto);
	
	//구매한사람이 아무도 없을때 호출됨 >> 국회의원 포인트 총 구매회수 증가함
	public int zeroUpdatePaliamentCount(PaliamentList_DTO dto);

	
	
}
