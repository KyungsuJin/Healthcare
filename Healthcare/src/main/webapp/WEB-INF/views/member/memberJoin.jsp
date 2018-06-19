<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
   $(document).ready(function(){
      var re = /[~!@\#$%^&*\()\-=+_']/gi;
      var number = /^[0-9]*$/;
      var blank =/[\s]/g;
      var email =/^([\w-]+(?:\.[\w-]+)*)/i;
      var emailEnd =/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
      
      $("#doctor").hide();
      $("#pt").hide();
      $("#pwch").hide();
      $("#cancellBtn").click(function(){
    	  window.location.href='${pageContext.request.contextPath}/';
      })
      $("#submitBtn").click(function(){
        var birth = $("#memberBirth").val();
        var yy =birth.substr(0,4);
        var mm =birth.substr(4,2);
        var dd =birth.substr(6,2);
        var level = $("input[name=joinSelect]:checked").val();
        
        if(level==1){
            $("#memberLevel").val(2);
         }else if(level==2){
            $("#memberLevel").val(3);
         }else{
            $("#memberLevel").val(4);
         }
	    
         if($("#memberId").val()==''){
            alert('아이디는 필수값 입니다');
            $("#memberId").focus();
            return false;
         }else if($("#memberPw").val()!=$("#pwCheck").val()){
            alert('비번이 불일치');
            $("#memberPw").focus();
            return false;
         }else if($("#memberName").val()=='' || blank.test($("#memberName").val())){
            alert('이름은 필수 입력값 입니다.');
            $("#memberName").focus();
            return false;
         }else if($("#memberIdChkConfirm").val()==0){
            alert('아이디 중복확인을 해주세요');
            return false;
         }else if(re.test($("#memberName").val()) || number.test($("#memberName").val())){
            alert('이름에는 특수문자,숫자는 들어갈수 없습니다.');
            $("#memberName").focus();
            return false;
         }else if($("#pwCheck").val().length < 4 || blank.test($("#pwCheck").val())){
            alert('비밀번호 입력 조건을 다시 한번 확인해주세요. 입력조건 ex)4자이상~16자이하');
            $("#memberPw").focus();
            return false;
         }else if($("input[name=memberGender]:checked").val()==null){
            alert('성별은 필수 선택값 입니다.');
            return false;
         }else if($("#memberAddr1").val()=='' || $("#memberAddr2").val()==''){
            alert('주소를 전부 입력해 주세요');
            $("#memberAddr2").focus();
            return false;
         }else if($("#memberEmail").val()=='' || !email.test($("#memberEmail").val())){
            alert('올바른 이메일을 입력해 주세요.');
            $("#memberEmail").focus();
            return false;
         }else if(!emailEnd.test($("#memberEmail2").val())){
            alert('이메일 을 골라주세요.');
            $("#emailSelect").focus();
            return false;
         }else if($("#memberBirth").val().length<8){
             alert('생년월일을 정확히 입력해 주세요.');
             $("#memberBirth").focus();
             return false;
         }else if($("#memberPhone2").val()=='' || $("#memberPhone3").val()==''){
            alert('휴대폰번호는 필수 입력 사항입니다.');
            $("#memberPhone2").focus();
            return false;
         }else if(!number.test($("#memberPhone2").val())){
            alert('올바른 휴대폰번호를 입력해 주세요.');
            $("#memberPhone2").focus();
            return false;
         }else if(!number.test($("#memberPhone3").val())){
            alert('올바른 휴대폰번호를 입력해 주세요.');
            $("#memberPhone3").focus();
            return false;
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberRegister").val()==''
                 || !number.test($("#memberRegister").val()))){
            alert('의사면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
            $("#memberRegister").focus();
            return false;
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberHospitalName").val()==''
                  || re.test($("#memberHospitalName").val())
                  || number.test($("#memberHospitalName").val())
                  || blank.test($("#memberDepartMent").val()))){
            alert('소속병원은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
            $("#memberHospitalName").focus();
            return false;
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberDepartMent").val()==''
                  || re.test($("#memberDepartMent").val())
                  || number.test($("#memberDepartMent").val())
                  || blank.test($("#memberDepartMent").val()))){
            alert('진료과목은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
            $("#memberDepartMent").focus();
            return false;
         }else if($("input[name=joinSelect]:checked").val()==2 && $(".multipartFile").val().length==0){
           alert('의사증거를 올려주세요.');
           return false;
         }else if($("input[name=joinSelect]:checked").val()==2
              && $("#inputMultipartFile").get(0).files[0].type.substring(0,5)!=="image"){
           alert('이미지 파일만 올릴수 있습니다.');
           return false;
         }else if($("input[name=joinSelect]:checked").val()==3
                 && ($("#teacherRegister").val()==''
                  || !number.test($("#teacherRegister").val()))){
           alert('트레이너면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
           $("#teacherRegister").focus();
           return false;
        }else if($("input[name=joinSelect]:checked").val()==3
                 && ($("#workSpace").val()==''
                     || re.test($("#workSpace").val())
                     || number.test($("#workSpace").val())
                     || blank.test($("#workSpace").val()))){
              alert('현재근무지는 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
              $("#workSpace").focus();
              return false;
        }else if($("input[name=joinSelect]:checked").val()==3 && $(".multipartFileTeacher").val().length==0){
            alert('트레이너증거 올려주세요.');
            return false;
        }else if($("input[name=joinSelect]:checked").val()==3
              && $(".multipartFileTeacher").get(0).files[0].type.substring(0,5)!=="image"){
            alert('이미지 파일만 올릴수 있습니다.');
            return false;
        }else if($("input:checkbox[name=memberAgree]").is(":checked")==false){
          alert('이용약관에 동의해 주세요.');
        }else if(yy < 1900|| yy > 2018
	               || mm < 01 || mm > 12
	               || dd < 01 || dd > 31){
	         alert('생년월일은 필수값이며 숫자만 입력 가능합니다. 생년월일 형식 ex)19930304');
	         $("#memberBirth").focus();
	         return false;
	     }else{
           $("#memberTel").val($("#memberPhone1").val()+$("#memberPhone2").val()+$("#memberPhone3").val());
           $("#memberEmail").val($("#memberEmail").val()+'@'+$("#memberEmail2").val());
           $("#memberAddress").val(+$("#postCode").val()+'&'+$("#memberAddr1").val()+'&'+$("#memberAddr2").val());
           console.log($("#memberTel").val());
             $("#homeForm").submit();
             alert('회원가입이 완료되었습니다.');
         }
      })
      
      $("#pwCheck").keyup(function(){
         if($("#memberPw").val()!=$("#pwCheck").val()){
            $("#pwch").show();
         }else{
            $("#pwch").hide();
         }
      })
      //중복체크 팝업
      $("#memberIdChk").click(function(){
         window.open("${pageContext.request.contextPath}/memberCheck"
               ,"checkForm","width=500, height=300,resizable=no,scrollbars=no");
      })
      $("input[name=joinSelect]").change(function(){
         if($("input[name=joinSelect]:checked").val()==2){
            $("#doctor").show();
            $("#pt").hide();
         }else if($("input[name=joinSelect]:checked").val()==3){
            $("#pt").show();
            $("#doctor").hide();
         }else{
            $("#pt").hide();
             $("#doctor").hide();
         }
      })
      //이메일 선택 바
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
               console.log(roadAddr);
               $("#postCode").val(data.zonecode);
               $("#memberAddr1").val(roadAddr);
            }
         }).open();
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
                                    <h4 class="title">회원가입</h4>
                                </div>
                                <div class="card-content">
                                 <form action="${pageContext.request.contextPath}/memberInsert" name="homeForm" id="homeForm" method="POST" enctype="multipart/form-data">
							      <input type="hidden" id="memberIdChkConfirm" value="0">
							      <input type="hidden"  name="memberTel" id="memberTel">
							      <input type="hidden" name="memberAddress" id="memberAddress">
							      <input type="hidden" name="memberLevel" id="memberLevel">
							      	<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
													 <label class="control-label"> 아이디</label>
													 <input class="form-control" type="text" name="memberId" id="memberId">
													  <button type="button" id="memberIdChk"  class="btn btn-primary pull-right">중복확인</button>
												</div>
												<div class="form-group">
													 <label class="control-label">비밀번호</label>
													 <input class="form-control" type="password" name="memberPw" id="memberPw" maxlength="16"><p id ="pwch">비밀번호불일치</p>
												</div>
												<div class="form-group">
													 <label class="control-label">비밀번호 확인</label>
													 <input class="form-control" type="password" name="pwCheck" id="pwCheck" maxlength="16">
												</div>
												<div class="form-group">
													 <label class="control-label">이름</label>
													 <input class="form-control" type="text" name="memberName" id="memberName">
												</div>
												<div class="form-group">
													 <label class="control-label"> 성별</label>
													 <input type="radio" name="memberGender"  value="남">남
													 <input type="radio" name="memberGender"  value="여">여
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
														 <input class="form-control" type="text" name="memberEmail" id="memberEmail">
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
													 <input class="form-control" type="text" name="memberBirth" id="memberBirth" maxlength="8">
												</div>
												<div class="row">
													<div class="form-group col-md-4">
														 <label class="control-label">앞자리</label>
														  <select class="form-control" id="memberPhone1">
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
														 <input class="form-control" type="text" name="memberPhone2" id="memberPhone2" maxlength="4">
													</div>
													<div class="form-group col-md-4">
														<label class="control-label">뒷자리</label>
														<input class="form-control" type="text" name="memberPhone3" id="memberPhone3" maxlength="4">
													</div>
												</div>
												<div class="row">
													<div class="form-group col-md-4">
														 <label class="control-label">일반회원</label>
														 <input class="form-control" type="radio" name="joinSelect" value="1" checked>
													</div>
													<div class="form-group col-md-4">
														 <label class="control-label">의사회원</label>
														 <input class="form-control" type="radio" name="joinSelect" value="2">
													</div>
													<div class="form-group col-md-4">
														<label class="control-label">PT회원</label>
														<input class="form-control" type="radio" name="joinSelect" value="3">
													</div>
												</div>
												<div id="doctor">
													<div class="row">
														<div class="form-group col-md-6">
															 <label class="control-label">의사면허번호</label>
															 <input class="form-control" type="text" name="doctorRegisterNo" id="memberRegister">
														</div>
														<div class="form-group col-md-6">
															 <label class="control-label">진료과목</label>
															 <input class="form-control" type="text" name="treatmentDepartment" id="memberDepartMent">
														</div>
													</div>
													<div class="row">
														<div class="form-group col-md-12">
															 <label class="control-label">소속병원명</label>
															 <input class="form-control" type="text" name="hospitalName" id="memberHospitalName">
														</div>
													</div>
													<div class="row">				
															 <label class="control-label">의사 증명서</label>
															 <input type="file" name="multipartFile" class="multipartFile" id="inputMultipartFile">
													</div>
												</div>
												
												<div id="pt">
													<div class="row">
														<div class="form-group col-md-6">
															 <label class="control-label">트레이너면허번호</label>
															 <input class="form-control" type="text" name="teacherRegisterNo" id="teacherRegister">
														</div>
														<div class="form-group col-md-6">
															 <label class="control-label">현재 근무지 </label>
															 <input class="form-control" type="text" name="memberWorkSpace" id="workSpace">
														</div>
													</div>
													<div class="row">
															 <label>트레이너 증명서</label>
															 <input  type="file" name="teacherMultipartFile" class="multipartFileTeacher" id="inputMultipartFile">
													</div>
												</div>
												<div class="checkbox">
													<label>이용약관 동의</label>&nbsp
													<label><input type="checkbox" name="memberAgree" value="T"></label>
												</div>
												<button type="button" id="submitBtn" class="btn btn-primary pull-right">회원가입</button>
												<button type="button" id="cancellBtn" class="btn btn-primary pull-right">회원가입 취소</button>
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