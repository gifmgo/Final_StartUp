<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<label>신청 유저 리스트</label>
			<hr/>
			<div class="table-responsive">          
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">No.</th>
						<th class="text-center">이메일</th>
						<th class="text-center">페이지</th>
						<th class="text-center">날짜</th>
						<th/>
					</tr>
				</thead>
				<tbody>
			<c:choose>
				<c:when test="${list != null}">
					<c:forEach var="list" items="${list}">
						<tr>
							<td class="text-center">${list.applyUser_seq}</td>
							<td class="text-center">${list.applyUser_email}</td>
							<td class="text-center"><a href="${list.applyUser_page}" target="_blank">${list.applyUser_page}</a></td>
							<td class="text-center">${list.applyUser_date}</td>
							<td class="text-center"><input type="button" class="btn btn-info" name="${list.applyUser_seq}" onclick="checkBloger(this);" value="상세보기"></td>
						</tr>	
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="text-center">신청한 유저가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</div>    


<div class="container">
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <form action="BlogerInfoForm.do" enctype="multipart/form-data" method="POST" id="BlogerInfoForm">
      <input type="hidden" id="applyUser_email" name="applyUser_email">
      <input type="hidden" id="applyUser_page" name="applyUser_page">
      <input type="hidden" id="applyUser_date" name="applyUser_date">
      <input type="hidden" id="applyUser_seq" name="applyUser_seq">
      <input type="hidden" id="applyUser_NickName" name="applyUser_NickName">	
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">블로거 정보 <span class="pull-right" id="blogerDate">날짜</span></h4>
        </div>
        <div class="modal-body">
          <label>이메일 : &nbsp;&nbsp;&nbsp;<span id="blogerId" class="pull-right"></span></label><hr/>
          <label>홈페이지 : &nbsp;&nbsp;&nbsp;<span id="blogerPage" class="text-center"></span></label><hr/>
          <label>닉네임 : &nbsp;&nbsp;&nbsp;<span id="blogerNickName"></span></label><hr/>
          <label>이미지 </label><span><input type="file" name="upload" id="upload"></span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger">삭제</button>
          <button type="submit" class="btn btn-info">등록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>  