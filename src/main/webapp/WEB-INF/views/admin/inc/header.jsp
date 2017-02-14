<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse" role="navigation">
   <div class="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
       <span class="sr-only">Toggle navigation</span>
     </button>
     <a class="navbar-brand" href="adminIndex.do">생활정치</a>
   </div>
   <div class="collapse navbar-collapse" id="navbar-collapse-01">
     <ul class="nav navbar-nav navbar-left">
       <li><a href="#fakelink"></a></li>
       <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown">메뉴보기 <b class="caret"></b></a>
         <span class="dropdown-arrow"></span>
         <ul class="dropdown-menu">
           <li><a href="AdminNotice.do">공지사항</a></li>
           <li><a href="AdminDebate.do">토론주제</a></li>
           <li><a href="AdminBanUserList.do">유저관리</a></li>
           <li><a href="#">게시판</a></li>
         </ul>
       </li>
      </ul>
   </div><!-- /.navbar-collapse -->
</nav><!-- /navbar -->