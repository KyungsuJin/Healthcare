<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../include/header.jsp"></jsp:include>	
</head>
<body>
	<div class="sidebar-wrapper">
		<jsp:include page="../include/left.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="../include/top.jsp"></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header" data-background-color="purple">
								<h4 class="title">질병 등록</h4>
							</div>
							<div class="card-content">
								<form action="${pageContext.request.contextPath}/addDisease" method="POST">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<div class="form-group">
												<label class="control-label">질병 이름</label>
												<input class="form-control" type="text" id="diseaseName" name="diseaseName" maxlength="5">
											</div>
											<button type="button" class="btn btn-primary pull-right">취소하기</button>
											<button type="submit" class="btn btn-primary pull-right">질병등록하기</button>
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