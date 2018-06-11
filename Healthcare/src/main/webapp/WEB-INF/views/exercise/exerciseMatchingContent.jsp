<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function exerciseMatchingList(data){
	$.each(data.exerciseMatchingList,function(key,val){
		$("#tbody").append('<tr><td>'+val.exerciseMatchingNo.substring(19,18)+'</td>'+
							'<td><a href="${pageContext.request.contextPath}/exerciseMatchingContent?exerciseMatchingNo='+val.exerciseMatchingNo+'">'+val.exerciseMatchingTitle+'</a></td>'+
							'<td>'+val.exerciseNo+'</td>'+
							'<td><a href="#" class="img" value="'+val.exerciseMatchingPlace+'">'+val.exerciseMatchingPlace+'</a></td>'+
							'<td>'+val.exerciseMatchingCount+'</td>'+
							'<td>'+val.exerciseMatchingScheduleDate+'/'+val.exerciseMatchingTime.replace(",","~")+'</td>'+
							'<td>'+val.memberId+'</td>'
							);
	});
}
</script>

</head>
<body>

</body>
</html>