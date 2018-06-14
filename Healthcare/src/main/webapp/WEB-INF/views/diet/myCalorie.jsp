<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>myCalorie.jsp</h1>
	<h3><a href="${pageContext.request.contextPath}/addIngestCalorie">소모칼로리등록하기</a></h3>
	<h3><a href="${pageContext.request.contextPath}/getIngestCalorie">등록된 소모칼로리 리스트보기</a></h3>
	
	
	
	<div>
		<h3>나의칼로리 누적현황</h3>
		
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<td></td>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>