<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div class="container">
	 <div class="demo-row typography-row">
			<div class="demo-title">
				<ul class="nav nav-tabs">
				  <li><a href="AdminBanUserList.do">차단 유저 관리</a></li>
				  <li class="active"><a href="BanUserMail.do">문의 메일</a></li>
				</ul>
			</div>
	 </div>	
	 <br>	
</div>

<div class="container">
  <div class="row">
  	<div class="col-sm-12">
  	  <div class="table-responsive">
	  <table class="table">
	     <thead>
	     	<tr>
		       <th>No</th>
		       <th>밴아이디</th>
		       <th>다른아이디</th>
		       <th>날짜</th>
		       <th/>
	     	</tr>
	     </thead>
	     <tbody>
	     	<c:choose>
	     		<c:when test="${mailList != null}">
	     			<c:forEach var="list" items="${mailList}">
	     				<tr>
	     					<td>${list.banUserMailSeq}</td>
	     					<td>${list.banUserId}</td>
	     					<td>${list.realId}</td>
	     					<td>${list.mailDay}</td>
	     					<td><input type="button" class="btn btn-info" value="상세보기" onclick="detailMailFunc(${list.banUserMailSeq})"></td>
	     				</tr>
	     			</c:forEach>
	     		</c:when>
	     		<c:otherwise>
	     			<tr><td colspan="4">메일이 없습니다.</tr>
	     		</c:otherwise>
	     	</c:choose>
	     </tbody>
	  </table>
	  
	   	<div class="form-group text-center">
  		<div>
            <a href="#fakelink" class="btn btn-inverse previous">
              <i class="fui-arrow-left"></i>
              OLDER
            </a>
            <ul class="pagination pagination-inverse">
	              <li><a href="#fakelink">1</a></li>
	              <li><a href="#fakelink">2</a></li>
	              <li><a href="#fakelink">3</a></li>
	              <li><a href="#fakelink">4</a></li>
	              <li><a href="#fakelink">5</a></li>
            </ul>
            <a href="#fakelink" class="btn btn-inverse next">
              NEWER
              <i class="fui-arrow-right"></i>
            </a>
          </div> <!-- /pagination -->
  	</div>
	  
	  </div>
  	</div>
  </div>
</div> 

<!-- 모달페이지 -->     
<div class="container">
	<div id="mailModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-center">메일함 확인</h4>
      </div>
      <div class="modal-body">
        <label>메일번호 : <span id="mailSeq"></span></label><br/>
        <label>차단 아이디 : <span id="banUser"></span></label><br/>
        <label>연락받을 아이디 : <span id="realUser"></span></label><br/>
        <div class="form-group">
        	<textarea class="form-control" rows="15" style="resize: none; wrap:hard;" id="content"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
</div>     
     