<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/sub05.css">
<script type="text/javascript" src="js/writeView.js"></script>

  <div id="wrap">
      <h1>${name} 님에게 한마디</h1>
       <hr/>
       
       <form method="POST" id="writeForm" enctype="multipart/form-data" onkeydown="return captureReturnKey(event)">
	        <!-- <input type="hidden" name="dto" id="obj"> -->
	        <!--상세 보기시 필요한 데이터들-->
	        <input type="hidden" name="img" value="${img}">
	        <input type="hidden" name="num" value="${num}">
	        <input type="hidden" name="dept_cd" value="${dept_cd}">
	        <input type="hidden" name="cate_name" value="${name}">
	
			<input type="hidden" id="catego" name="catego" value="${name}"> 
		    <input type="hidden" id="logId" name="logId" value="${sessionScope.id}">
	  
	        <div id="title">
	           <input type="text" id="talk_title" name="title" placeholder="제목을 입력하세요"/>
	        </div>
	        
	        <!-- <div id="file">
	            <button id="clip" type="button" value="첨부파일"></button>
	           	<input type="file" name="uploadfile" id="uploadfile">
	        </div> -->
	        
	        <div id="content">
		      	<textarea id="ckeditor" name="ckeditor" required></textarea>
		    </div>
		    
	        <div id="btArray">
	           <button type="button" id="writeButton">등록</button>
	           <button onclick="location.href='paliament_talk_Write.do?name=${name}&num=${num}&dept_cd=${dept_cd}&img=${img}">취소</button>
	        </div>
       </form>
   </div>