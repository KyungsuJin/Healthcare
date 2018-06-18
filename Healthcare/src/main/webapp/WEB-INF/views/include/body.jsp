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
             <li><a href="${pageContext.request.contextPath}/getHealthScreenList" data-toggle="tooltip" data-placement="bottom"
                     title="getHealthScreenList">건강검진표</a></li>
            <li><a href="${pageContext.request.contextPath}/getHealthSurveyResultList" data-toggle="tooltip" data-placement="bottom"
               title="getHealthSurveyResultList">나의 건강설문 결과</a></li>
            <li><a href="${pageContext.request.contextPath}/getHealthSurveyList" data-toggle="tooltip" data-placement="bottom"
               title="getHealthSurveyList">건강설문</a></li>
            <li><a href="${pageContext.request.contextPath}/getTreatmentList" data-toggle="tooltip" data-placement="bottom"
               title="getTreatmentList">진료기록</a></li>
            <li><a href="${pageContext.request.contextPath}/getMedicationList" data-toggle="tooltip" data-placement="bottom"
               title="getMedicationList">복약기록</a></li>
            <li><a href="${pageContext.request.contextPath}/getMedicineList" data-toggle="tooltip" data-placement="bottom"
               title="getMedicineList">약품검색</a></li>
            <li><a href="${pageContext.request.contextPath}/getMedicalList" data-toggle="tooltip" data-placement="bottom"
               title="getMedicalList">병원,약국 검색</a></li>
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