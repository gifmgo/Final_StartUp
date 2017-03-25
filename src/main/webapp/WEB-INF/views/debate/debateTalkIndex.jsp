<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <section style="width:100%; height:100%;"> -->

<script>
//토론 > 진보 > 더보기
var moreCount = 0;

//보수
var BmoreCount=0;

function moremore(){
	  //리스트 사이즈
	  moreCount ++;  
	  var count = $('#hiddencount').val();
    
      var array = new Array();
      <c:forEach items="${jlist}" var="jinboList">
     	 var object = new Object();
     	 object.debateNo = "${jinboList.debateNo}";
		 object.title = "${jinboList.title}";
         object.writeDate = "${jinboList.writeDate}";
         object.nickName = "${jinboList.nickName}";
    	 array.push(object);
     </c:forEach> 
      
     	 var liTag = '';
     	 //시작 변수
     	 var startCount = 0;
     	 //내가 클릭했을 때 증가 하는 변수
     	 
	     if(moreCount > 0){
			startCount = (moreCount * 10);
			
			if(startCount <= count){	
			
				for(var i = startCount; i < (startCount + 10); i++){
					if(array[i] != null && typeof array[i] !== "undefined"){
						liTag += '<li onclick="detailDebate('+array[i].debateNo+');" class="list-group-item" style="float: none;">'+array[i].title+'<span class="badge col-sm-offset-2">'+array[i].nickName+''+array[i].writeDate+'</span></li>';				
					}else{
						break;
					}
				}
			}else{
				for(var i = startCount; i < count; i++){
					if(array[i] != null && typeof array[i] !== "undefined"){
						liTag += '<li onclick="detailDebate('+array[i].debateNo+');" class="list-group-item" style="float: none;">'+array[i].title+'<span class="badge col-sm-offset-2">'+array[i].nickName+''+array[i].writeDate+'</span></li>';				
					}else{
						break;
					}
				}
			}
		 }
     	 
     	 $('#jinboUl').append(liTag);
      
}

//보수 > 더보기
 function Bmoremore(){
	
	 //리스트 사이즈
	  BmoreCount++; 
	  var count = $('#hiddenBcount').val();
    
     var array2 = new Array();
     <c:forEach items="${blist}" var="bosuList">
    	 var object = new Object();
    	 object.debateNo = "${bosuList.debateNo}";
		 object.title = "${bosuList.title}";
         object.writeDate = "${bosuList.writeDate}";
         object.nickName = "${bosuList.nickName}";
   	 	 array2.push(object);
    </c:forEach> 

     
  		console.log("BmoreCount :" +BmoreCount+" / count: "+count +" / "+array2.length);
    	 var BliTag = '';
    	 //시작 변수
    	 var BstartCount = 0;
    	 //내가 클릭했을 때 증가 하는 변수
    	
    	 
	     if(BmoreCount > 0){
	    	 BstartCount = (BmoreCount * 10);
			console.log("***************** BSSTARTCOUNT : "+BstartCount + " // 리스트 숫자 : "+count);
		
			//클릭후 계산된것        리스트 숫자
  			if(BstartCount <= count){	
				for(var i = BstartCount; i <=((BstartCount + 10)+1); i++){
					console.log("for 문 조건식 : "+BstartCount + " ////  최대치 : "+(BstartCount + 10));
					if(array2[i] != null && typeof array2[i] !== "undefined"){
	
						BliTag += '<li onclick="detailDebate('+array2[i].debateNo+');" class="list-group-item" style="float: none;">'+array2[i].title+'<span class="badge col-sm-offset-2">'+array2[i].nickName+''+array2[i].writeDate+'</span></li>';				
					}else{
						console.log("else");
					break;
					}
				}
			}else{
				for(var i = BstartCount; i < count; i++){
					 console.log("포문 2");
				
					if(array[i] != null && typeof array[i] !== "undefined"){
						console.log('포문 2의 if')
						BliTag += '<li onclick="detailDebate('+array[i].debateNo+');" class="list-group-item" style="float: none;">'+array[i].title+'<span class="badge col-sm-offset-2">'+array[i].nickName+''+array[i].writeDate+'</span></li>';				
					}else{
						break;
					}
				}
			}
		 }
    	 
    	 $('#bosuUl').append(BliTag);
}

</script>

<div class="container-fluid">
	<div class="jumbotron" style="width:100%; margin-top:1%; background-color: #ecf0f1">
		<div class="row">
			<div class="col-md-offset-4 col-md-4" style="margin-top:-2%;">
				<div class="panel panel-default text-center"> 
					<div class="panel-body" style="background-color: #1abc9c;"><span style="color:#fff">이달의 키워드</span><br/><span class="text-right" style="color:#fff">'${keyWord.admin_debate_debateword}'</span></div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5 text-center">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${keyWord.firstvideo}" frameborder="0" allowfullscreen></iframe>
				</div><br/>
				<span>JTBC 뉴스</span>
			</div>
			
			<div class="col-md-5 text-center">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="${keyWord.secondvideo}" frameborder="0" allowfullscreen></iframe>
				</div>
				<br/>
				<span>Chosun 뉴스</span>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
