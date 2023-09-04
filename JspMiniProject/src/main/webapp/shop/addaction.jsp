<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//업로드경로
	String uploadPath = getServletContext().getRealPath("/shopsave");
	System.out.println(uploadPath);
	//업로드 이미지 사이즈
	int uploadSize = 1024*1024*5;
	
	MultipartRequest multi = null;
	
	try{
	multi = new MultipartRequest(request, uploadPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

	String category = multi.getParameter("category");
	String sangpum = multi.getParameter("sangpum");
	String photo = multi.getFilesystemName("photo");
	int price = Integer.parseInt(multi.getParameter("price"));	
	String ipgoday = multi.getParameter("ipgoday");
	
	ShopDto dto = new ShopDto();
	
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	ShopDao dao = new ShopDao();
	
	dao.insertShop(dto);
	
	}catch(Exception e){
		System.out.println("업로드 오류 " + e.getMessage());
	}
	
	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	%>
</body>
</html>