<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	#containerMedicine{ width: 1000px; margin: auto; }
</style>
<script>
	$(document).ready(function(){
		$(document).on("click","#medicineBtn", function(){
			$("#medicineForm").submit();
		});
		
		$(document).on("click",".medicineDetail",function(){
			var detail = $(this).siblings("div");
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
							<form id="medicineForm" action="${pageContext.request.contextPath}/getMedicineList" method="post">
								약품명 : <input type="text" name="medicineName" value="${medicineName}">
								<button id="medicineBtn" class="btn btn-default" type="button">저장</button>
							</form>
							<h1>MedicineList</h1>
							<div>
								<div>
									medicineNo
									medicineName
								</div>
								<c:forEach var = "medicine" items = "${list}">
									<div>
											${medicine.medicineNo}
											${medicine.medicineName}
											<input type="button" class="medicineDetail" value="보기">
											<div style="display:none; visibility:hidden;">
												업체 명 : ${medicine.medicineManufacturer}<br>
												원료 성분 : ${medicine.medicineMaterial}<br>
												저장 방법 : ${medicine.medicineStorageMethod}<br>
												유효 기간 : ${medicine.medicineValidTerm}<br>
												전문 일반 : ${medicine.medicineEtcOtc}<br>
												분류 : ${medicine.medicineClass}<br>
												외견 : ${medicine.medicineAppear}<br>
												포장 용량 : ${medicine.medicinePack}<br>
												허가 일자 : ${medicine.medicinePermissionDate}<br>
												주의사항 : <a target="_blank" href="http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq=${medicine.medicineNo}">바로가기</a>
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

</body>
</html>