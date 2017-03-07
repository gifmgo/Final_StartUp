<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<div class="container">
<div id="paliamentD">
	<div class="row">
	<div class="col-md-6">
		<div class="well" style="margin-top:15%;">
		<form action="" class="form-horizontal">
			 <div class="form-group">
			 	<label class="control-label col-sm-offset-4 col-sm-3">의원검색</label>
			 </div>
			 
			 <div class="form-group">
    			<label class="control-label col-sm-3" for="polyNm">정당</label>
	    		<div class="col-sm-8">
	      			<select class="form-control" id="polyNm">
	      				<option>전체</option>
	      				<option>국민의당</option>
	      				<option>더불어민주당</option>
	      				<option>무소속</option>
	      				<option>바른정당</option>
	      				<option>새누리당</option>
	      				<option>정의당</option>
	      			</select>
	    		</div>
 			 </div>
 			 
 			 <div class="form-group">
 			 	<label class="control-label col-sm-3" for="orignm">지역구</label>
 			 	<div class="col-sm-8">
	      			<select class="form-control" id="orignm">
	      				<option>전체</option>
	      				<option>비례대표</option>
	      				<option>강원</option>
	      				<option>경기</option>
	      				<option>경남</option>
	      				<option>경북</option>
	      				<option>광주</option>
	      				<option>대구</option>
	      				<option>대전</option>
	      				<option>부산</option>
	      				<option>서울</option>
	      				<option>세종</option>
	      				<option>울산</option>
	      				<option>인천</option>
	      				<option>전남</option>
	      				<option>전북</option>
	      				<option>제주</option>
	      				<option>충남</option>
	      				<option>충북</option>
	      			</select>
	    		</div>	
 			 </div>
 			 
 			 <div class="form-group">
    			<label class="control-label col-sm-3" for="empNm">이름</label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control" id="empNm" placeholder="이름을 입력하세요">
	    		</div>
 			 </div>
 			 
 			 <div class="form-group text-center">
   				<input type="button" id="searchBtn" class="btn col-sm-offset-8 col-sm-3" value="검색" style="background:black; color:white; border:0;">
 			 </div>
		</form>
		</div>
	</div>
	<div class="col-md-6">
		<!--도표들어가는 부분-->
		 <div id="piechart"></div>
	</div>
</div>	
		<!--검색 결과 나올 Div 영역-->
		<div class="container">
			<div class="row" id="resultDiv">
				
			</div>
		</div>
	</div>		
</div>