<br/><br/>
	<div class="row">
			<div class="col-md-offset-4 col-md-4" style="margin-top:-2%;">
				<div class="panel panel-default text-center"> 
					<div class="panel-body" style="background-color: #1abc9c;"><span style="color:#fff">여러분의 한마디</span></div> 
				</div>
			</div>
	</div>
	<div class="container">
		<div id="debateListDiv" style="min-height: 500px;">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-5" style="border-right: 5px solid gray;">
					<h4 class="text-center">좋아요</h4>
					<hr/>
						<ul class="list-group" style="float:none;" id="jinboUl">
						<c:choose>
							<c:when test="${jlist != null}">
							<c:forEach var="dto" items="${jlist}" varStatus="status">
								<c:if test="${dto.choose eq '진보' && status.count<11}">
								   <c:set var="sTitle" value="${dto.title}"/>
								   <c:set var="fntitle" value="${fn:substring(sTitle,0,10)}"/>
								   <li onclick="detailDebate(${dto.debateNo});" class="list-group-item" style="float: none;">${fntitle}...<span class="badge col-sm-offset-2">${dto.nickName} ${dto.writeDate}</span></li>
								</c:if>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<li class="list-group-item">의견을 남겨주세요 !</li>
							</c:otherwise>
						</c:choose>
						</ul>
						  <c:set var="count" value="${fn:length(jlist)}"></c:set>
						  <c:if test="${count>10}">
							 <div class="col-md-12">
								<label class="form-control btn btn-default" onclick="moremore()">더보기</label>
								<input type="hidden" id="hiddencount" value="${count}">
								<input type="hidden" id="jlist" value="${jlist}"> 
							</div>
						 </c:if>
					
				</div>
				
				<div class="col-md-5">
					<h4 class="text-center">싫어요</h4>
					<hr/>
					<ul class="list-group" id="bosuUl" style="float:none;">
						<c:choose>
							<c:when test="${blist != null}">
								<c:forEach var="dto" items="${blist}" varStatus="status">
									<c:if test="${dto.choose eq '보수' && status.count<11}">
										<c:set var="sTitle" value="${dto.title}"/>
								   		<c:set var="fntitle" value="${fn:substring(sTitle,0,10)}"/>
										<li onclick="detailDebate(${dto.debateNo});" class="list-group-item" style="float: none;">${fntitle}...<span class="badge col-sm-offset-2">${dto.nickName} / ${dto.writeDate}</span></li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li class="list-group-item">의견을 남겨주세요 !</li>
							</c:otherwise>
						</c:choose>
					</ul>
					<c:set var="bcount" value="${fn:length(blist)}"></c:set>
						  <c:if test="${bcount>10}">
							 <div class="col-md-12">
								<label class="form-control btn btn-default" onclick="Bmoremore()">더보기</label>
								<input type="hidden" id="hiddenBcount" value="${bcount}">
								<input type="hidden" id="blist" value="${blist}"> 
							</div>
						 </c:if>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>
	<hr/>
</div>
<div class="container">
	<div class="col-md-12">
		<c:choose>
			<c:when test="${id != null}">
				<input type="hidden" id="debateWord" value="${keyWord}">
				<input type="hidden" id="loginNickName" value="${memberDTO.nickName}">
				
				<div class="radio col-md-offset-5" style="left:5%;">
					<label>
						<input type="radio" name="choose" value="Bo">싫어요
					</label>
					
					<label>
						<input type="radio" name="choose" value="Jin">좋아요
					</label>
				</div>
			
				<div class="col-md-offset-2 col-md-8">
					<form class="form-horizontal">	
						<div class="form-group">
							<label class="control-label col-md-2">제목 </label>
							<div class="col-md-10">
								<input type="text" id="title" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2">내용 </label>
							<div class="col-md-10">
								<textarea id="debateTextArea" class="form-control" rows="15"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-offset-2 col-md-2">
								<input type="button" class="btn btn-success" id="debateWriteBtn" value="글쓰기">
							</label>
						</div>
					</form>	
				</div>
			</c:when>
			<c:otherwise>
				<h4 class="text-center">로그인 하시면 글을 쓸 수 있습니다.</h4>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<br/><br/>

<!-- </section> -->

<!-- 모달 -->
<div class="container">
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><i class="fa fa-chevron-right" style="font-size:24px"></i>&nbsp;&nbsp;&nbsp;<span id="dbTitle"></span>
	        	<br/><hr/><i class="fa fa-calendar" style="font-size:24px"></i>&nbsp;&nbsp;&nbsp;<span id="date"></span></h4>
	      </div>
	      <div class="modal-body">
	        <p><i class="fa fa-pencil-square-o" style="font-size:24px"></i>&nbsp;&nbsp;&nbsp;<span id="dbcontent"></span></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>

