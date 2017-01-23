package kr.or.com.Paliament_DTO;

public class PaliamentList_DTO {
   
   //정당 뽑을때 필요한 멤버필드
   private String deptCd;
   private String num2;
   //이미지
   private String jpgLink;
   //이름
   private String empNm;
   //지역구
   private String origNm;
   //당선 회수
   private String reeleGbnNm;
   //학력
   private String memTitle;
   
   //정당 이름
   private String polyNm;
   //소속 위원회
   private String shrtNm;

   private String assemEmail;
   private String assemHomep;
   private String assemTel;
   
   
     
   public PaliamentList_DTO() {
   }



   //처음 리스트 뿌릴때 
   public PaliamentList_DTO(String deptCd, String num2, String jpgLink, String empNm, String origNm, String reeleGbnNm, String polyNm) {
      this.deptCd = deptCd;
      this.num2 = num2;
      this.jpgLink = jpgLink;
      this.empNm = empNm;
      this.origNm = origNm;
      this.reeleGbnNm = reeleGbnNm;
      this.polyNm = polyNm;
   } 
    
    
    
   public PaliamentList_DTO(String deptCd, String num2, String jpgLink, String empNm, String origNm, String reeleGbnNm) {
      this.deptCd = deptCd;
      this.num2 = num2;
      this.jpgLink = jpgLink;
      this.empNm = empNm;
      this.origNm = origNm;
      this.reeleGbnNm = reeleGbnNm;
   }
   
   

   public PaliamentList_DTO(String deptCd, String num2, String jpgLink, String empNm, String origNm, String reeleGbnNm,
         String polyNm, String shrtNm) {
      this.deptCd = deptCd;
      this.num2 = num2;
      this.jpgLink = jpgLink;
      this.empNm = empNm;
      this.origNm = origNm;
      this.reeleGbnNm = reeleGbnNm;
      this.polyNm = polyNm;
      this.shrtNm = shrtNm;
   }



   public String getDeptCd() {
      return deptCd;
   }



   public void setDeptCd(String deptCd) {
      this.deptCd = deptCd;
   }



   public String getNum2() {
      return num2;
   }



   public void setNum2(String num2) {
      this.num2 = num2;
   }



   public String getJpgLink() {
      return jpgLink;
   }



   public void setJpgLink(String jpgLink) {
      this.jpgLink = jpgLink;
   }



   public String getEmpNm() {
      return empNm;
   }



   public void setEmpNm(String empNm) {
      this.empNm = empNm;
   }



   public String getOrigNm() {
      return origNm;
   }



   public void setOrigNm(String origNm) {
      this.origNm = origNm;
   }



   public String getReeleGbnNm() {
      return reeleGbnNm;
   }



   public void setReeleGbnNm(String reeleGbnNm) {
      this.reeleGbnNm = reeleGbnNm;
   }



   public String getMemTitle() {
      return memTitle;
   }



   public void setMemTitle(String memTitle) {
      this.memTitle = memTitle;
   }



   public String getPolyNm() {
      return polyNm;
   }



   public void setPolyNm(String polyNm) {
      this.polyNm = polyNm;
   }



   public String getShrtNm() {
      return shrtNm;
   }



   public void setShrtNm(String shrtNm) {
      this.shrtNm = shrtNm;
   }



   public String getAssemEmail() {
      return assemEmail;
   }



   public void setAssemEmail(String assemEmail) {
      this.assemEmail = assemEmail;
   }



   public String getAssemHomep() {
      return assemHomep;
   }



   public void setAssemHomep(String assemHomep) {
      this.assemHomep = assemHomep;
   }



   public String getAssemTel() {
      return assemTel;
   }



   public void setAssemTel(String assemTel) {
      this.assemTel = assemTel;
   }

   @Override
   public String toString() {
      return "PaliamentList_DTO [deptCd=" + deptCd + ", num2=" + num2 + ", jpgLink=" + jpgLink + ", empNm=" + empNm
            + ", origNm=" + origNm + ", reeleGbnNm=" + reeleGbnNm + ", memTitle=" + memTitle + ", polyNm=" + polyNm
            + ", shrtNm=" + shrtNm + ", assemEmail=" + assemEmail + ", assemHomep=" + assemHomep + ", assemTel="
            + assemTel + "]";
   }
      
}