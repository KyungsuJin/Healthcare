<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	<h1>회원정보 수정</h1>
	<form action="${pageContext.request.contextPath}/memberModify" method="post" id="modifyForm">
		<input type="hidden" name="memberTel" id="memberTel" value="${member.memberTel}">
		<input type="hidden" name="memberEmail" id="memberEmail" value="${member.memberEmail}">
		<input type="hidden" name="memberAddress" id="memberAddress" value="${member.memberAddress}">
		<input type="hidden" name="memberLevel" id="memberLevel" value="${sessionScope.memberLevel}">

		<div>
			아이디 :<input type="text" name="memberId" id="memberId" value="${sessionScope.memberId}" readonly>
		</div>
		<div>
			성명 :<input type="text" id="memberName" name="memberName" value="${member.memberName}">
		</div>
		<div>비밀번호:<input type="password" name="memberPw" id="memberPw" maxlength="16"></div>
      	<div>비밀번호 확인:<input type="password" name="pwCheck" id="pwCheck" maxlength="16"></div>
		<div>
			주소: <input type="text" name="postCode" id="postCode" placeholder="우편번호" readonly> 
				<input type="button" id="postCodeSearch" value="우편번호 찾기">
		</div>
		<div>
			<input type="text"  id="memberAddr1" placeholder="도로명주소" readonly> 
			<input type="text"  id="memberAddr2" placeholder="상세주소">
		</div>
		<div>
			EMAIL:<input type="email" id="memberEmail1">@
				  <input type="text"  id="memberEmail2" readonly>
			<select id="emailSelect">
				<option>-이메일 선택-</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
			</select>
		</div>

		<div>
			생년월일 :<input type="text" id="memberBirth" name="memberBirth" value="${member.memberBirth}">
		</div>
		<div>
			Tel :<select id="memberTel1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>- <input type="text" id="memberTel2" maxlength="4">-<input type="text" id="memberTel3" maxlength="4">
		</div>
		<div id="doctor">
			<div>의사면허번호 :<input type="text" name="doctorRegisterNo" id="memberRegister" value="${member.doctorRegisterNo}"></div>
			<div>소속병원명 :<input type="text" name="hospitalName" id="memberHospitalName" value="${member.hospitalName}"></div>
			<div>진료과목 :<input type="text" name="treatmentDepartment" id="memberDepartMent" value="${member.treatmentDepartment}"></div>
		</div>
		<div id="pt">
			<div>트레이너면허번호 :<input type="text" name="teacherRegisterNo" id="teacherRegister" value="${member.teacherRegisterNo}"></div>
			<div>현재 근무지 :<input type="text" name="memberWorkSpace" id="workSpace" value="${member.memberWorkSpace}"></div>
		</div>
		<div>
			<button type="button" id="modifySubmit">정보수정완료</button>
		</div>
	</form>
</body>
</html>