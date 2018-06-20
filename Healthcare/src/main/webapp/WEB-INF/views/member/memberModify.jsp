<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			var re = /[~!@\#$%^&*\()\-=+_']/gi;
		    var number = /^[0-9]*$/;
		    var blank =/[\s]/g;
		    var emailtest =/^([\w-]+(?:\.[\w-]+)*)/i;
		    var emailEnd =/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			var tel =$("#memberTel").val();
			var email =$("#memberEmail").val().split('@');
			var address=$("#memberAddress").val().split('&');
			var birth = $("#memberBirth").val();
	        var yy =birth.substr(0,4);
	        var mm =birth.substr(4,2);
	        var dd =birth.substr(6,2);
	        
			$("#postCode").val(address[0]);
			$("#memberAddr1").val(address[1]);
			$("#memberAddr2").val(address[2]);
			$("#memberEmail1").val(email[0]);
			$("#memberEmail2").val(email[1]);
			$("#memberTel1").val(tel.substr(0,3));
			$("#memberTel2").val(tel.substr(3,4));
			$("#memberTel3").val(tel.substr(7,4));
			
			if($("#memberLevel").val()==1 || $("#memberLevel").val()==2){
				$("#doctor").hide();
				$("#pt").hide();
			}
			if($("#memberLevel").val()==3){
				$("#doctor").show();
				$("#pt").hide();
			}
			if($("#memberLevel").val()==4){
				$("#pt").show();
				$("#doctor").hide();
			}
			$("#emailSelect").change(function(){
		         $("#memberEmail2").val($(this).val());
		    })
			//우편번호 찾기
			$("#postCodeSearch").click(function(){
				new daum.Postcode({
					oncomplete: function(data) {
						var roadAddr = '';
						var testRoadAddr ='';
						if(data.userSelectedType =='R'){
							roadAddr=data.roadAddress;
						}else{
							roadAddr=data.jibunAddress;
						}
						if(data.bname != '' && /[동|로|가]$/g.test(data.bname)){
							testRoadAddr += data.bname;
						}
						if(data.buildingName != '' && data.apartment == 'Y'){
							testRoadAddr += (testRoadAddr != '' ? ', ' + data.buildingName : data.buildingName);
						}
						if(testRoadAddr != ''){
							testRoadAddr = ' (' + testRoadAddr + ')';
						}
						if(roadAddr != ''){
							roadAddr += testRoadAddr;
						}
						$("#postCode").val(data.zonecode);
						$("#memberAddr1").val(roadAddr);
					}
				}).open();
			})
			$("#modifySubmit").click(function(){
				if(yy < 1900|| yy > 2018
		                 || mm < 01 || mm > 12
		                 || dd < 01 || dd > 31){
		            alert('생년월일은 필수값이며 숫자만 입력 가능합니다. 생년월일 형식 ex)19930304');
		            $("#memberBirth").focus();
		            return false;
		        }
				if($("#memberName").val()=='' || blank.test($("#memberName").val())){
					alert('이름은 필수 입력값 입니다.');
					$("#memberName").focus();
					return false;
				}else if(re.test($("#memberName").val()) || number.test($("#memberName").val())){
		            alert('이름에는 특수문자,숫자는 들어갈수 없습니다.');
		            $("#memberName").focus();
		            return false;
		        }else if($("#pwCheck").val().length < 4 || blank.test($("#pwCheck").val())){
		            alert('비밀번호 입력 조건을 다시 한번 확인해주세요. 입력조건 ex)4자이상~16자이하');
		            return false;
		        }else if($("#memberPw").val()!=$("#pwCheck").val()){
		            alert('비번이 불일치');
		            $("#memberPw").focus();
		            return false;
		        }else if($("#memberAddr1").val()=='' || $("#memberAddr2").val()==''){
		            alert('주소를 전부 입력해 주세요');
		            $("#memberAddr2").focus();   
		            return false;
		        }else if($("#memberEmail1").val()=='' || !emailtest.test($("#memberEmail1").val())){
		            alert('올바른 이메일을 입력해 주세요.');
		            $("#memberEmail").focus();
		            return false;
		        }else if($("#memberBirth").val().length<8){
		            alert('생년월일을 정확히 입력해 주세요.');
		            $("#memberBirth").focus();
		            return false;
		        }else if($("#memberTel2").val()=='' || $("#memberTel3").val()==''){
		            alert('휴대폰번호는 필수 입력 사항입니다.');
		            return false;
		        }else if(!number.test($("#memberTel2").val())){
		            alert('올바른 휴대폰번호를 입력해 주세요.');
		            $("#memberTel2").focus();
		            return false;
		        }else if(!number.test($("#memberTel3").val())){
		            alert('올바른 휴대폰번호를 입력해 주세요.');
		            $("#memberTel3").focus();
		            return false;
		        }else if($("#memberLevel").val()==3
		                  && ($("#memberRegister").val()==''
		                 || !number.test($("#memberRegister").val()))){
		            alert('의사면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
		            $("#memberRegister").focus();
		            return false;
		        }else if($("#memberLevel").val()==3
		                  && ($("#memberHospitalName").val()==''
		                  || re.test($("#memberHospitalName").val())
		                  || number.test($("#memberHospitalName").val())
		                  || blank.test($("#memberDepartMent").val()))){
		            alert('소속병원은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
		            $("#memberHospitalName").focus();
		            return false;
		        }else if($("#memberLevel").val()==3
		                  && ($("#memberDepartMent").val()==''
		                  || re.test($("#memberDepartMent").val())
		                  || number.test($("#memberDepartMent").val())
		                  || blank.test($("#memberDepartMent").val()))){
		            alert('진료과목은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
		            $("#memberDepartMent").focus();
		            return false;
		        }else if($("#memberLevel").val()==4
		                 && ($("#teacherRegister").val()==''
		                  || !number.test($("#teacherRegister").val()))){
		           alert('트레이너면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
		           $("#teacherRegister").focus();
		           return false;
		        }else if($("#memberLevel").val()==4
		                 && ($("#workSpace").val()==''
		                     || re.test($("#workSpace").val())
		                     || number.test($("#workSpace").val())
		                     || blank.test($("#workSpace").val()))){
		              alert('현재근무지는 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
		              $("#workSpace").focus();
		              return false;
		        }else{
		        	$("#memberTel").val($("#memberTel1").val()+$("#memberTel2").val()+$("#memberTel3").val());
		            $("#memberEmail").val($("#memberEmail1").val()+'@'+$("#memberEmail2").val());
		            $("#memberAddress").val($("#postCode").val()+'&'+$("#memberAddr1").val()+'&'+$("#memberAddr2").val());
		            console.log($("#memberAddress").val());
		            $("#modifyForm").submit();
		            alert('회원정보 수정 완료!');
		        }
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
                                    <h4 class="title">회원정보 수정</h4>
                                </div>
                                <div class="card-content">
									<form action="${pageContext.request.contextPath}/memberModify" method="post" id="modifyForm">
										<input type="hidden" name="memberTel" id="memberTel" value="${member.memberTel}">
										<input type="hidden" name="memberEmail" id="memberEmail" value="${member.memberEmail}">
										<input type="hidden" name="memberAddress" id="memberAddress" value="${member.memberAddress}">
										<input type="hidden" name="memberLevel" id="memberLevel" value="${sessionScope.memberSessionLevel}">
										<div class="row">
											<div class="col-md-2"></div>
											<div class="col-md-8">
												<div class="form-group">
													<label class="control-label">아이디</label>
													<input class="form-control" type="text" name="memberId" id="memberId" value="${sessionScope.memberSessionId}" readonly>
												</div>
												<div class="form-group">
													<label class="control-label">이름</label>
													<input class="form-control" type="text" id="memberName" name="memberName" value="${member.memberName}">
												</div>
												<div class="form-group">
													<label class="control-label">비밀번호</label>
													<input class="form-control" type="password" name="memberPw" id="memberPw" maxlength="16">
												</div>
												<div class="form-group">
													<label class="control-label">비밀번호 확인</label>
													<input class="form-control" type="password" name="pwCheck" id="pwCheck" maxlength="16">
												</div>
												<div class="form-group">
													 <label class="control-label">주소</label>
													 <input class="form-control" type="text" name="postCode" id="postCode" readonly>
												</div>
												<input type="button" id="postCodeSearch"  class="btn btn-primary pull-right" value="우편번호 찾기">
												<div class="form-group">
													 <label class="control-label">도로명 주소</label>
													 <input class="form-control" type="text" name="memberAddr1" id="memberAddr1"  readonly>
												</div>
												<div class="form-group">
													 <label class="control-label">상세 주소</label>
													 <input class="form-control" type="text" name="memberAddr2" id="memberAddr2">
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
												<div class="form-group">
													 <label class="control-label">생년월일</label>
													 <input class="form-control" type="text" id="memberBirth" name="memberBirth" value="${member.memberBirth}">
												</div>
												<div class="row">
													<div class="form-group col-md-4">
														 <label class="control-label">앞자리</label>
														  <select class="form-control" id="memberTel1">
												            <option value="010" selected=selected>010</option>
												            <option value="011">011</option>
												            <option value="016">016</option>
												            <option value="017">017</option>
												            <option value="018">018</option>
												            <option value="019">019</option>
												         </select>
													</div>
													<div class="form-group col-md-4">
														 <label class="control-label">중간자리</label>
														 <input class="form-control" type="text"  id="memberTel2" maxlength="4">
													</div>
													<div class="form-group col-md-4">
														<label class="control-label">뒷자리</label>
														<input class="form-control" type="text"  id="memberTel3" maxlength="4">
													</div>
												</div>
												<div id="doctor">
													<div class="row">
														<div class="form-group col-md-6">
															 <label class="control-label">의사면허번호</label>
															 <input class="form-control" type="text" name="doctorRegisterNo" id="memberRegister" value="${member.doctorRegisterNo}">
														</div>
														<div class="form-group col-md-6">
															 <label class="control-label">진료과목</label>
															 <input class="form-control" type="text" name="treatmentDepartment" id="memberDepartMent" value="${member.treatmentDepartment}">
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-12">
															 <label class="control-label">소속병원명</label>
															 <input class="form-control" type="text" name="hospitalName" id="memberHospitalName" value="${member.hospitalName}">
														</div>
													</div>
												</div>
												<div id="pt">
													<div class="row">
														<div class="form-group col-md-6">
															 <label class="control-label">트레이너면허번호</label>
															 <input type="text" name="teacherRegisterNo" id="teacherRegister" value="${member.teacherRegisterNo}">
														</div>
														<div class="form-group col-md-6">
															 <label class="control-label">현재 근무지 </label>
															 <input type="text" name="memberWorkSpace" id="workSpace" value="${member.memberWorkSpace}">
														</div>
													</div>
												</div>
												<button type="button" id="modifySubmit" class="btn btn-primary pull-right">정보수정완료</button>	
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