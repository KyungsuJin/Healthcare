<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedResponse</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var count = 1;	
	var exerciseId = 1;
	var foodId = 1;
	$(document).ready(function(){
		
		$('#foodFeedback').hide();
		$('#exerciseFeedback').hide();
		$('#searchResult').hide();
		$('#submitBtn').hide();
	});
	//음식 피드백 검색
	function foodFeedbackBtn(){
		$('#foodFeedback').show();
	}
	function checkFoodInfo(){		
		var foodName = $('#foodName').val();
		var foodGroup = $('#foodGroup option:selected').val();
		console.log("foodGroup:"+foodGroup);
		console.log("foodName:"+foodName);
       var checkFoodAjax = $.ajax({
            type : "GET",
            data : {foodGroup : foodGroup, foodName : foodName},
            url : "${pageContext.request.contextPath}/feedbackFoodSearch",
            dataType : "json",
            contentType: "application/json; charset=UTF-8"
        });    
       
		checkFoodAjax.done(function(data){
			console.log(data);   
			if(data.result > 0){
				$('#searchResult').show();
	       		$('#foodSearchResult').html(data.result+'개의 음식을 찾았습니다.');
	       		for (var i=0; i<data.foodInfo.length; i++){
	       			var foodName = data.foodInfo[i].foodName;
	       			var Kcal = data.foodInfo[i].foodKcal;
	       			var foodNo = data.foodInfo[i].foodNo;
	       			$('#FoodInfo').append('<option value="'+foodNo+'">'+ foodName +'('+ Kcal +'kcal/100g)</option>');
	       		}
		     }else if(data.result == 0){
		       		$('#foodSearchResult').html('음식을 찾지못했습니다. 다시 입력해주세요.');
		     }
		}); 
		checkFoodAjax.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
   	}
	//음식 피드백
	function foodInfoAddBtn() {
		var foodNoSelect = $("#FoodInfo option:selected").val();
		var foodNameSelect = $("#FoodInfo option:selected").text();
		
		var count = $("input[name=foodNo]").length;
		console.log("현재개수:"+count);
		if(foodNameSelect == '음식을 선택해주세요'){
			alert('하단의 음식을 선택해주세요');
			return false;
		}else if(count==3){
			alert('음식 피드백은 총 3개까지만 가능합니다.');
			return false;
		}else{
		console.log("fieldid현재개수:"+fieldid);
		document.getElementById('foodInfoPanel').append(foodNameSelect+'가 선택되었습니다.');		
		var input1 = document.createElement("input");
		input1.setAttribute("type","hidden");
		input1.setAttribute("name","foodNo");
		input1.setAttribute('lastId', foodId);
		input1.setAttribute("value", foodNoSelect);
		document.getElementById('foodSelect').appendChild(input1);
		var br3 = document.createElement("br");
		document.getElementById('foodSelect').appendChild(br3);	
		
		var input2 = document.createElement("input");
		input2.setAttribute("type","text");
		input2.setAttribute("name","ingestionAmount");
		input2.setAttribute('lastId', fieldid);
		input2.setAttribute("placeholder","섭취량");
		document.getElementById('foodSelect').appendChild(input2);	
		}
		foodId++;
		console.log("클릭한횟수:"+foodId);
	}
	//운동피드백 
	function exerciseFeedbackBtn(){
		$('#exerciseFeedback').show();
		
       var checkAjax = $.ajax({
            type : "GET",
            url : "${pageContext.request.contextPath}/exerciseSearch",
            dataType : "json",
            contentType: "application/json; charset=UTF-8"
        });    
       
       checkAjax.done(function(msg){
			console.log(msg);   
 	       	for (var i=0; i<msg.exerciseSearch.length; i++){
	       		var exerciseName = msg.exerciseSearch[i].exerciseName;
	       		var Kcal = msg.exerciseSearch[i].exerciseCalorie;
	       		var exerciseNum = msg.exerciseSearch[i].exerciseNo;
	       		$('#exercise').append('<option value="'+exerciseNum+'">'+ exerciseName +'('+ Kcal +'kcal/min)</option>');
	       	} 
		}); 
       checkAjax.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
   	}

	function exerciseAddBtn() {

		var exerciseNoSelect = $("#exercise option:selected").val();
		var exerciseNameSelect = $("#exercise option:selected").text();
		var count = $("input[name=exerciseNo]").length;
		console.log("현재개수:"+count);
		if(exerciseSelect == '운동을 선택해주세요'){
			alert('하단의 운동을 선택해주세요');
			return false;
		}else if(count==3){
			alert('음식 피드백은 총 3개까지만 가능합니다.');
			return false;
		}else{
		console.log("exerciseId현재개수:"+exerciseId);
		document.getElementById('exerciseSelect').append(exerciseNameSelect+'가 선택되었습니다.');	
		
		var input1 = document.createElement("input");
		input1.setAttribute("type","text");
		input1.setAttribute("name","exerciseNo");
		input1.setAttribute("id",exerciseId);
		input1.setAttribute("value",exerciseNoSelect);
		document.getElementById('exerciseSelect').appendChild(input1);	
		
		var input2 = document.createElement("input");
		input2.setAttribute("type","button");
		input2.setAttribute("onclick","deleteBtn(this)");
		input2.setAttribute("id",exerciseId);
		input2.setAttribute("value","삭제");
		document.getElementById('exerciseSelect').appendChild(input2);	
			
		exerciseId++;
		}
		console.log("클릭한횟수:"+exerciseId);
	}
	
	function cancleBtn() {
	    location.href="${pageContext.request.contextPath}/exerciseFeedbackRequestList";
	} 	
	
    //삭제
    function deleteBtn(thisid) {
    	var parentNode = document.getElementById('exerciseSelect');
    	var idSelect = document.getElementById(thisid.getAttribute('id')).getAttribute('id');
    	console.log("idSelect:"+idSelect);
     	var count = $('input[id='+idSelect+']').length;
    	for(var i =0; i<count; i++){
    		parentNode.removeChild(document.getElementById(idSelect)); 
    		console.log('삭제완료');
    	} 
    }
	
