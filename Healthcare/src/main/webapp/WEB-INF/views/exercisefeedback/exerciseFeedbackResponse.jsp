<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exerciseFeedResponse</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#foodFeedbackBtn').hide();
		$('#foodInfoadd').hide();
		$('#searchResult').hide();
		$('.foodFeedback').click(function(){
			$('#foodFeedbackBtn').show();
		});

	});
	function checkFoodInfo(){		
		var foodName = $('#foodName').val();
		var foodGroup = $('#foodGroup').val();
		if(foodName == "" || foodName == null){
			$('#foodName').html('공백 또는 특수문자가 포함된 아이디는 검색할 수 없습니다.');
			exercisefeedbackForm.foodName.focus();
			return false;
		}
       var checkFoodAjax = $.ajax({
            type : "GET",
            data : {foodName : foodName, foodGroup : foodGroup},
            url : "${pageContext.request.contextPath}/feedbackFoodSearch",
            dataType : "json",
            contentType: "application/json; charset=UTF-8"
        });    
       
		checkFoodAjax.done(function(data){
			console.log(data);   
			if(data.result> 0){
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
		checkIdAjax.fail(function(jqXHR, textStatus){
			alert( "Request failed: " + textStatus );
		});
   	}
	function foodInfoAddBtn() {
		$('#foodInfoadd').show();
   		 var foodNoSelect = $("#FoodInfo option:selected").val();
   		 var foodNameSelect = $("#FoodInfo option:selected").text();
		document.getElementById("foodNo").value = foodNoSelect;
		$('#result').html('음식'+foodNameSelect +'이 선택되었습니다.');
	}
	
</script>
</head>
<body>
<h1>운동 피드백</h1>
	<form id="exercisefeedbackForm" onsubmit="return check()" action="${pageContext.request.contextPath}/exerciseFeedbackRequestResult" method="post">
		<div>
			<input type="hidden" name="memberNo" value="${exerciseFeedback.memberNo }">
	<%-- <input type="hidden" name="memberNo" value="${sessionScope.memberNo}"> --%>
		</div>
		<div>
			제목 :
			<input type="text" name="exerciseFeedbackTitle">
		</div>

		<div>
			내용:
			<textarea name="exerciseFeedbackContent" style="resize: none;" cols="40" rows="8" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<input type="button" id="foodFeedbackBtn" value="음식피드백 등록하기">
		<div id="foodFeedback">
			<div>
				음식을 검색해주세요.
				음식 카테고리 선택:
				<select name="foodGroup">
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
						</select>
					<input type="button" onclick="foodInfoAddBtn()" value="음식추가하기">
				</div>
			</div>
			<div id="foodInfoadd">
				<input type="hidden" name="foodNo" id="foodNo">
				<span id="result"></span><br>
				<input type="text" name="ingestionAmount" id="ingestionAmount" placeholder="섭취량을 숫자로 적어주세요.">
			</div>
		</div>
		<!-- 운동피드백 추가하기 -->
		<input type="submit" value="등록하기">
	</form>
		<input type="button" onclick="cancleBtn()" value="강사다시선택하기">
</body>
</html>