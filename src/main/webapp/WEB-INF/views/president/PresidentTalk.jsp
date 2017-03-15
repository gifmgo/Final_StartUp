<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<br/><br/>
	<div class="row">
  	  <div class="col-md-12">
  		<div class="form-group">
  			<h2 class="text-center" style="font-size: 22px;"><i class="material-icons"></i>지지율 현황</h2>
  		</div>
  		<br/>
  		<div class="form-group">
  			<hr/>
  			<div class="btn-group btn-group-justified">
				  <a href="PresidentMember.do" class="btn btn-default" style="border: none;">대선후보</a>
				  <a href="PresidentPolls.do" class="btn btn-default" style="border: none;">지지율</a>
				  <a href="PresidentVote.do" class="btn btn-default" style="border: none;">투표해보기</a>
				 <a href="PresidentTalk.do" class="btn btn-default" style="border: none;">대선 한마디</a>
			</div>
			<hr/>
  		</div>
  		<br/>
  	</div>
  </div>
  
    <div class="row">
  	  <div class="col-md-12">
  	  	  <div class="well customWell">
			  <c:choose>
			  	<c:when test="${comment_List != null}">
			  		<c:forEach var="comment" items="${comment_List}">
						<c:choose>
							<c:when test="${comment.loginPw == null}">
								<div class="panel panel-default">
						  			<div class="panel-heading" style="color:#fff;background-color:${comment.color}">${comment.title}<em>(${comment.empNm} / ${comment.polyNm})</em> <span class="pull-right">${comment.writeDate}<input type="hidden" value="${comment.presidentTalk_seq}"><i class="material-icons" style="font-size:15px" data-toggle="modal" data-target="#talkModal" onclick="deleteComment(this)">delete</i></span></div>
						  			<div class="panel-body">${comment.comments}</div>
						  		</div>
					  		</c:when>
					  		<c:otherwise>
					  			<div class="panel panel-default">
						  			<div class="panel-heading" style="color:#fff;background-color:${comment.color}">${comment.title}<em>(${comment.empNm} / ${comment.polyNm})</em> <span class="pull-right">${comment.writeDate}<input type="hidden" value="${comment.presidentTalk_seq}"><i class="material-icons" style="font-size:15px" onclick="deleteCommentUser(this);">delete</i></span></div>
						  			<div class="panel-body">${comment.comments}</div>
						  		</div>
					  		</c:otherwise>
				  		</c:choose>
			  		</c:forEach>
			  	</c:when>
			  	<c:otherwise>
			  		<label>죄송합니다. 잠시후 이용해주세요.</label>
			  	</c:otherwise>
			  </c:choose>
		  </div>
	  </div>
	</div>
</div>  
<br/>
<div class="container">
	<div class="form-group text-center">
		<hr/>
		<p class="text-center" style="font-size:22px;">Drag !!</p><br/>
		<label class="text-center">글을 쓰시려면 대선후보 버튼을 <br/><br/> 아래로 드래그 해주세요 !</label>
		<hr/>
	</div>

    <div class="row text-center" id="draggable">
    	<span class="btn btn-default ui-widget-content" id="문재인" name="더불어민주당">문재인</span>
    	<span class="btn btn-default ui-widget-content" id="안희정" name="더불어민주당">안희정</span>
    	<span class="btn btn-default ui-widget-content" id="안철수" name="국민의당">안철수</span>
    	<span class="btn btn-default ui-widget-content" id="이재명" name="더불어민주당">이재명</span>
    	<span class="btn btn-default ui-widget-content" id="유승민" name="바른정당">유승민</span>
  	</div>
  <div class="row">
  	<div class="col-md-12 text-center">
  		<br/>
  		<div class="well customWell ui-widget-header" id="droppable">
  			<span><i class="fa fa-pencil-square-o" style="font-size:36px"></i></span><br/>
  			<p>원하시는 의원의 버튼을 드래그 해주시면</p><br/>
  			<p>글을 입력하실 수 있습니다 !</p>
  		</div>
  		<br/>
  	</div>
  </div>
</div>  
<div id="writeWell" class="container text-center">
	<div class="row">
		<div class="col-md-12">
			<div class="well">
				<span><i class="material-icons" style="font-size:36px">assignment_late</i></span><br/>
				<label style="font-size:22px;">대선후보를 드래그 하시면<br/> 입력폼이 나옵니다 !! </label>
				<input type="hidden" id="loginNick" value="${sessionScope.id}">
			</div>
		</div>
	</div>
</div>  


<div class="container">
	<div class="modal fade" id="talkModal" role="dialog" style="z-index:999999;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <form class="form-horizontal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">게시글 삭제</h4>
        </div>
        <div class="modal-body">
        	<input type="hidden" id="hiddenSeq">  
         	<div class="form-group">
			    <label class="control-label col-sm-2" for="email">닉네임</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="modal_nickName" placeholder="ex)홍길동">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="pw">비밀번호</label>
			    <div class="col-sm-8"> 
			      <input type="password" class="form-control" id="modal_pw" placeholder="Enter password">
			    </div>
			 </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" id="modalDelBtn">글삭제</button>
          <button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>


