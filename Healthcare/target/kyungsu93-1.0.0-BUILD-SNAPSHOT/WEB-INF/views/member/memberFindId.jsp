<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		        		type:'POST'
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
	<h1>아이디 찾기</h1>
	<form action="${pageContext.request.contextPath}/memberFindId" name="memberFind" id="memberFind" method="POST">
		<input type="hidden" name="memberEmail" id="memberEmail">
		<input type="hidden" id="memberId" name="memberId">
		<div>이름:<input type="text" name="memberName" id="memberName"></div>
		<div>
			이메일:<input type="email" id="memberEmail1">@
				  <input type="text"  id="memberEmail2" readonly>
			<select id="emailSelect">
				<option>-이메일 선택-</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
			</select>
		</div>
	      <div><button type="button" id="submitBtn">확인</button></div>
      </form>
</body>
</html>