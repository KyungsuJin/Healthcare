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
                <a href="${pageContext.request.contextPath}/index" class="simple-text">
                	<img src="./img/sampleTop.JPG"  width="150" height="80" alt="..">
                </a>
            </div>
            <div class="sidebar-wrapper"  style="overflow:auto; width:250px; height:800;">
            <!-- 관리자 메뉴 -->
             	<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==1}">		
	                <ul class="nav">
	                    <li>
		                     <a href="#searchMember" data-toggle="collapse">
	 	                        <p>1.회원 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchMember" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/memberListChoice">회원리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/memberApprovalList">회원 승인 대기 리스트</a>
 				            </li>
 				        </ul>
 				          <li>
		                     <a href="#searcMessage" data-toggle="collapse">
	 	                        <p>3.메시지 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searcMessage" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/messageComplainList">메세지 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchGroup" data-toggle="collapse">
 	                            <p>4.그룹 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchGroup" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/groupList">생성된 그룹 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/deleteGroupList">삭제 유예기간 그룹 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/addGroupKind">그룹 종류 등록</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/addGroupKind">그룹 종류 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/groupMain">그룹 메인</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchBloodPressure" data-toggle="collapse">
 	                            <p>7.혈압 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchBloodPressure" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/bloodPressure">혈압 전체 리스트</a>
 				            </li>
 				        </ul>
	                     <li>
		                     <a href="#searchHealthSurvey" data-toggle="collapse">
	 	                        <p>9.건강설문 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchHealthSurvey" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthSurveyList">건강설문 리스트</a>
 				            </li>
 				        </ul>
 				         <li>
		                     <a href="#searchexerciseMatching" data-toggle="collapse">
	 	                        <p>12.운동매칭 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchexerciseMatching" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseMatching">운동매칭 리스트</a>
 				            </li>
 				        </ul>
	                    <li>
		                     <a href="#searchPTfeedback" data-toggle="collapse">
	 	                        <p>15.PT 피드백 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPTfeedback" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedbackList">운동피드백요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedResponseResultList">운동피드백답변 리스트</a>
 				            </li>
 				        </ul>
 				       	<li>
		                     <a href="#searchPaymemt" data-toggle="collapse">
	 	                        <p>16.결제 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPaymemt" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addPointToMember">포인트 등록</a>
 				            </li>
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/pointChargingList">포인트결제요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/pointChargingApprovalList">포인트결제승인완료 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/refundList">환불요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/refundApprovalList">환불승인 리스트</a>
 				            </li>
 				          	<li>
 	                    		<a href="${pageContext.request.contextPath}/refundCompleteList">환불승인완료 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchNotice" data-toggle="collapse">
 	                            <p>18.공지사항</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchNotice" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addNotice">공지사항 등록</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/noticeList">공지사항 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchCustomerService" data-toggle="collapse">
 	                            <p>19.고객센터</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchCustomerService" style="list-style:none;">
 	                    	
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllComplainList">신고 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllSanction">제재 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getAllInquireList">문의 리스트</a>
 				            </li>
 				        </ul>
 	                    <li>
 	                       <a href="#searchMedical" data-toggle="collapse">
 	                            <p>20.기타 서비스</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원 검색</a>
 				            </li>
 				        </ul>
	                </ul>
                </c:if>
                
               <!--일반회원 ,그룹장 레벨 2 메뉴  -->
				 <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==2}">
					<ul class="nav" data-placement="right">
				        <li>
 	                       <a href="#searchGroup" data-toggle="collapse">
 	                            <p>4.그룹 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchGroup" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/deleteGroupList">삭제 유예기간 그룹 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/groupList">내가 생성한 그룹 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/groupMain">그룹 메인</a>
 				            </li>
 				        </ul>
				        <li>
		                     <a href="#searchHealhScreen" data-toggle="collapse">
	 	                        <p>5.건강검진표 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchHealhScreen" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthScreenList">건강검진표 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchBloodSugar" data-toggle="collapse">
 	                            <p>6.혈당 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchBloodSugar" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addBloodSugar">혈당 등록</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/bloodSugarList">혈당 리스트</a>
 				            </li>
 				             <li>
 	                    		<a href="${pageContext.request.contextPath}/bloodsugarChart">혈당 차트</a>
 				            </li>
 				        </ul>
 				         <li>
 	                       <a href="#searchBloodPressure" data-toggle="collapse">
 	                            <p>7.혈압 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchBloodPressure" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addBloodPressure">혈압 등록</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/bloodPressure">혈압 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/bloodPressureChart">혈압 차트</a>
 				            </li>
 				        </ul>
 				        <li>
	                        <a href="#bodyMassIndex" data-toggle="collapse">
	                            <p>8.체질량 관리</p>
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
		                     <a href="#searchHealthSurvey" data-toggle="collapse">
	 	                        <p>9.건강설문 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchHealthSurvey" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthSurveyList">건강설문 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthSurveyResultList">나의 건강설문 목록</a>
 				            </li>
 				        </ul>
 				         <li>
 	                       <a href="#searchDisease" data-toggle="collapse">
 	                            <p>10.질병 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchDisease" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getMyDiseaseList">나의 질병 리스트</a>
 				      		</li>
 				        </ul>
 				        <li>
 	                       <a href="#searchDiet" data-toggle="collapse">
 	                            <p>11.다이어트 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchDiet" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getIngestCalorie">나의 섭취칼로리 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getConsumeCalorie">나의 소모칼로리 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
	                       <a href="#exerciseMatching" data-toggle="collapse">
	                            <p>12.운동 매칭 관리</p>
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
		                     <a href="#searchSchedule" data-toggle="collapse">
	 	                        <p>13.일정 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchSchedule" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getMedicationList">복약 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getTreatmentList">진료 리스트</a>
 				            </li>
 				        </ul>
 				         <li>
 	                       <a href="#searchDoctorFeedback" data-toggle="collapse">
 	                            <p>14.의사 피드백 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchDoctorFeedback" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/doctorFeedbackRequest">의사피드백 요청</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getDoctorFeedbackRequestList">의사피드백요청 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getDoctorFeedbackResultList">의사피드백답변 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
		                     <a href="#searchPTfeedback" data-toggle="collapse">
	 	                        <p>15.PT 피드백 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPTfeedback" style="list-style:none;">
	                     	<li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedbackList">운동피드백요청</a>
 				            </li>
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedbackPtList">운동피드백요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedResponseResultList">운동피드백답변 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
		                   <a href="#searchPaymemt" data-toggle="collapse">
	 	                      <p>16.결제 관리</p>
	 	                   </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPaymemt" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addPointCharging">포인트 결제 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/pointChargingApprovalList">포인트결제승인완료 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/addRefund">환불 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/refundList">환불신청 리스트</a>
 				            </li>
 				          	<li>
 	                    		<a href="${pageContext.request.contextPath}/refundCompleteList">환불승인완료 리스트</a>
 				            </li>
 				        </ul>
 				         <li>
		                     <a href="#searchMemberInfo" data-toggle="collapse">
	 	                        <p>17.회원건강정보 요청 및 제공 기능</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchMemberInfo" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/doctorRequestList">건강요청리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchNotice" data-toggle="collapse">
 	                            <p>18.공지사항</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchNotice" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/noticeList">공지사항 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchCustomerService" data-toggle="collapse">
 	                            <p>19.고객센터</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchCustomerService" style="list-style:none;">
 	                    	
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllComplainList">신고 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllSanction">제재 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getAllInquireList">문의 리스트</a>
 				            </li>
 				        </ul>
 	                    <li>
 	                       <a href="#searchMedical" data-toggle="collapse">
 	                            <p>20.기타 서비스</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원 검색</a>
 				            </li>
 				        </ul>
	                </ul>
	                
				</c:if>
				<!-- 의사회원 레벨 3메뉴 -->
				  <c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==3}">			
					<ul class="nav">
	                     <li>
		                     <a href="#searchHealthSurvey" data-toggle="collapse">
	 	                        <p>9.건강설문 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchHealthSurvey" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthSurveyList">건강설문 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchDoctorFeedback" data-toggle="collapse">
 	                            <p>14.의사 피드백 관리</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchDoctorFeedback" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getDoctorFeedbackRequestedList">의사피드백요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedResponseResultList">운동피드백답변 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
		                   <a href="#searchPaymemt" data-toggle="collapse">
	 	                      <p>16.결제 관리</p>
	 	                   </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPaymemt" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addPointCharging">포인트 결제 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/pointChargingApprovalList">포인트결제승인완료 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/addRefund">환불 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/refundList">환불신청 리스트</a>
 				            </li>
 				          	<li>
 	                    		<a href="${pageContext.request.contextPath}/refundCompleteList">환불승인완료 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
		                     <a href="#searchMemberInfo" data-toggle="collapse">
	 	                        <p>17.회원건강정보 요청 및 제공 기능</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchMemberInfo" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addrequestDoctor">회원정보 요청</a>
 				            </li>
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/doctorRequestList">회원정보요청 리스트</a>
 				            </li>
 				        </ul>
	                    	<a href="#searchNotice" data-toggle="collapse">
 	                            <p>18.공지사항</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchNotice" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/noticeList">공지사항 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchCustomerService" data-toggle="collapse">
 	                            <p>19.고객센터</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchCustomerService" style="list-style:none;">
 	                    	
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllComplainList">신고 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllSanction">제재 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getAllInquireList">문의 리스트</a>
 				            </li>
 				        </ul>
 	                    <li>
 	                       <a href="#searchMedical" data-toggle="collapse">
 	                            <p>20.기타 서비스</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원 검색</a>
 				            </li>
 				        </ul>
	                </ul>
				</c:if>
				<!-- PT회원 레벨 4메뉴-->
				<c:if test="${!empty sessionScope.memberSessionId && sessionScope.memberSessionLevel==4}">	
					<ul class="nav"  data-placement="right">
	                      <li>
		                     <a href="#searchHealthSurvey" data-toggle="collapse">
	 	                        <p>9.건강설문 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchHealthSurvey" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getHealthSurveyList">건강설문 리스트</a>
 				            </li>
 				        </ul>
						<li>
		                     <a href="#searchPTfeedback" data-toggle="collapse">
	 	                        <p>15.PT 피드백 관리</p>
	 	                     </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPTfeedback" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedbackPtList">운동피드백요청 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/exerciseFeedResponseResultList">답변한 운동피드백 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
		                   <a href="#searchPaymemt" data-toggle="collapse">
	 	                      <p>16.결제 관리</p>
	 	                   </a>
	                    </li>
	                     <ul class="sidenav-second-level collapse" id="searchPaymemt" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/addPointCharging">포인트 결제 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/pointChargingApprovalList">포인트결제 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/addRefund">환불 신청</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/refundList">환불신청 리스트</a>
 				            </li>
 				          	<li>
 	                    		<a href="${pageContext.request.contextPath}/refundCompleteList">환불승인완료 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
	                    	<a href="#searchNotice" data-toggle="collapse">
 	                            <p>18.공지사항</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchNotice" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/noticeList">공지사항 리스트</a>
 				            </li>
 				        </ul>
 				        <li>
 	                       <a href="#searchCustomerService" data-toggle="collapse">
 	                            <p>19.고객센터</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchCustomerService" style="list-style:none;">
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllComplainList">신고 리스트</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getAllSanction">제재 리스트</a>
 				            </li>
 				            <li>
 	                    		<a href="${pageContext.request.contextPath}/getAllInquireList">문의 리스트</a>
 				            </li>
 				        </ul>
 	                    <li>
 	                       <a href="#searchMedical" data-toggle="collapse">
 	                            <p>20.기타 서비스</p>
 	                        </a>
 	                    </li>
 	                    <ul class="sidenav-second-level collapse" id="searchMedical" style="list-style:none;">
 	                    	<li>
 	                    		<a href="${pageContext.request.contextPath}/getMedicineList">약품검색</a>
 				            </li>
 				            <li>
 				            	<a href="${pageContext.request.contextPath}/getMedicalList">병원 검색</a>
 				            </li>
 				        </ul>
	                </ul>
				</c:if>
				<!-- 비회원 메뉴 -->
 				<c:if test="${sessionScope.memberSessionLevel eq null}">
 					<ul class="nav"  data-placement="right">
 						<li>
 						 <a align="center">
 	                            <p>안녕하세요!<br>건강관리사이트 헬프입니다.</p>
 	                        </a>
 						</li>
 						<li>
 	                       <a href="https://github.com/KyungsuJin/Healthcare.git">
 	                            <p>깃허브</p>
 	                        </a>
 	                    </li>
 						<li>
 	                       <a href="./img/healthTeamSystemStructure.JPG" download>
 	                            <p>시스템구조도</p>
 	                        </a>
 	                    </li>
 						<li>
 	                       <a href="./img/healpTeamERD.gif" download>
 	                            <p>ERD</p>
 	                        </a>
 	                    </li>
 				        <li>
 	                       <a href="./img/#"  download>
 	                            <p>이력서</p>
 	                        </a>
 	                    </li>
 	                    <li>
 	                       <a href="#searchMedical" data-toggle="collapse">
 	                            <p>20.기타 서비스</p>
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
 	                </ul>
 				</c:if>
            </div>
         </div>
