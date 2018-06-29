<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
	input{ text-align:center; }
	#removeMedicationBtn{ float: right; }
	#modifyMedicationBtn{ float: right; }
	#medicationContent{ height: 300px; }
</style>
<script>
	$(document).ready(function(){
		var medicationValue = $('#medicationNo').val();
		var medicineSeq = $("#medicineNo").val().split("_")[1];
		$("#medicationListBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/getMedicationList?currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#removeMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/removeMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		
		$("#modifyMedicationBtn").click(function(){
			$(location).attr('href', "${pageContext.request.contextPath}/modifyMedication?medicationNo=${medicationResponse.medicationNo}&currentPage=${currentPage}&pagePerRow=${pagePerRow}");
		});
		$("#addStick").click(function(){
			var date = $('#medicationRecordDate').val();
			var startDate = $('#medicationStartDate').val();
			var endDate = $('#medicationEndDate').val();
			var recordNo = $('#medicationNo').val();
			if((date >= startDate)&&(date < endDate)){
				myCalendar.fullCalendar('renderEvent', { title: '복약완료', start: date }, false);
				$.ajax({
			    	url : '${pageContext.request.contextPath}/addMedicationRecord'
			        , type : 'post'
			        , data : {
			        	medicationNo : recordNo
			        	, medicationRecordDate : date
			        }
			        , dataType : 'text'
			        , success : function(data) {
			        	
			        }
			        , error : function() { console.log('error');}
				});
			}
			$('#medicationRecordDate').val('');
			$('#exampleModal').modal('hide')
		});
		var myCalendar = $('#calendar');
		var myEvent = {
		                title: '복약완료'
		                , start: '2018-06-25'
		              }
		myCalendar.fullCalendar({
			header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            }
            , editable : false
            , eventLimit : true
	        , events: function(start, end, timezone, callback) {
	        	$.ajax({
	        		url: '${pageContext.request.contextPath}/getMedicationRecordList'
	        		, type: 'post'
	        		, data: {
	        			medicationNo : medicationValue
	        		}
	        		, dataType: 'json'
	        		, success: function(data, text, request) { 
	        			var events = [];
	        			events.push({
	        				backgroundColor: '#FFA7A7'
                            , start: $(data.termDate).attr('start')
                            , end: $(data.termDate).attr('end')
                            , rendering: 'background'
                            ,title: '복약완료'
                        });
	        			$(data.medicationDateList).each(function() {
	                        events.push({
	                             title: '복약완료'
	                            , start: $(this).attr('medicationRecordDate')
	                        });
	                    });
	    	        	callback(events); 
	        		} 
	        	});
	        }
            , eventMouseover: function(calEvent, jsEvent, view) { 
            	var target = $(jsEvent.currentTarget);
            	var getDate = calEvent.start._i;
            	var spanTag = '';
            	spanTag += '<span class="pull-right removeButton" data-cal-date="'+getDate+'" style="color:#fff; padding-top:1px;">';
            	spanTag += '<i class="glyphicon glyphicon-remove-circle"></i>';
            	spanTag += '</span>';
            	target.find('div').append(spanTag);            
            
            }
            , eventMouseout: function(calEvent, jsEvent, view) {      
            	var target = $(jsEvent.currentTarget);
            	target.find('.removeButton').remove();
            
            }
            , eventClick: function(calEvent, jsEvent, view) {
            	var getDate = calEvent.start._i;
            	var target = $(jsEvent.currentTarget);
            	
            }
		});
		
		$(document).on("click", ".removeButton", function(){
			var getDate = $(this).attr('data-cal-date');
			var medicationValue = $("#medicationNo").val();
			$(this).parents('a').remove();
			$.ajax({
		    	url : '${pageContext.request.contextPath}/removeMedicationRecordDate'
		        , type : 'post'
		        , data : {
		        	medicationNo : medicationValue
		        	, medicationRecordDate : getDate
		        }
		        , dataType : 'text'
		        , success : function(data) {
		        	
		        }
		        , error : function() { console.log('error');}
			});
		});
		$(document).on("click", "#medicineInfo", function(){
			var openNewWindow = window.open("about:blank");
			openNewWindow.location.href = "http://drug.mfds.go.kr/html/bxsSearchDrugProduct.jsp?item_Seq="+medicineSeq;
		});
	});
</script>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar-scheduler/1.9.4/scheduler.css">
<script type="text/javascript" src="https://fullcalendar.io/releases/fullcalendar-scheduler/1.9.4/scheduler.min.js"></script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div id="containerMedication" align="center">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="card">
								<div class="card-header" data-background-color="purple"><h4 class="title">복약 내용</h4></div>
								<div class="col-md-12">
									<input id="removeMedicationBtn" class="btn btn-default" type="button" value="삭제">
									<input id="modifyMedicationBtn" class="btn btn-default" type="button" value="수정">
									<input type="hidden" id="medicationNo" class="form-control" name="medicationNo" readonly value="${medicationResponse.medicationNo}">
									<input type="hidden" id="medicineSeq" class="form-control" name="medicineSeq" readonly>
									<input type="hidden" id="medicineNo" class="form-control" name="medicineNo" value="${medicationResponse.medicineNo}" readonly>
									<div class="col-md-10">약 이름  <input id="medicineName" class="form-control" name="medicineName" value="${medicationResponse.medicineName}" readonly></input></div>
									<div class="col-md-2"><input type="button" id="medicineInfo" class="btn btn-default" value="자세히"></div>
								</div>
								<div class="col-md-12">
									<div class="col-md-5">시작  <input id="medicationStartDate" class="form-control" type="date" name="medicationStartDate" value="${medicationResponse.medicationStartDate}" readonly></div>
									<div class="col-md-2" style="margin-top : 30px">~</div>
									<div class="col-md-5">끝  <input id="medicationEndDate" class="form-control" type="date" name="medicationEndDate" value="${medicationResponse.medicationEndDate}" readonly></div>
								</div>
								<div class="col-md-12">
									<div class="col-md-5">일일 복용량  <input id="dosage" class="form-control" type="number" name="dosage" value="${medicationResponse.dosage}" readonly></div>
									<div class="col-md-5 col-md-offset-2">총 복용량  <input id="totalDosage" class="form-control" type="text" name="totalDosage" value="${medicationResponse.totalDosage}" readonly></div>
								</div>
								<div class="col-md-2 col-md-offset-5">
									<input type="button" class="btn default-btn" data-toggle="modal" data-target="#exampleModal" value="복용일 추가">
									<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="exampleModalLabel">복용일 추가(yyyy-mm-dd)</h4>
												</div>
												<div class="modal-body">
													<form>
														<div class="form-group">
															<input type="text" class="form-control" id="medicationRecordDate">
														</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
													<button type="button" id="addStick" class="btn btn-primary">등록</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id='calendar' class="col-md-12"></div>
								<div class="col-md-12">
									<div>복용 제목  <input id="medicationTitle" class="form-control" name="medicationTitle" value="${medicationResponse.medicationTitle}" readonly></input></div>
									<div>복용 내용  <textarea id="medicationContent" class="form-control" name="medicationContent" readonly>${medicationResponse.medicationContent}</textarea></div>
									<input id="medicationListBtn" class="btn btn-default" type="button" value="목록">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>