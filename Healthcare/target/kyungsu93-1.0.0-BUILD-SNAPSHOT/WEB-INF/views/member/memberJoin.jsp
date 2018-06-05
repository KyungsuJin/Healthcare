<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      var re = /[~!@\#$%^&*\()\-=+_']/gi;
      var number = /^[0-9]*$/;
      var blank =/[\s]/g;
      var email =/^([\w-]+(?:\.[\w-]+)*)/i;
      var emailEnd =/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
      
      $("#doctor").hide();
      $("#pt").hide();
      $("p").hide();
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
	     if(yy < 1900|| yy > 2018
	               || mm < 01 || mm > 12
	               || dd < 01 || dd > 31){
	         alert('생년월일은 필수값이며 숫자만 입력 가능합니다. 생년월일 형식 ex)19930304');
	         $("#memberBirth").focus();
	     }
         if($("#memberId").val()==''){
            alert('아이디는 필수값 입니다');
            $("#memberId").focus();
         }else if($("#memberPw").val()!=$("#pwCheck").val()){
            alert('비번이 불일치');
            $("#memberPw").focus();
         }else if($("#memberName").val()=='' || blank.test($("#memberName").val())){
            alert('이름은 필수 입력값 입니다.');
            $("#memberName").focus();
         }else if($("#memberIdChkConfirm").val()==0){
            alert('아이디 중복확인을 해주세요');
         }else if(re.test($("#memberName").val()) || number.test($("#memberName").val())){
            alert('이름에는 특수문자,숫자는 들어갈수 없습니다.');
            $("#memberName").focus();
         }else if($("#pwCheck").val().length < 4 || blank.test($("#pwCheck").val())){
            alert('비밀번호 입력 조건을 다시 한번 확인해주세요. 입력조건 ex)4자이상~16자이하');
         }else if($("input[name=memberGender]:checked").val()==null){
            alert('성별은 필수 선택값 입니다.');
         }else if($("#memberAddr1").val()=='' || $("#memberAddr2").val()==''){
            alert('주소를 전부 입력해 주세요');
            $("#memberAddr2").focus();   
         }else if($("#memberEmail").val()=='' || !email.test($("#memberEmail").val())){
            alert('올바른 이메일을 입력해 주세요.');
            $("#memberEmail").focus();
         }else if(!emailEnd.test($("#memberEmail2").val())){
            alert('이메일 을 골라주세요.');
            $("#emailSelect").focus();
         }else if($("#memberBirth").val().length<8){
             alert('생년월일을 정확히 입력해 주세요.');
             $("#memberBirth").focus();
         }else if($("#memberPhone2").val()=='' || $("#memberPhone3").val()==''){
            alert('휴대폰번호는 필수 입력 사항입니다.');
         }else if(!number.test($("#memberPhone2").val())){
            alert('올바른 휴대폰번호를 입력해 주세요.');
            $("#memberPhone2").focus();
         }else if(!number.test($("#memberPhone3").val())){
            alert('올바른 휴대폰번호를 입력해 주세요.');
            $("#memberPhone3").focus();
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberRegister").val()==''
                 || !number.test($("#memberRegister").val()))){
            alert('의사면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
            $("#memberRegister").focus();
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberHospitalName").val()==''
                  || re.test($("#memberHospitalName").val())
                  || number.test($("#memberHospitalName").val())
                  || blank.test($("#memberDepartMent").val()))){
            alert('소속병원은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
            $("#memberHospitalName").focus();
         }else if($("input[name=joinSelect]:checked").val()==2
                  && ($("#memberDepartMent").val()==''
                  || re.test($("#memberDepartMent").val())
                  || number.test($("#memberDepartMent").val())
                  || blank.test($("#memberDepartMent").val()))){
            alert('진료과목은 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
            $("#memberDepartMent").focus();
         }else if($("input[name=joinSelect]:checked").val()==2 && $(".multipartFile").val().length==0){
           alert('의사증거를 올려주세요.');
         }else if($("input[name=joinSelect]:checked").val()==2
              && $("#inputMultipartFile").get(0).files[0].type.substring(0,5)!=="image"){
           alert('이미지 파일만 올릴수 있습니다.');
         }else if($("input[name=joinSelect]:checked").val()==3
                 && ($("#teacherRegister").val()==''
                  || !number.test($("#teacherRegister").val()))){
           alert('트레이너면허번호는 필수항목입니다. 숫자만 입력가능합니다.');
           $("#teacherRegister").focus();
        }else if($("input[name=joinSelect]:checked").val()==3
                 && ($("#workSpace").val()==''
                     || re.test($("#workSpace").val())
                     || number.test($("#workSpace").val())
                     || blank.test($("#workSpace").val()))){
              alert('현재근무지는 필수항목입니다. 공백,특수문자,숫자는 입력이 불가능합니다.');
              $("#workSpace").focus();
        }else if($("input[name=joinSelect]:checked").val()==3 && $(".multipartFileTeacher").val().length==0){
            alert('트레이너증거 올려주세요.');
        }else if($("input[name=joinSelect]:checked").val()==3
              && $(".multipartFileTeacher").get(0).files[0].type.substring(0,5)!=="image"){
            alert('이미지 파일만 올릴수 있습니다.');
        }else if($("input:checkbox[name=memberAgree]").is(":checked")==false){
          alert('이용약관에 동의해 주세요.');
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
   <form action="${pageContext.request.contextPath}/memberInsert" name="homeForm" id="homeForm" method="POST" enctype="multipart/form-data">
      <input type="hidden" id="memberIdChkConfirm" value="0">
      <input type="hidden"  name="memberTel" id="memberTel">
      <input type="hidden" name="memberAddress" id="memberAddress">
      <input type="hidden" name="memberLevel" id="memberLevel">
      <div>
         아이디:<input type="text" name="memberId" id="memberId">
            <button type="button" id="memberIdChk">중복확인</button>
      </div>
      <div>비번 :<input type="password" name="memberPw" id="memberPw" maxlength="16"></div><p id ="pwch">비밀번호불</p>
      <div>비번확인 :<input type="password" name="pwCheck" id="pwCheck" maxlength="16"></div>
      <div>이름:<input type="text" name="memberName" id="memberName"></div>
      <div>
         성별 :<input type="radio" name="memberGender"  value="남">남
         <input type="radio" name="memberGender"  value="여">여
      </div>
      <div>
         주소:<input type="text" name="postCode" id="postCode" placeholder="우편번호" readonly>
         <input type="button" id="postCodeSearch" value="우편번호 찾기">
      </div>
      <div>
         <input type="text" name="memberAddr1" id="memberAddr1" placeholder="도로명주소" readonly>
         <input type="text" name="memberAddr2" id="memberAddr2" placeholder="상세주소">
      </div>
      <div>이메일 :<input type="email" name="memberEmail" id="memberEmail">@
         <input type="text" name="memberEmail2" id="memberEmail2" readonly>
         <select id="emailSelect">
            <option>-이메일 선택-</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="nate.com">nate.com</option>
         </select>
      </div>
      <div>생년월일:<input type="text" name="memberBirth" id="memberBirth" maxlength="8"></div>
      <div>휴대전화
         <select id="memberPhone1">
            <option value="010" selected=selected>010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
         </select>-
         <input type="text" name="memberPhone2" id="memberPhone2" maxlength="4">-
         <input type="text" name="memberPhone3" id="memberPhone3" maxlength="4">
      </div>
         <input type="radio" name="joinSelect" value="1" checked>일반회원
         <input type="radio" name="joinSelect" value="2">의사회원
         <input type="radio" name="joinSelect" value="3">피티회원
      <div id="doctor">
         <div>의사면허번호 :<input type="text" name="doctorRegisterNo" id="memberRegister"></div>
         <div>소속병원명 :<input type="text" name="hospitalName" id="memberHospitalName"></div>
         <div>진료과목 :<input type="text" name="treatmentDepartment" id="memberDepartMent"></div>
         <div>의사 증거 :<input  type="file" name="multipartFile" class="multipartFile" id="inputMultipartFile"></div>
      </div>
      <div id="pt">
         <div>트레이너면허번호 :<input type="text" name="teacherRegisterNo" id="teacherRegister"></div>
         <div>현재 근무지 :<input type="text" name="memberWorkSpace" id="workSpace"></div>
         <div>트레이너 증거 :<input  type="file" name="teacherMultipartFile" class="multipartFileTeacher" id="inputMultipartFile"></div>
      </div>
      <div>이용약관동의 <input type="checkbox" name="memberAgree" value="T">동의함</div>
      <div><button type="button" id="submitBtn">회원가입</button></div>
      <div><button type="button" id="cancellBtn">회원가입 취소</button></div>
   </form>
</body>
</html>