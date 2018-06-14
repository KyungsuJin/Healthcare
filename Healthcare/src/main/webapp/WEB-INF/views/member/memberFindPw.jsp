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
	<h1>비밀번호 찾기</h1>
	<form action="${pageContext.request.contextPath}/memberFindPw" name="memberFindPw" id="memberFindPw" method="POST">
		<input type="hidden" name="memberEmail" id="memberEmail">
		<input type="hidden" id="memberPw" name="memberPw">
		<div>아이디:<input type="text" name="memberId" id="memberId"></div>
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