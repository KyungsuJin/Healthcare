<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<script>
   $(document).ready(function(){
      $("#memberIdCheck").val(window.opener.document.homeForm.memberId.value);
      var flag=0;
      $("#DuplicateCheckId").click(function(){
         var re = /[~!@\#$%^&*\()\-=+_']/gi;
         var kr =/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
         $("#memberUserIdCheck").val($("#memberIdCheck").val());
         if($("#memberIdCheck").val().length < 4 && 16 > $("#memberIdCheck").val().length){
            alert('아이디는 영문(소문자),숫자로 4자~16자 이내로 입력해 주세요');
         }else if(re.test($("#memberIdCheck").val()) || kr.test($("#memberIdCheck").val())){
            alert('특수문자 또는 한글은 아이디에 포함 할 수 없습니다.');
         }else{
            $.ajax({
                  type : "POST",
                  url : "${pageContext.request.contextPath}/memberIdCheck",
                  data : {"id":$("#memberIdCheck").val()},
                  dataType : "json",
                  success : function(data){
                     flag=data;
                     if(data==1){
                        alert('사용 불가능한아이디');
                     }else{
                        alert('사용가능한 아이디');
                     }
                  }
               })
         }
      })
      /* 아이디 사용하기를 눌러서 인증을 받아놓고 다시 text창의 값을 바꿀수있기때문에 그값을 비교해준다. */
      $("#useId").click(function(){
         if(flag==0 && $("#memberUserIdCheck").val()==$("#memberIdCheck").val()){
            window.opener.document.homeForm.memberId.value=$("#memberIdCheck").val();
            $(opener.document).find("#memberId").attr("readonly",true);
            window.opener.document.homeForm.memberIdChkConfirm.value=1;
            window.close();
            
         }else{
            alert('아이디 중복확인을 해주세요');
         }
      })
   })
</script>
</head>
<body>
	 <div class="card">
		 <div class="card-header" data-background-color="purple">
		 	<h4 class="title">아이디 중복체크</h4>
		 </div>
		 <div class="card-content">
			 <div class="row">
				 <div class="col-md-2"></div>
				 <div class="col-md-8">
				 	<div class="form-group">
					 	<label class="control-label">아이디 중복 체크</label>
					 	<input class="form-control" type="text" id="memberIdCheck" maxlength="16">
					 	<input type="hidden" id="memberUserIdCheck">
				 	</div>
				 	 <button type="button" id="DuplicateCheckId" class="btn btn-primary pull-right">중복체크</button>
     				 <button type="button" id="useId" class="btn btn-primary pull-right">사용하기</button>
			 	</div>
		 	</div>
		 </div>
	</div>
</body>
</html>