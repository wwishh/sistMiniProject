<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div class="inputform" style="width: 500px;">
		<form action="shop/addaction.jsp" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<caption align="top">
					<b>상품등록</b>
				</caption>
				<tr>
					<td style="width: 150px;" class="table-success"><b>카테고리</b><br></td>
						<td><select class="form-control" name="category" required="required">
							<option value="아우터">아우터</option>
							<option value="상의">상의</option>
							<option value="하의">하의</option>
							<option value="악세서리">악세서리</option>
							<option value="세트">세트</option>
					</select>
					</td>
					</tr>
					<tr>
					<td style="width:150px" class="table-success">
					<b>상품명</b>
					</td>
					<td>
					<input type="text" name="sangpum" class="form-control" required="required"
					style="width:200px" placeholder="상품명입력">
					</td>
					</tr>
					
					<tr>
					<td style="width:150px" class="table-success">
					<b>상품이미지</b>
					</td>
					<td>
					<input type="file" name="photo" class="form-control" required="required"
					style="width:400px">
					</td>
					</tr>
					
					<tr>
					<td style="width:150px" class="table-success">
					<b>상품가격</b>
					</td>
					<td>
					<input type="text" name="price" class="form-control" required="required"
					style="width:150px" placeholder="상품가격입력">
					</td>
					</tr>
					
					<tr>
					<td style="width:150px" class="table-success">
					<b>입고일</b>
					</td>
					<td>
					<%
						//현재날짜구하기
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String day = sdf.format(new Date());
					%>
					<input type="date" name="ipgoday" class="form-control" required="required"
					style="width:300px" value="<%=day%>">
					</td>
					</tr>
					
					<tr>
					<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success" style="width:100px">상품저장</button>
					<button type="button" class="btn btn-outline-success" style="width:100px" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
			</table>
		</form>
	</div>
</body>
</html>