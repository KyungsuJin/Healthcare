<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <script>
		$(document).ready(function(){
			$("#messageList").click(function(){
				window.open("${pageContext.request.contextPath}/messageList"
						,"messageList","width=700, height=700,resizable=no,scrollbars=yes");
			});
			$("#exercise").click(function(){
				$.ajax({
					type:"get"
					,url : "${pageContext.request.contextPath}/exerciseDepositChk"
					,data : {"memberNo" : $("#memberNo").val()}
					,dataType: "text"
					,success:function(data){
						if(data==0){
							alert('보증금등록을 하지않았습니다.');
							if(confirm('보증금등록을 하시겠습니까?')){
								window.open("${pageContext.request.contextPath}/exerciseDepositRegistration"
										,"Registration","width=450, height=300,resizable=no,scrollbars=yes");
							}else{
								return false;
							}
						}else{
							window.location.href="${pageContext.request.contextPath}/exerciseMatching";
						}
					}
				});
			});
		});
	</script>
	<input type="hidden" id="memberNo" value="${sessionScope.memberSessionNo}">
	<div class="sidebar" data-color="purple" data-image="${pageContext.request.contextPath}/templateimg1/sidebar-1.jpg">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                	메뉴
                </a>
            </div>
            <div class="sidebar-wrapper">
             	<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==1}">		
	                <ul class="nav">
	                    <li>
	                       <a href="${pageContext.request.contextPath}/memberListChoice">
	                            <i class="material-icons">person</i>
	                            <p>회원  리스트</p>
	                        </a>
	                    </li>
	                    <li class="active">
	                        <a href="${pageContext.request.contextPath}/messageComplainList">
	                            <i class="material-icons">dashboard</i>
	                            <p>메시지 관리</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/memberApprovalList">
	                            <i class="material-icons">content_paste</i>
	                            <p>회원 승인 대기 리스트</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/exerciseMatching">
	                            <i class="material-icons">library_books</i>
	                            <p>운동매칭 관리</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./icons.html">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>Icons</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./maps.html">
	                            <i class="material-icons">location_on</i>
	                            <p>Maps</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./notifications.html">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>Notifications</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="upgrade.html">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
                </c:if>
                <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel!=1}">			
					<ul class="nav">
	                    <li>
	                       <a href="#" id="exercise">
	                            <i class="material-icons">person</i>
	                            <p>운동 매칭</p>
	                        </a>
	                    </li>
	                    <li class="active">
	                        <a href="${pageContext.request.contextPath}/bodyMassIndexList?memberNo=${sessionScope.memberSessionNo}">
	                            <i class="material-icons">dashboard</i>
	                            <p>체질량관리</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">content_paste</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">library_books</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./icons.html">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>Icons</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./maps.html">
	                            <i class="material-icons">location_on</i>
	                            <p>Maps</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./notifications.html">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>Notifications</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="upgrade.html">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
				<c:if test="${sessionScope.memberSessionLevel eq null}">			
					<ul class="nav">
	                    <li>
	                       <a href="#">
	                            <i class="material-icons">person</i>
	                            <p>운동 매칭</p>
	                        </a>
	                    </li>
	                    <li class="active">
	                        <a href="#">
	                            <i class="material-icons">dashboard</i>
	                            <p>체질량관리</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">content_paste</i>
	                            <p>안녕</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">library_books</i>
	                            <p>하세요</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./icons.html">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>로그인</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./maps.html">
	                            <i class="material-icons">location_on</i>
	                            <p>하세요</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="./notifications.html">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>Notifications</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="upgrade.html">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
            </div>
       </div>