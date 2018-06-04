<!-- [진경수] -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar  navbar-inverse" style="margin-bottom: 0;">
   <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="${pageContext.request.contextPath}/">PDS</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
             <li><a href="${pageContext.request.contextPath}/getArticleList" data-toggle="tooltip" data-placement="bottom"
                     title="ArticleList">ArticleList</a></li>
            <li><a href="${pageContext.request.contextPath}/getNoticeList" data-toggle="tooltip" data-placement="bottom"
               title="NoticeList">NoticeList</a></li>
            <li><a href="${pageContext.request.contextPath}/getBoardList" data-toggle="tooltip" data-placement="bottom"
               title="BoardList">BoardList</a></li>
            <li><a href="${pageContext.request.contextPath}/getGalleryList" data-toggle="tooltip" data-placement="bottom"
               title="GalleryList">GalleryList</a></li>
            <li><a href="${pageContext.request.contextPath}/getResumeList" data-toggle="tooltip" data-placement="bottom"
               title="ResumeList">ResumeList</a></li>
         </ul>
         <ul class="nav navbar-nav navbar-right">
            <c:choose>
               <c:when test="${empty sessionMemberId}">
                  <li><a href="${pageContext.request.contextPath}/addMember">회원가입</a></li>
                  <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
               </c:when>
               
               <c:when test="${sessionMemberId ne 'admin'}">
                  <li><a href="${pageContext.request.contextPath}/modifyMember?memberId=${sessionMemberId}">회원정보 수정</a></li>
                  <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
               </c:when>
               
               <c:otherwise>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리<span class="caret"></span></a>
                     <ul class="dropdown-menu" role="menu">
                        <li><a href="#">기능1</a></li>
                        <li><a href="#">기능2</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/getMemberList">Member 관리</a></li>
                     </ul>
                  </li>
                  <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>   
               </c:otherwise>
            </c:choose>
         </ul>
      </div>
      <!-- /.navbar-collapse -->
   </div>
   <!-- /.container-fluid -->
</nav>