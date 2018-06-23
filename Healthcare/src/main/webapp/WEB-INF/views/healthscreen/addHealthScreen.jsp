<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
		input[type=number]{ text-align: center; height:100%; }
		div[class=row]{ vertical-align: middle; }
		table{ text-align:center; align:center; }
	</style>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#healthScreenBtn").click(function(){
				$("#healthScreenForm").submit();
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
				<div id="healthScreenContainer" align="center">
					<form id="healthScreenForm" method="POST" action="${pageContext.request.contextPath}/addHealthScreen">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<div class="card">
                           			<div class="card-header" data-background-color="purple"><h4 class="title">건강검진표 등록</h4></div>
		                   			<div class="card-content">
										<input type="hidden" name="memberNo" value="${sessionScope.memberSessionNo}">
										<div class="col-md-6">
											키
											<input type="number" class="form-control" id="bodyHeight" name="bodyHeight">
										</div>
										<div class="col-md-6">
											몸무게
											<input type="number" class="form-control" id="bodyWeight" name="bodyWeight">
										</div>
										<div class="col-md-6">
											허리둘레
											<input type="number" class="form-control" id="bodyWaistSize" name="bodyWaistSize">
										</div>
										<div class="col-md-6">
											BMI
											<input type="number" class="form-control" id="bodyMassIndex" name="bodyMassIndex">
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
													<td><input type="number" id="systolicPressure" class="form-control" name="systolicPressure"></td>
													<td>mmHg</td>
													<td>120미만</td>
												</tr>
												<tr>
													<td>이완기혈압</td>
													<td><input type="number" id="diastolicPressure" class="form-control" name="diastolicPressure"></td>
													<td>mmHg</td>
													<td>80미만</td>
												</tr>
												<tr>
													<td>당뇨</td>
													<td>공복혈당</td>
													<td><input type="number" id="fastingBloodSugar" class="form-control" name="fastingBloodSugar"></td>
													<td>mmHg</td>
													<td>100미만</td>
												</tr>
												<tr>
													<td rowspan="4">고혈압, 이상지질혈증, 동맥경화</td>
													<td>총 콜레스테롤</td>
													<td><input type="text" id="totalCholesterol" class="form-control" name="totalCholesterol"></td>
													<td>mmHg</td>
													<td>200미만</td>
												</tr>
												<tr>
													<td>ldl 콜레스테롤</td>
													<td><input type="text" id="ldlCholesterol" class="form-control" name="ldlCholesterol"></td>
													<td>mmHg</td>
													<td>130미만</td>
												</tr>
												<tr>
													<td>중성지방</td>
													<td><input type="text" id="neutralFat" class="form-control" name="neutralFat"></td>
													<td>mmHg</td>
													<td>150미만</td>
												</tr>
												<tr>
													<td>HDL-콜레스테롤</td>
													<td><input type="text" id="hdlCholesterol" class="form-control" name="hdlCholesterol"></td>
													<td>mmHg</td>
													<td>60이상</td>
												</tr>
												<tr>
													<td>신장질환</td>
													<td>요단백</td>
													<td colspan="2"><select id="proteinuria" class="form-control" name="proteinuria"><option value="음성">음성</option><option value="양성">양성</option></select></td>
													<td>음성</td>
												</tr>
												<tr>
													<td>빈혈 등</td>
													<td>혈색소</td>
													<td><input type="text" id="hemoglobin" class="form-control" name="hemoglobin"></td>
													<td>g/dL</td>
													<td>남 : 13~16.5, 여 : 12~15.5</td>
												</tr>
												<tr>
													<td rowspan="2">만성신장질환</td>
													<td>혈청크레아티닌</td>
													<td><input type="text" id="serumCreatinine" class="form-control" name="serumCreatinine"></td>
													<td>mg/dL</td>
													<td>1.5 이하</td>
												</tr>
												<tr>
													<td>신사구체여과율(GFR)</td>
													<td><input type="text" id="gfr" class="form-control" name="gfr"></td>
													<td>mL/min</td>
													<td>60 이상</td>
												</tr>
											</tbody>
										</table>
										<input type="button" class="btn btn-default" id="healthScreenBtn" value="요청">
									</div>
								</div>
							</div>
						</div>
					</form>
					<input id="getHealthScreenListBtn" class="btn btn-default" type="button" value="목록">
				</div>
			</div>
		</div>
	</div>
</body>
</html>