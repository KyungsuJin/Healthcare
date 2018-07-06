<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>myCalorie.jsp</h1>
	<h3><a href="${pageContext.request.contextPath}/addIngestCalorie">소모칼로리등록하기</a></h3>
	<h3><a href="${pageContext.request.contextPath}/getIngestCalorie">등록된 소모칼로리 리스트보기</a></h3>
	
	
	
	<div>
		<h3>나의칼로리 누적현황</h3>
		
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<td></td>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>

<h1>get Ingest Calorie.jsp</h1>
	<table class="table">
		<thead>
			<tr>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ingestCalorie" items="${list}" varStatus="status">
				<input type="hidden" class="memberNo" value="${ingestCalorie.memberNo}">
				<tr>
					<td>${status.count}</td>
					<td>${ingestCalorie.foodName}</td>
					<td>${ingestCalorie.ingestWeight}</td>
					<td>${ingestCalorie.ingestCalorieDate}</td>
					<td><a href="">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/removeIngestCalorie?ingestCalorieNo=${ingestCalorie.ingestCalorieNo}&memberNo=${ingestCalorie.memberNo}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" class="btnA">ssibal</button>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="panel panel-defult" >
				<div class="pd panel-body form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">오늘총섭취칼로리</label>
						<div class="col-sm-9">
							<div style="margin-top: 4px">날짜선택 : <input type="text" id="datePicker"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">일일칼로리</label>
						<div class="col-sm-9">
							<div class="divKcal"></div>
						</div>
					</div>
					<div class="form-group" style="margin-top: 4px;">
						<div class="form-group">
							<label class="col-sm-3 control-label">탄수화물</label>
							<div class="col-sm-9">
								<div class="divCarbohydrate"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">단백질</label>
							<div class="col-sm-9">
								<div class="divProtein"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">지방</label>
							<div class="col-sm-9">
								<div class="divFat"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">당류</label>
							<div class="col-sm-9">
								<div class="divSugar"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">나트륨</label>
							<div class="col-sm-9">
								<div class="divNatrium"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">콜레스테롤</label>
							<div class="col-sm-9">
								<div class="divCholesterol"></div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">불포화지방산</label>
							<div class="col-sm-9">
								<div class="divSfa"></div>
							</div>
						</div>
					
					</div>
					
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>	
	</div>