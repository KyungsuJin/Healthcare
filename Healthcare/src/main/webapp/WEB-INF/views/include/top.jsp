<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> 건강매니지먼트 </a>
                        
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#" id="messageList">
                                    <i class="glyphicon glyphicon-envelope"></i>
                                    <p class="hidden-lg hidden-md">메시지</p>
                                    
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="hidden-lg hidden-md">개의 알림</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Mike John responded to your email</a>
                                    </li>
                                    <li>
                                        <a href="#">You have 5 new tasks</a>
                                    </li>
                                    <li>
                                        <a href="#">You're now friend with Andrew</a>
                                    </li>
                                    <li>
                                        <a href="#">Another Notification</a>
                                    </li>
                                    <li>
                                        <a href="#">Another One</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">회원정보</p>
                                </a>
                                <ul class="dropdown-menu">
                                	<c:if test="${empty sessionScope.memberSessionId}">
	                                    <li><a href="${pageContext.request.contextPath}/memberJoin">회원가입</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl&memberPw=1234">관리자 로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/loginDirect?memberId=1234&memberPw=1234">일반회원 로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl93&memberPw=1234">의사회원 로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/loginDirect?memberId=rlaansrl936&memberPw=1234">PT 회원 로그인</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/memberFindId">아이디 찾기</a></li>
	                                    <li><a href="${pageContext.request.contextPath}/memberFindPw">비밀번호 찾기</a></li>
                                    </c:if>
                                    
                                    <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==1}">
										<li><a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a></li>
										<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
									</c:if>
									
									<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel!=1}">
										<li><a href="${pageContext.request.contextPath}/memberModifyCheck">회원정보수정</a></li>
										<li><a href="${pageContext.request.contextPath}/memberLeave">회원탈퇴</a></li>
										<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
									</c:if>
                                </ul>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group  is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </form>
                    </div>
                    <c:if test="${!empty sessionScope.memberSessionId}">
                    	<div style="text-align: right;">
                    	${sessionScope.memberSessionId} 님 
                   		 [
	                   		 <c:choose>
	                   		 	<c:when test="${sessionScope.memberSessionLevel==1}">관리자</c:when>
	                   		 	<c:when test="${sessionScope.memberSessionLevel==2}">일반회원</c:when>
	                   		 	<c:when test="${sessionScope.memberSessionLevel==3}">의사회원</c:when>
	                   		 	<c:when test="${sessionScope.memberSessionLevel==4}">PT회원</c:when>
	                   		 </c:choose>
                   		 ]
                   		</div>
                   	</c:if>
                </div>
            </nav>