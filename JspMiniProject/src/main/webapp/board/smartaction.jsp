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
<title>Insert title here</title>
</head>
<body>
	<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="dao" class="data.dao.SmartDao" />
	<jsp:useBean id="dto" class="data.dto.SmartDto" />
	<jsp:setProperty property="*" name="dto" />

	<%
	//db에 insert
	dao.insertSmart(dto); //request에서 set 한 거랑 똑같음

	//목록으로 이동
	//response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
	
	//디테일페이지로 이동하려면 방금 insert된 num값을 알아야한다
	int num = dao.getMaxNum();
	response.sendRedirect("../index.jsp?main=board/contentview.jsp?num="+num);
	
	%>
</body>
</html>