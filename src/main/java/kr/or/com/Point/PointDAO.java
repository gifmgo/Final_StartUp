package kr.or.com.Point;

import java.util.List;

import kr.or.com.Member.MemberDTO;
import kr.or.com.Paliament_DTO.PaliamentList_DTO;

public interface PointDAO {
	//내가 산 국회의원 리스트 보여주는 부분
	public List<PointDTO> buyPaliamentIndex(String userId);
	
	public List<PaliamentList_DTO> countPaliament();

	//국회의원 검색시 사용됨 - ajax 용
	public List<PaliamentList_DTO> searchPaliament(String name);

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
	
	//포인트 랭킹  -- detail 페이지에 사용
	public List<MemberDTO> pointRank();
	
	//인기있는 국회의원
	public List<PaliamentList_DTO> lovePaliament();
	
	//정당별 -  맨처음 띄워줄것
	public List<PaliamentList_DTO> lovepolyNmBase();
	
	//내가 구매한 국회의원 리스트
	public List<PointDTO> buyPaliamentList(String id);
	
	//내가 구매한 국회의원 한명 상세 정보 보기
	public PaliamentList_DTO selectPaliamentDeptCd(String deptCd);

	//수량 판매 하기
	public int sellPaliamentTotalCount(PaliamentList_DTO dto);

	//내정보 포인트 증가 시키는 것
	public int sell_updateMyPoint(MemberDTO mydto);
	
	//Point 테이블에 데이터 조회하는 부분 - > 있으면 update / 없으면 insert
	public PointDTO selectPointDTO(PointDTO dto);
	//Point 테이블 업데이트 하는 부분 >> >> 판매한 수량 업데이트 하는 부분
	public int updatePoint(PointDTO dto);
	//국회의원 포인트 구매
	public int buyPoint(PointDTO dto);

	
	
}
