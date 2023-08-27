<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
div.Layout {
	/* border: 1px solid gray; */
	position: absolute;
}

div.title {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 30px;
	font-family: "Orbit";
	text-align: center;
}

div.menu {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-family: "Orbit";
	text-align: center;
	top: 200px;
}

div.info {
	width: 300px;
	height: 500px;
	line-height: 10px;
	font-family: "Orbit";
	left: 20px;
	top: 300px;
	padding: 30px 10px;
	/* border: 5px groove gray;
	border-radius: 30px; */
}

div.info2 {
	width: 180px;
	height: 500px;
	line-height: 10px;
	font-family: "Orbit";
	left: 1570px;
	top: 300px;
	padding: 30px 10px;
}

div.main {
	width: 1200px;
	height: 1000px;
	font-size: 13pt;
	font-family: "Orbit";
	left: 350px;
	top: 320px;
}
</style>
</head>
<%
//절대경로잡기
String root = request.getContextPath();
String mainPage = "layout/main.jsp"; //기본페이지

//url을 통해서 main값을 얻어서 메인 웹페이지에 출력한다
if (request.getParameter("main") != null) {
	mainPage = request.getParameter("main");
}
%>
<body>
		<div class="Layout title">
			<jsp:include page="layout/title.jsp" />
		</div>
	
	<div class="Layout menu">
		<jsp:include page="layout/menu.jsp" />
	</div>
	<div class="Layout info">
		<jsp:include page="layout/info.jsp" />
	</div>
	<div class="Layout info2">
		<jsp:include page="layout/info2.jsp" />
	</div>
	
	<div class="Layout main">
		<jsp:include page="<%=mainPage%>" />
	</div>
</body>
</html>