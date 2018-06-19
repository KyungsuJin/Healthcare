<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		var re = /[~!@\#$%^&*\()\-=+_']/gi;	
		var email =/^([\w-]+(?:\.[\w-]+)*)/i;
	    var emailEnd =/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    var blank =/[\s]/g;
	    var number = /^[0-9]*$/;
	    $(document).ready(function(){
			$("#memberFindPw").keypress(function(e){
				if(e.which==13){
					$("#submitBtn").click();
				}
			})
			$("#submitBtn").click(function(){
				if($("#memberId").val()==''){
		            alert('아이디는 필수값 입니다');
		            $("#memberId").focus();
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
		        		,url : "${pageContext.request.contextPath}/memberFindPw"
		        		,data : {"memberId" : $("#memberId").val()
								,"memberEmail":$("#memberEmail").val()}
		        		,dataType:"json",
		        		success:function(data){
		        			if(data.memberPw=="0"){
		        				alert('해당정보에 일치하는 비밀번호 가 없습니다.');
		        			}else{
		        				$("#memberPw").val(data.memberPw);
		        				window.open("${pageContext.request.contextPath}/memberFindPwResult?memberId"
		        							,"memberFindPw","width=500, height=300,resizable=no,scrollbars=no")
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
								<h4 class="title">비밀번호 찾기</h4>
							</div>
							<div class="card-content">
								<form action="${pageContext.request.contextPath}/memberFindPw" name="memberFindPw" id="memberFindPw" method="POST">
									<input type="hidden" name="memberEmail" id="memberEmail">
									<input type="hidden" id="memberPw" name="memberPw">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">아이디</label>
												<input class="form-control" type="text" name="memberId" id="memberId">
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
											<button type="button" id="submitBtn" class="btn btn-primary pull-right">확인</button>
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