</script>
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
			<h1>exerciseFeedResponse</h1>
				<form id="exercisefeedbackForm" onsubmit="return check()" action="${pageContext.request.contextPath}/exerciseFeedbackRequestResult" method="post">
					<div>
						<input type="text" name="memberName" value="${memberName }">
				<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
						<input type="text" name="memberNo">
					</div>
					<div>
						제목 :
						<input type="text"  id="exerciseFeedbackTitle" name="exerciseFeedbackTitle">
					</div>
					<input type="button" onclick="foodFeedbackBtn()" value="음식피드백 등록하기">
					<div id="foodFeedback">
						<div>
							음식을 검색해주세요. 총 3개까지만 선택이 가능합니다.<br>
							음식 카테고리 선택:
							<select name="foodGroup" id="foodGroup">
							  <option value="감자 및 전분류" selected="selected">감자 및 전분류</option>
							  <option value="견과류">견과류</option>
							  <option value="곡류 및 그 제품">곡류 및 그 제품</option>
							  <option value="당류 및 그 제품">당류 및 그 제품</option>
							  <option value="두류 및 그 제품">두류 및 그 제품</option>
							  <option value="채소류">채소류</option>
							</select>
							<input type="text" name="foodName" id="foodName">
							<input type="button" value="음식 검색하기" onclick="checkFoodInfo()">
							<div id="searchResult">
								<span id="foodSearchResult"></span><br>
								<select name="FoodInfo" id="FoodInfo">
									<option value="음식을 선택해주세요" selected="selected">음식을 선택해주세요</option>
								</select>
								<input type="button" onclick="foodInfoAddBtn()" value="음식추가하기">
							</div>
						</div>
						<!-- 음식 피드백 시작 -->
						<div id="foodInfoPanel">
							<div id="foodSelect"></div>
						</div>
					</div>
					<!-- 운동피드백 -->
					<input type="button" onclick="exerciseFeedbackBtn()" value="운동피드백 등록하기">
					<div id="exerciseFeedback">
						<div><br>
							운동을 선택해주세요. 총 3개까지만 선택이 가능합니다.<br>
							운동 선택:
							<select name="exercise" id="exercise">
								<option value="운동을 선택해주세요" selected="selected">운동을 선택해주세요</option>
							</select>
							<input type="button" onclick="exerciseAddBtn()" value="운동 추가하기">
						</div>
						<!-- 운동 피드백 시작 -->
						<div id="exerciseInfoPanel">
							<span id="exerciseResult"></span>
							<div id="exerciseSelect"></div>
						</div>
					</div>
					<div>
						내용:
						<textarea name="exerciseFeedbackContent" style="resize: none;" cols="40" rows="8" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<input id="submitBtn" type="submit" value="등록하기">
				</form>
				<input type="button" onclick="cancleBtn()" value="요청리스트로 돌아가기">
			</div>
		</div>
	</div>
</body>
</html>