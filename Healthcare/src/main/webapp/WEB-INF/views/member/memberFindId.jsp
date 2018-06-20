<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		var re = /[~!@\#$%^&*\()\-=+_']/gi;	
		var email =/^([\w-]+(?:\.[\w-]+)*)/i;
	    var emailEnd =/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    var blank =/[\s]/g;
	    var number = /^[0-9]*$/;
	    $(document).ready(function(){
			$("#memberFind").keypress(function(e){
				if(e.which==13){
					$("#submitBtn").click();
				}
			})
			/* 유효성검사 */
			$("#submitBtn").click(function(){
				if($("#memberName").val()=='' || blank.test($("#memberName").val())){
		            alert('이름은 필수 입력값 입니다.');
		            $("#memberName").focus();
		        }else if($("#memberEmail1").val()=='' || !email.test($("#memberEmail1").val())){
		            alert('올바른 이메일을 입력해 주세요.');
		            $("#memberEmail").focus();
		        }else if(!emailEnd.test($("#memberEmail2").val())){
		            alert('이메일 을 골라주세요.');
		            $("#emailSelect").focus();
		        }else{
		        	$("#memberEmail").val($("#memberEmail1").val()+'@'+$("#memberEmail2").val());
		        	$.ajax({
		        		type:"POST"
		        		,url : "${pageContext.request.contextPath}/memberFindId"
		        		,data : {"memberName" : $("#memberName").val()
								,"memberEmail":$("#memberEmail").val()}
		        		,dataType:"json",
		        		success:function(data){
		        			if(data.memberId=="0"){
		        				alert('해당정보로 가입된 아이디가 없습니다.');
		        			}else{
		        				$("#memberId").val(data.memberId);
		        				window.open("${pageContext.request.contextPath}/memberFindIdResult?memberId"
		        							,"memberFind","width=500, height=300,resizable=no,scrollbars=no")
		        			}
		        		},
		        		error:function(jqXHR, textStatus, errorThrown){
		        			console.log("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        		}
		        	})
		        }
				
			})
			$("#emailSelect").change(function(){
				$("#memberEmail2").val($(this).val());
      		})
		})
	</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" data-background-color="purple">
								<h4 class="title">아이디 찾기</h4>
							</div>
							<div class="card-content">
								<form action="${pageContext.request.contextPath}/memberFindId" name="memberFind" id="memberFind" method="POST">
									<input type="hidden" name="memberEmail" id="memberEmail">
									<input type="hidden" id="memberId" name="memberId">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">이름</label>
												<input class="form-control" type="text" name="memberName" id="memberName">
											</div>
											<div class="row">
												<div class="form-group col-md-4">
													<label class="control-label">이메일</label>
													<input class="form-control" type="text" name="memberEmail1" id="memberEmail1">
												</div>
												<div class="form-group col-md-4">
													<label class="control-label">도메인</label>
													<input class="form-control" type="text" name="memberEmail2" id="memberEmail2" readonly>
												</div>
												<div class="form-group col-md-4">
													<label class="control-label">선택</label>
													<select class="form-control" id="emailSelect">
														<option>-이메일 선택-</option>
														<option value="naver.com">naver.com</option>
														<option value="daum.net">daum.net</option>
														<option value="nate.com">nate.com</option>
													</select>
												</div>
											</div>
											<button type="button" id="submitBtn" class="btn btn-primary pull-right" >확인</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>