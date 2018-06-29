<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<style>
		input[type=number]{ text-align: center; height:100%; }
		#removeHealthScreenBtn{ float: right; }
		#modifyHealthScreenBtn{ float: right; }
		table{ text-align:center; align:center; }
</style>
	<script>
	$(document).ready(function(){
		$("#removeHealthScreenBtn").click(function(){
			location.href="${pageContext.request.contextPath}/removeHealthScreen?healthScreenNo=${healthScreen.healthScreenNo}";
		});
		
		$("#modifyHealthScreenBtn").click(function(){
			location.href="${pageContext.request.contextPath}/modifyHealthScreen?healthScreenNo=${healthScreen.healthScreenNo}";
		});
		$("#getHealthScreenListBtn").click(function(){
			location.href="${pageContext.request.contextPath}/getHealthScreenList";
		});
		
	});	
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="healthScreenResultContainer" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
                           		<div class="card-header" data-background-color="purple"><h4 class="title">건강검진표 결과</h4></div>
                           		<div class="col-md-12">
									<input id="removeHealthScreenBtn" class="btn btn-default" type="button" value="삭제">
									<input id="modifyHealthScreenBtn" class="btn btn-default" type="button" value="수정">
								</div>
								<div class="col-md-6">
									키
									<input type="number" class="form-control" id="bodyHeight" name="bodyHeight" value="${bodyMassIndex.bodyHeight}" readonly>
								</div>
								<div class="col-md-6">
									몸무게
									<input type="number" class="form-control" id="bodyWeight" name="bodyWeight" value="${bodyMassIndex.bodyWeight}" readonly>
								</div>
								<div class="col-md-6">
									허리둘레
									<input type="number" class="form-control" id="bodyWaistSize" name="bodyWaistSize" value="${bodyMassIndex.bodyWaistSize}" readonly>
								</div>
								<div class="col-md-6">
									BMI
									<input type="number" class="form-control" id="bodyMassIndex" name="bodyMassIndex" value="${bodyMassIndex.bodyMassIndex}" readonly>
								</div>
								<table class="table">
									<tbody>
										<tr>
											<td>질환</td>
											<td>항목</td>
											<td colspan="2">수치</td>
											<td>정상수치</td>
										</tr>
										<tr>
											<td rowspan="2">고혈압</td>
											<td>수축기혈압</td>
											<td><input type="number" id="systolicPressure" class="form-control" name="systolicPressure" value="${bloodPressure.systolicPressure}" readonly></td>
											<td>mmHg</td>
											<td>120미만</td>
										</tr>
										<tr>
											<td>이완기혈압</td>
											<td><input type="number" id="diastolicPressure" class="form-control" name="diastolicPressure" value="${bloodPressure.diastolicPressure}" readonly></td>
											<td>mmHg</td>
											<td>80미만</td>
										</tr>
										<tr>
											<td>당뇨</td>
											<td>공복혈당</td>
											<td><input type="number" id="fastingBloodSugar" class="form-control" name="fastingBloodSugar" value="${bloodSugar.fastingBloodSugar}" readonly></td>
											<td>mmHg</td>
											<td>100미만</td>
										</tr>
										<tr>
											<td rowspan="4">고혈압, 이상지질혈증, 동맥경화</td>
											<td>총 콜레스테롤</td>
											<td><input type="number" id="totalCholesterol" class="form-control" name="totalCholesterol" value="${healthScreen.totalCholesterol}" readonly></td>
											<td>mmHg</td>
											<td>200미만</td>
										</tr>
										<tr>
											<td>LDL-콜레스테롤</td>
											<td><input type="number" id="ldlCholesterol" class="form-control" name="ldlCholesterol" value="${healthScreen.ldlCholesterol}" readonly></td>
											<td>mmHg</td>
											<td>130미만</td>
										</tr>
										<tr>
											<td>중성지방</td>
											<td><input type="number" id="neutralFat" class="form-control" name="neutralFat" value="${healthScreen.neutralFat}" readonly></td>
											<td>mmHg</td>
											<td>150미만</td>
										</tr>
										<tr>
											<td>HDL-콜레스테롤</td>
											<td><input type="number" id="hdlCholesterol" class="form-control" name="hdlCholesterol" value="${healthScreen.hdlCholesterol}" readonly></td>
											<td>mmHg</td>
											<td>60이상</td>
										</tr>
										<tr>
											<td>신장질환</td>
											<td>요단백</td>
											<td colspan="2">
												<c:choose>
													<c:when test="${healthScreen.proteinuria eq '음성'}">
														<select id="proteinuria" class="form-control" name="proteinuria"><option value="음성">음성</option></select>
													</c:when>
													<c:otherwise>
														<select id="proteinuria" class="form-control" name="proteinuria"><option value="양성">양성</option></select>
													</c:otherwise>
												
												</c:choose>
											</td>
											<td>음성</td>
										</tr>
										<tr>
											<td>빈혈 등</td>
											<td>혈색소</td>
											<td><input type="number" id="hemoglobin" class="form-control" name="hemoglobin" value="${healthScreen.hemoglobin}" readonly></td>
											<td>g/dL</td>
											<td>남 : 13~16.5, 여 : 12~15.5</td>
										</tr>
										<tr>
											<td rowspan="2">만성신장질환</td>
											<td>혈청크레아티닌</td>
											<td><input type="number" id="serumCreatinine" class="form-control" name="serumCreatinine" value="${healthScreen.serumCreatinine}" readonly></td>
											<td>mg/dL</td>
											<td>1.5 이하</td>
										</tr>
										<tr>
											<td>신사구체여과율(GFR)</td>
											<td><input type="number" id="gfr" class="form-control" name="gfr" value="${healthScreen.gfr}" readonly></td>
											<td>mL/min</td>
											<td>60 이상</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td>건강검진 결과</td>
											<td colspan="4">
												체중 - BMI지수가 ${bodyMassIndex.bodyMassIndex}으로 
												<c:choose>
													<c:when test="${bodyMassIndex.bodyMassIndex <= 18.5}">
														저체중 입니다.
													</c:when>
													<c:when test="${bodyMassIndex.bodyMassIndex <= 26}">
														정상 입니다.
													</c:when>
													<c:when test="${bodyMassIndex.bodyMassIndex > 26}">
														과체중 입니다.
													</c:when>
													<c:when test="${bodyMassIndex.bodyMassIndex >= 30}">
														고도비만 입니다.
													</c:when>
												</c:choose>
												<br>
												혈압 - 
												<c:choose>
													<c:when test="${bloodPressure.systolicPressure >= 145 or bloodPressure.diastolicPressure >= 95}">
														고혈압 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${bloodPressure.systolicPressure < 145 or bloodPressure.diastolicPressure < 95}">
														고혈압 (경고) 상태 입니다.
													</c:when>
													<c:when test="${bloodPressure.systolicPressure < 120 or bloodPressure.diastolicPressure < 80}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												혈당 - 
												<c:choose>
													<c:when test="${bloodSugar.fastingBloodSugar >= 125}">
														당뇨 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${bloodSugar.fastingBloodSugar < 125}">
														당뇨 (경고) 상태 입니다.
													</c:when>
													<c:when test="${bloodSugar.fastingBloodSugar < 100}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												총콜레스테롤 - 
												<c:choose>
													<c:when test="${healthScreen.totalCholesterol > 239}">
														당뇨 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.totalCholesterol >= 200}">
														당뇨 (경고) 상태 입니다.
													</c:when>
													<c:when test="${healthScreen.totalCholesterol < 200}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												HDL-콜레스테롤 - 
												<c:choose>
													<c:when test="${healthScreen.hdlCholesterol < 40}">
														당뇨 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.hdlCholesterol < 60}">
														당뇨 (경고) 상태 입니다.
													</c:when>
													<c:when test="${healthScreen.hdlCholesterol >= 60}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												중성지방 - 
												<c:choose>
													<c:when test="${healthScreen.neutralFat >= 200}">
														당뇨 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.neutralFat >= 150}">
														당뇨 (경고) 상태 입니다.
													</c:when>
													<c:when test="${healthScreen.neutralFat < 150}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												LDL-콜레스테롤 - 
												<c:choose>
													<c:when test="${healthScreen.ldlCholesterol >= 160}">
														당뇨 (위험) 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.ldlCholesterol >= 100}">
														당뇨 (경고) 상태 입니다.
													</c:when>
													<c:when test="${healthScreen.ldlCholesterol < 100}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												요단백 - 
												<c:choose>
													<c:when test="${healthScreen.proteinuria eq '양성'}">
														소변 속에 단백질 검출 되었습니다. 2차진단이 필요합니다.
													</c:when>
													<c:otherwise>
														정상 입니다.
													</c:otherwise>
												</c:choose>
												<br>
												혈색소 - 
												<c:choose>
													<c:when test="${healthScreen.hemoglobin >= 16}">
														혈색소 수치가 높은 상태 입니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.hemoglobin <= 11.5}">
														혈색소 수치가 낮습니다. 빈혈·관절염·백혈병 등을 의심할 수 있습니다. 2차진단이 필요합니다.
													</c:when>
													<c:when test="${healthScreen.hemoglobin < 100}">
														정상 입니다.
													</c:when>
												</c:choose>
												<br>
												혈청크레아티닌 - 
												<c:choose>
													<c:when test="${healthScreen.serumCreatinine > 1.5}">
														크레아티닌의 수치가 불균형합니다. 2차진단이 필요합니다.
													</c:when>
													<c:otherwise>
														정상 입니다.
													</c:otherwise>
												</c:choose>
												<br>
												신사구체여과율 - 
												<c:choose>
													<c:when test="${healthScreen.gfr < 60}">
														2차진단이 필요합니다.
													</c:when>
													<c:otherwise>
														정상 입니다.
													</c:otherwise>
												</c:choose>
												
												
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
					<input id="getHealthScreenListBtn" class="btn btn-default" type="button" value="목록">
				</div>
			</div>
		</div>
	</div>
</body>
</html>