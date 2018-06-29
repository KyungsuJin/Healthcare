<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#medicineBtn{ margin-top:0px; margin-bottom:0px; }
	.form-group{ padding-bottom: 0px; margin: 0px 0 0 0; }
	input[type=button]{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; }
</style>
<script>
	$(document).ready(function(){
		$(document).on("click","#medicineBtn", function(){
			$("#medicineForm").submit();
		});
		
		$(document).on("click",".medicineDetail",function(){
			var detail = $(this).closest(".row").siblings("div");
			if(detail[0].style.display == "none"){
				detail[0].style.display="";
				detail[0].style.visibility="visible";
			} else{
				detail[0].style.display="none";
				detail[0].style.visibility="hidden";
			}
			
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
				<div id="containerMedicine" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
								<div class="card-header" data-background-color="purple"><h4 class="title">의약품 검색</h4></div>
								<form id="medicineForm" action="${pageContext.request.contextPath}/getMedicineList" method="post">
									<input type="hidden" name="windowPop" value="0">
									<div class="col-md-3 col-md-offset-4">
										<input type="text" class="form-control" name="medicineName" value="${medicineName}" placeholder="약품 명 ex)이부펜">
									</div>
									<div class="col-md-1">
										<input type="button" class="btn btn-primary" id="medicineBtn" name="medicineBtn" value="검색">
									</div>
								</form>
								<div>
									<c:forEach var = "medicine" items = "${list}">
										<div>
											<input type="hidden" id="medicineNo" value="${medicine.medicineNo}">
											<input type="hidden" id="medicineName" value="${medicine.medicineName}">
											<div class="row">
												<div class="col-md-9 col-md-offset-1" style="padding-top: 15px; padding-bottom: 15px; border-bottom:1px solid; border-bottom-color:#9c27b0;">${medicine.medicineName}</div>
												<div class="col-md-1"><input type="button" class="medicineDetail btn btn-primary" value="보기"></div>
											</div>
											<div style="display:none; visibility:hidden;">
												<div class="row">
													<div class="col-md-3">업체 명</div>
													<div class="col-md-9">${medicine.medicineManufacturer}</div>
												</div>
												<div class="row">
													<div class="col-md-3">원료 성분 </div>
													<div class="col-md-9">${medicine.medicineMaterial}</div>
												</div>
												<div class="row">
													<div class="col-md-3">저장 방법</div>
													<div class="col-md-9">${medicine.medicineStorageMethod}</div>
												</div>
												<div class="row">
													<div class="col-md-3">유효 기간</div>
													<div class="col-md-9">${medicine.medicineValidTerm}</div>
												</div>
												<div class="row">
													<div class="col-md-3">전문 일반</div>
													<div class="col-md-9">${medicine.medicineEtcOtc}</div>
												</div>
												<div class="row">
													<div class="col-md-3">분류</div>
													<div class="col-md-9">${medicine.medicineClass}</div>
												</div>
												<div class="row">
													<div class="col-md-3">외견</div>
													<div class="col-md-9">${medicine.medicineAppear}</div>
												</div>
												<div class="row">
													<div class="col-md-3">포장 용량</div>
													<div class="col-md-9">${medicine.medicinePack}</div>
												</div>
												<div class="row">
													<div class="col-md-3">허가 일자</div>
													<div class="col-md-9">${medicine.medicinePermissionDate}</div>
												</div>
												<div class="row">
													<div class="col-md-3">주의사항</div>
													<div class="col-md-9"><a target="_blank" href="http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq=${medicine.medicineNo}">바로가기</a></div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<nav>
									<ul class="pagination">
										<c:choose>
											<c:when test="${beforePage eq 0}">
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${firstPage}" aria-label="First"> <span aria-hidden="true">&laquo;</span></a></li>
												<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${beforePage}" aria-label="Previous"> <span aria-hidden="true">&lt;</span></a></li>
											</c:otherwise>
										</c:choose>
										<c:set var="doneLoop" value="false"/>
										<c:forEach var="i" begin="${beforePage+1}" end="${afterPage-1}" step="1">
											<c:if test="${not doneLoop}"> 
												<c:choose>
													<c:when test="${i eq currentPage && (i eq lastPage || lastPage eq 0)}">
														<li class="active"><a>${i}</a></li>
														<c:set var="doneLoop" value="true"/>
													</c:when>
													<c:when test="${i eq currentPage}">
														<li class="active"><a>${i}</a></li>
													</c:when>
													<c:when test="${i eq lastPage}">
														<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${i}">${i}</a></li>
														<c:set var="doneLoop" value="true"/>
													</c:when>
													<c:otherwise>
														<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${i}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
										
										<c:choose>
											<c:when test="${lastPage < afterPage}">
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${afterPage}" aria-label="Next"> <span aria-hidden="true">&gt;</span></a></li>
												<li><a href="${pageContext.request.contextPath}/getMedicineList?medicineName=${medicineName}&currentPage=${lastPage}" aria-label="Last"> <span aria-hidden="true">&raquo;</span></a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>