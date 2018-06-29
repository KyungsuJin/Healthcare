<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	.medicineReturn{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;}
	.medicineDetail{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;}
	#medicineBtn{ margin-top:0px; margin-bottom:0px; }
	.form-group{ padding-bottom: 0px; margin: 0px 0 0 0; }
	input[type=button]{ width: 50px; height: 30px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px; }
</style>
<script>
	$(document).ready(function(){
		function removeWindow(){
			if(opener != null){
				opener.medicineForm = null
				self.close();
			}
		}
		$(document).on("click","#medicineBtn", function(){
			$("#medicineForm").submit();
		});
		
		$(document).on("click",".medicineDetail",function(){
			var detail = $(this).closest(".row").siblings("div");
			console.log($(this).closest(".row").siblings("div"));
			if(detail[0].style.display == "none"){
				detail[0].style.display="";
				detail[0].style.visibility="visible";
			} else{
				detail[0].style.display="none";
				detail[0].style.visibility="hidden";
			}
		});
		$(document).on("click",".medicineReturn",function(){
			console.log($(this).closest(".row").siblings("#medicineNo").val())
			console.log($(this).closest(".row").siblings("#medicineName").val())
			opener.document.medicationForm.medicineNo.value = "medicine_"+$(this).closest(".row").siblings("#medicineNo").val();
			opener.document.medicationForm.medicineName.value = $(this).closest(".row").siblings("#medicineName").val();
			opener.document.medicationForm.medicineSeq.value = $(this).closest(".row").siblings("#medicineNo").val();
			removeWindow();	
		});
	});	
</script>
</head>
<body background="white">
	<div id="containerMedicine" align="center">
		<div class="row">
			<div class="col-xs-12">
				<form id="medicineForm" action="${pageContext.request.contextPath}/getMedicineList" method="post">
					<input type="hidden" name="windowPop" value="1">
					<div class="col-xs-3 col-xs-offset-4">
						<input type="text" class="form-control" name="medicineName" value="${medicineName}" placeholder="약품 명 ex)이부펜">
					</div>
					<div class="col-xs-1">
						<input type="button" class="btn btn-primary" id="medicineBtn" name="medicineBtn" value="검색">
					</div>
				</form>
				<c:forEach var = "medicine" items = "${list}">
					<div>
						<input type="hidden" id="medicineNo" value="${medicine.medicineNo}">
						<input type="hidden" id="medicineName" value="${medicine.medicineName}">
						<div class="row" style="border-bottom:1px solid; border-bottom-color:#9c27b0;">
							<div class="col-xs-9" style="padding-top: 15px; padding-bottom: 15px;">${medicine.medicineName}</div>
							<div class="col-xs-1"><input type="button" class="medicineReturn btn btn-primary" value="선택"></div>
							<div class="col-xs-1"><input type="button" class="medicineDetail btn btn-primary" value="보기"></div>
						</div>
						<div style="display:none; visibility:hidden;">
							<div class="row">
								<div class="col-xs-3">업체 명</div>
								<div class="col-xs-9">${medicine.medicineManufacturer}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">원료 성분 </div>
								<div class="col-xs-9">${medicine.medicineMaterial}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">저장 방법</div>
								<div class="col-xs-9">${medicine.medicineStorageMethod}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">유효 기간</div>
								<div class="col-xs-9">${medicine.medicineValidTerm}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">전문 일반</div>
								<div class="col-xs-9">${medicine.medicineEtcOtc}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">분류</div>
								<div class="col-xs-9">${medicine.medicineClass}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">외견</div>
								<div class="col-xs-9">${medicine.medicineAppear}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">포장 용량</div>
								<div class="col-xs-9">${medicine.medicinePack}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">허가 일자</div>
								<div class="col-xs-9">${medicine.medicinePermissionDate}</div>
							</div>
							<div class="row">
								<div class="col-xs-3">주의사항</div>
								<div class="col-xs-9"><a target="_blank" href="http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq=${medicine.medicineNo}">바로가기</a></div>
							</div>
						</div>
					</div>
				</c:forEach>
				<nav>
					<ul class="pagination">
						<c:choose>
							<c:when test="${beforePage eq 0}">
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&edicineName=${medicineName}&currentPage=${firstPage}" aria-label="First"> <span aria-hidden="true">&laquo;</span></a></li>
								<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&medicineName=${medicineName}&currentPage=${beforePage}" aria-label="Previous"> <span aria-hidden="true">&lt;</span></a></li>
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
										<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&medicineName=${medicineName}&currentPage=${i}">${i}</a></li>
										<c:set var="doneLoop" value="true"/>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&medicineName=${medicineName}&currentPage=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${lastPage < afterPage}">
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&medicineName=${medicineName}&currentPage=${afterPage}" aria-label="Next"> <span aria-hidden="true">&gt;</span></a></li>
								<li><a href="${pageContext.request.contextPath}/getMedicineList?windowPop=1&medicineName=${medicineName}&currentPage=${lastPage}" aria-label="Last"> <span aria-hidden="true">&raquo;</span></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>