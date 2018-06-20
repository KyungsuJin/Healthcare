<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <script>
		$(document).ready(function(){
			$(document).on("click","#messageList",function(){
				window.open("${pageContext.request.contextPath}/messageList"
						,"messageList","width=1100, height=700,resizable=no,scrollbars=yes");
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
                <a href="#" class="simple-text">
                	메뉴
                </a>
            </div>
            <div class="sidebar-wrapper">
            <!-- 관리자 메뉴 -->
             	<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==1}">		
	                <ul class="nav">
	                    <li>
	                       <a href="${pageContext.request.contextPath}/memberListChoice">
	                            <i class="material-icons">person</i>
	                            <p>회원  리스트</p>
	                        </a>
	                    </li>
	                    <li>
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
	                        <a href="${pageContext.request.contextPath}/getHealthSurveyList">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>건강설문 전체리스트</p>
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
               <!--일반회원 ,그룹장 레벨 2 메뉴  -->
				 <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==2}">
				<%--  <ul class="nav"  data-placement="right">
	                    <li>
	                       <a href="#searchMedical" data-toggle="collapse">
	                            <i class="material-icons">person</i>
	                            <p>검색</p>
	                        </a>
	                    </li>
	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
	                    	<li>
	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
				            </li>
				            <li>
				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원,약국 검색</a>
				            </li>
				        </ul>	
				         --%>
				         
					<ul class="nav" data-placement="right">
	                    <li>
	                       <a href="#exerciseMatching" data-toggle="collapse">
	                            <i class="material-icons">person</i>
	                            <p>운동 매칭</p>
	                        </a>
	                    </li>
		                    <ul class="sidenav-second-level collapse" id="exerciseMatching" style="list-style:none;">
		                    	<li>
		                    		<a href="#" id="exercise">운동매칭 리스트</a>
					            </li>
					            <li>
					            	<a href="${pageContext.request.contextPath}/attendExerciseMatching?memberNo=${sessionScope.memberSessionNo}">참가한 운동매칭 경기</a>
					            </li>
					        </ul>	
	        
	                    <li>
	                        <a href="#bodyMassIndex" data-toggle="collapse">
	                            <i class="material-icons">dashboard</i>
	                            <p>체질량 관리</p>
	                        </a>
	                    </li>
	                    <ul class="sidenav-second-level collapse" id="bodyMassIndex" style="list-style:none;">
	                    	<li>
	                    		<a href="${pageContext.request.contextPath}/bodyMassIndexList?memberNo=${sessionScope.memberSessionNo}" >체질량 등록 리스트</a>
				            </li>
				            <li>
				            	<a href="${pageContext.request.contextPath}/addBodyMassIndex">체질량 등록</a>
				            </li>
				            <li>
				            	<a href="${pageContext.request.contextPath}/bodyMassIndexChart">체질량 차트</a>
				            </li>
				        </ul>
				        
	                    <li>
	                        <a href="${pageContext.request.contextPath}/getHealthScreenList">
	                            <i class="material-icons">content_paste</i>
	                            <p>건강검진표 목록</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/getHealthSurveyList">
	                            <i class="material-icons">library_books</i>
	                            <p>건강설문 목록</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/getHealthSurveyResultList">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>나의 건강설문 목록</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/getMedicationList">
	                            <i class="material-icons">location_on</i>
	                            <p>복약 목록</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="${pageContext.request.contextPath}/getTreatmentList">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>진료기록</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="${pageContext.request.contextPath}/">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
				<!-- 의사회원 레벨 3메뉴 -->
				  <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==3}">			
					<ul class="nav">
	                    <li>
	                       <a href="${pageContext.request.contextPath}/getHealthSurveyList">
	                            <i class="material-icons">person</i>
	                            <p>건강설문 목록</p>
	                        </a>
	                    </li>
	                    <li class="active">
	                        <a href="#">
	                            <i class="material-icons">dashboard</i>
	                            <p>**</p>
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
	                        <a href="#">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">location_on</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="${pageContext.request.contextPath}/">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
				<!-- PT회원 레벨 4메뉴-->
				<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==4}">	

  			 
					<ul class="nav"  data-placement="right">
	                    <li>
	                       <a href="#sss" data-toggle="collapse">
	                            <i class="material-icons">person</i>
	                            <p>큰메뉴</p>
	                        </a>
	                    </li>
	                    <ul class="sidenav-second-level collapse" id="sss" style="list-style:none;">
				            <li>
				              <a href="login.html">1번 작은메뉴</a>
				            </li>
				             <li>
				              <a href="login.html">2번 작은메뉴</a>
				            </li>
				             <li>
				              <a href="login.html">3번 작은메뉴</a>
				            </li>
				             <li>
				              <a href="login.html">4번 작은메뉴</a>
				            </li>
			            </ul>
			            
			            <!-- ------------------------- -->
	                    <li >
	                        <a href="#">
	                            <i class="material-icons">dashboard</i>
	                            <p>**</p>
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
	                        <a href="#">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">location_on</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>**</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="${pageContext.request.contextPath}/">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
				<!-- 비회원 메뉴 -->
				<c:if test="${sessionScope.memberSessionLevel eq null}">
					
					<ul class="nav"  data-placement="right">
	                    <li>
	                       <a href="#searchMedical" data-toggle="collapse">
	                            <i class="material-icons">person</i>
	                            <p>검색</p>
	                        </a>
	                    </li>
	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
	                    	<li>
	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
				            </li>
				            <li>
				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원,약국 검색</a>
				            </li>
				        </ul>
				        
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
	                        <a href="#">
	                            <i class="material-icons">bubble_chart</i>
	                            <p>로그인</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons">location_on</i>
	                            <p>하세요</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="material-icons text-gray">notifications</i>
	                            <p>Notifications</p>
	                        </a>
	                    </li>
	                    <li class="active-pro">
	                        <a href="#">
	                            <i class="material-icons">unarchive</i>
	                            <p>Upgrade to PRO</p>
	                        </a>
	                    </li>
	                </ul>
				</c:if>
            </div>
       </div>