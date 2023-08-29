<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
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
<style>
span.day {
	color: gray;
	font-size: 0.8em;
}

img {
	max-width: 200px;
}
</style>
</head>
<jsp:useBean id="dao" class="data.dao.SmartDao"></jsp:useBean>
<body>
	<%
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	
	
	dao.updateReadCount(num);

	SmartDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<div style="margin: 30px 30px; width: 500px">
		<table class="table table-bordered">
			<caption align="top">
				<b><h2><%=dto.getSubject()%></h2></b>
			</caption>
			<tr>
				<td><b>작성자: <%=dto.getWriter()%></b><br> <span
					class="day"><%=sdf.format(dto.getWriteday())%> &nbsp;&nbsp;
						조회: <%=dto.getReadcount()%></span></td>
			</tr>
			<tr height="150">
				<td><%=dto.getContent()%></td>
			</tr>
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='index.jsp?main=board/delete.jsp'">삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>