<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String nums=request.getParameter("nums");
//,로 분리해서 [] 화 시키자
String [] num= nums.split(",");
//배열의 길이만큼 삭제하고 목록으로
SmartDao dao = new SmartDao();

for(String n:num){
	dao.deleteSmart(n);
}

response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
%>
</body>
</html>