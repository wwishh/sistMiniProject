<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String id= request.getParameter("id");
MemberDao dao = new MemberDao();
//아이디에 대한 이름얻기
String name=dao.getName(id);
%>

<div style="margin: 200px 200px">
<img src="image/9.png" width="500"><br>
<b><%=name %>님의 회원가입을 축하합니다</b>
<br><br>
<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>

<button type="button" class="btn btn-info" onclick="location.href='index.jsp'">메인</button>
</div>
</body>
</html>