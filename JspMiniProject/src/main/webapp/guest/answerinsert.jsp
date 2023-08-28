<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
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
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String myid = request.getParameter("myid");
	String content = request.getParameter("content");
	
	String currentPage = request.getParameter("currentPage");
	
	AnswerDto adto = new AnswerDto();
	
	adto.setNum(num);
	adto.setMyid(myid);
	adto.setContent(content);
	
	AnswerDao adao = new AnswerDao();
	
	adao.insertAnswer(adto);
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage=" + currentPage);
	
%>
</body>
</html>