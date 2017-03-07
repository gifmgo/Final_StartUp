<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>죄송합니다.</title>
  <style>
  	.container{
  		margin-top:10%;
  	}
  	
  	h1{
  	  font-family:Nanum;
  	}
  	
 	.customLable{
 	  line-height: 50px;
 	}
 	
 	
	@media only screen and (max-width:768px) {
		.customLable{
			font-size:13px !important;
		}
	}
 	
  </style>
</head>
<body>
	<div class="container">
	  <div class="jumbotron text-center">
	  	<div class="center-block" style="width:80px;">
	  		<a href="index.do">
		  		<img class="img-responsive" src="img/logo2.png" id="logo" style="width:100%;">
		  	</a>
    	</div>
	    <h1><i class="fa fa-exclamation-triangle" style="font-size:48px;color:red"></i>죄송합니다.</h1><br/>      
	    	<label class="customLable">현재 아이디는 정지되어있는 상태입니다</label><br/><label class="customLable">문의하실 내용은 mail을 이용해주세요.</label><br/>
	    	<input type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" value="메일보내기">
	  </div>
	</div>
	
	
	<!-- Modal -->
	<div class="container">
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">문의사항</h4>
	        </div>
	        <div class="modal-body">
	          <form class="form-horizontal" method="POST">
	          	 <div class="form-group">
				    <label class="control-label col-sm-offset-2 col-sm-2" for="banUserId">차단 아이디</label>
				    <div class="col-sm-4">
				      <input type="email" class="form-control" id="banUserId" name="banUserId" placeholder="차단당하신 아이디를 입력해주세요" required="required">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="control-label col-sm-offset-2 col-sm-2" for="realId">연락받으실 아이디</label>
				    <div class="col-sm-4">
				      <input type="email" class="form-control" id="realId" name="realId" placeholder="연락받으실 아이디를 입력해주세요" required="required">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="control-label col-sm-offset-2 col-sm-2" for="content">문의내용</label>
				    <div class="col-sm-4">
				      <textarea class="form-control" rows="15" style="resize: none; wrap:hard;" name="banContent"></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group text-center">
				      <input type="submit" class="btn btn-info" value="보내기">
				  </div>
	          </form>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>