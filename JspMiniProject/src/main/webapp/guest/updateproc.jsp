<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//db에 저장할 아이디얻기
	String myid=(String)session.getAttribute("myid");
	//실제경로
	String realPath = getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi = null;
	
	try{
		multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
		
		//주의: request가 아님 multi변수로 모든 폼데이터를 읽어야 한다
		String content = multi.getParameter("content");
		String photoname = multi.getFilesystemName("photo");
		
		//num, currentPage
		String num = multi.getParameter("num");
		String currentPage = multi.getParameter("currentPage");
		
		//기존의 포토 가져오기
		GuestDao dao = new GuestDao();
		String old_photo = dao.getData(num).getPhotoname();
		
		
		//dto에 저장
		GuestDto dto = new GuestDto();
		dto.setNum(num);
		dto.setMyid(myid);
		dto.setContent(content);
		dto.setPhotoname(photoname==null?old_photo:photoname);
		
		dao.updateGuest(dto);
		
		//방명록 목록으로 이동
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
		
	}catch(Exception e){
		
	}
%>
</body>
</html>