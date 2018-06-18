<!-- [진경수] -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<%-- <!-- 사이트가 IE에서 올바로 표시되지 않는다면, 가장 최신 웹 표준 지원을 위해 사이트를 업데이터하거나,(권장)
IE를  이전 버전의 브라우저에서 보는 것처럼 내용을 표시하도록 할 수 있습니다. 하지만 기능들이 정상적으로 작동하지 않을수도 있습니다.
화면에 보이는 것만 정상적으로 보일수 있다. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 어떤 디바이스에서든 해당 디바이스에 맞는 화면크기를 보여주기위하여 사용. -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 부트스트랩 기본 css-->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다.) 그런데 나는 자바스크랩트 최신버전으로 새로 받은거임~ -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<!-- 로그인 버튼 누르면 submit시키려고~ -->
<script src="${pageContext.request.contextPath}/js/topMenu.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>

    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Material Dashboard by Creative Tim</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templatecss1/bootstrap.min.css">
    <!--  Material Dashboard CSS    -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templatecss1/material-dashboard.css?v=1.2.0">
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templatecss1/demo.css">
    <!--     Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons" rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
    <!--   Core JS Files   -->
<script src="<c:url value="/templatejs1/jquery-3.2.1.min.js" />"></script>

<script src="<c:url value="/templatejs1/bootstrap.min.js" />"></script>
<script src="<c:url value="/templatejs1/material.min.js" />"></script>

<script src="<c:url value="/templatejs1/chartist.min.js" />"></script>
<!--  Dynamic Elements plugin -->
<script src="<c:url value="/templatejs1/arrive.min.js" />"></script>
<!--  PerfectScrollbar Library -->
<script src="<c:url value="/templatejs1/perfect-scrollbar.jquery.min.js" />"></script>
<!--  Notifications Plugin    -->
<script src="<c:url value="/templatejs1/bootstrap-notify.js" />"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="<c:url value="/templatejs1/material-dashboard.js?v=1.2.0" />"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="<c:url value="/templatejs1/demo.js" />"></script>