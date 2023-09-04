<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
img.large{
	width:450px;
	height:520px;
}
</style>
<script>
$(function(){
	$("#btncart").click(function(){
		
		//form태그의 모든값 가져오기
		var formdata = $("#frm").serialize();
		alert(formdata);
	});
});
</script>
</head>
<%
String shopnum = request.getParameter("shopnum");

//로그인 상태
String loginok = (String)session.getAttribute("loginok");
//로그인한 아이디
String myid = (String)session.getAttribute("myid");
//아이디에 해당하는 멤버의 시퀀스
MemberDao mdao = new MemberDao();
String num = mdao.getNum(myid);

ShopDao dao = new ShopDao();
ShopDto dto = dao.getData(shopnum);
%>
<body>
	<form id="frm">
	<!-- hidden -->
	<input type="hidden" name="shopnum" value="<%=shopnum %>">
	<input type="hidden" name ="num" value="<%=num %>">
	
	<table style="width:800px">
		<tr>
		<td style="width:500px">
		<div id="photo">
		<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="img-thumbnail large">
		</div>
		</td>
		<td>
		<h3>카테고리: <%=dto.getCategory() %></h3>
		<h3>상품명: <%=dto.getSangpum() %></h3>
		<%
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		%>
		<h3>가격: <%=nf.format(dto.getPrice())  %></h3>
		<h3>
		갯수:
		<input type="number" min="1" max="10" value="1" step="1" name="cnt">
		</h3>
		
		<div style="margin-top:100px; margin-left:50px">
			<button type="button" class="btn btn-success" id="btncart">장바구니</button>
			<button type="button" class="btn btn-warning" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
		</div>
		</td>
		</tr>
	</table>
	</form>
</body>
</html>