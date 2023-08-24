<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
</head>
<%
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String myid = (String)session.getAttribute("myid");
String loginok = (String)session.getAttribute("loginok");
%>
<body>
	<table class="table" style="width: 600px">
		<%
		for (MemberDto dto : list) {
			if(loginok!=null&&dto.getId().equals(myid)){
		%>
		<tr>
			<td style="width: 200px; align: center" rowspan="5"><img
				src="image/1.png" style="width: 150px; height:200px; border-radius: 30px;">
			</td>
			<td>이름: <%=dto.getName()%></td>
			<td rowspan="5" width="200" align="center" valign="middle">
				<button type="button" class="btn btn-outline-info"
					onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-outline-danger"
					onclick="location.href=''">삭제</button>
			</td>
		</tr>
		<tr>
			<td>아이디: <%=dto.getId()%></td>
		</tr>
		<tr>
			<td>핸드폰: <%=dto.getHp()%></td>
		</tr>
		<tr>
			<td>주소: <%=dto.getAddr()%></td>
		</tr>
		<tr>
			<td>이메일: <%=dto.getEmail()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>