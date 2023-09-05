<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>

#loginbtn, #logoutbtn {
	position: absolute;
	top: 150px;
	left: 1800px;
}

#loginname{
	position: absolute;
	top: 200px;
	left: 1700px;
	color:white;
	z-index: 1;
	font-size: 15px;
}
div.cart{
	float:right;
	cursor: pointer;	
}

.count{
	width: 30px;
	height : 30px;
	float : right;
	background-color: red;
	border-radius:100px;
	text-align: center;
	line-height : 30px;
	z-index:10;
	position: relative;
	left: -20px;
	top:10px;
	color:white;
	font-size: 0.8em;
}


</style>
<script>
	$(function(){
		$("div.cart").click(function(){
			location.href = "index.jsp?main=shop/mycart.jsp";
		});
	});
</script>
</head>
<%
//절대경로잡기
String root = request.getContextPath();

//로그인세션
String loginok = (String) session.getAttribute("loginok");
//아이디얻기
String myid = (String) session.getAttribute("myid");
//dao에서 이름얻기
MemberDao dao = new MemberDao();
String name = dao.getName(myid);
%>
<body>
<a href="<%=root%>" style="text-decoration: none">
	<img src="<%=root%>/image/1.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/2.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/3.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/4.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/5.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/6.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/7.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/8.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/9.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/10.png" width="150" height="200"
		style="z-index: 0">
	<img src="<%=root%>/image/11.png" width="150" height="200"
		style="z-index: 0">
</a>
	<%
	if (loginok == null) {
	%>
	<button type="button" class="btn btn-success"
		style="width: 100px; z-index: 1"
		onclick="location.href='index.jsp?main=login/loginmain.jsp'"
		id="loginbtn">Login</button>
	<%
	} else {
	%>
	<div id="loginname"><b><%=name%>님 로그인 중...</b></div>
	<button type="button" class="btn btn-danger"
		style="width: 100px; z-index: 1"
		onclick="location.href='index.jsp?main=login/loginmain.jsp'"
		id="logoutbtn">Logout</button>
	<%
	}
	%>
	
	<div class="cart">
	<%
		ShopDao sdao = new ShopDao();
		//카트갯수
		int cartSize = sdao.getCartList(myid).size();
	%>
	<i class="bi bi-cart-fill" style="font-size:1.2em"></i>
	<div class="count"><%=cartSize %></div>
	</div>
</body>
</html>