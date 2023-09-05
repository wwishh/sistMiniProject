<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
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
	div.sangpum{
		cursor: pointer;
	}
	div.sangpum img{
		width:70px;
		height:90px;
		border: 1px solid gray;
	}
	i.del{
		cursor: pointer;
	}
</style>
</head>
<%
//로그인id
String id = (String) session.getAttribute("myid");
ShopDao dao = new ShopDao();
//장바구니 목록
List<HashMap<String, String>> list = dao.getCartList(id);

MemberDao mdao = new MemberDao();
String name = mdao.getName(id);
%>
<body>
	<h4 class="alert alert-warning" style="width: 1000px"><%=name%>님의
		장바구니 목록
	</h4>
	<table class="table table-striped" style="width: 1000px">
		<tr>
			<th style="width: 30px"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px">상품정보</th>
			<th style="width: 200px">상품금액</th>
		</tr>

		<%
		int allmoney = 0;
		
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		
		
		for (int i = 0; i < list.size(); i++) {
			HashMap<String, String> map = list.get(i);

			//사진
			String photo = map.get("photo");
			
			int cnt = Integer.parseInt(map.get("cnt"));
			
		%>
		<tr>
			<td><input type="checkbox" idx="<%=map.get("idx") %>" class="idx"></td>
			<td><div class="sangpum" shopnum="<%=map.get("shopnum")%>">
			<img alt="" src="shopsave/<%=photo%>" align="left" hspace="20"> <!-- 이미지 옆에 텍스트오게 하려면 align left를 준다 -->
			<h5>상품명: <%=map.get("sangpum") %></h5>
			<h5>갯수: <%=map.get("cnt") %>개</h5>
			<h5>날짜: <%=map.get("cartday") %></h5>
			</div></td>
			<td>
				<%
				int price = Integer.parseInt(map.get("price"));
				price *= cnt;
				allmoney+=price;
				
				%>
				<h5><%=nf.format(price) %>원
				<i class="bi bi-trash3-fill del" idx="<%=map.get("idx") %>"></i></h5>
			</td>
		</tr>

		<%
		}
		%>
		
		<tr>
		<td colspan="4">
		<button type="button" class="btn btn-danger" id="btncartdel">선택상품삭제</button>
		<span style="font-size:2em;float:right">
		총 주문금액:<b style="color:green"><%=nf.format(allmoney) %>원</b>
		</span>
		</td>
		</tr>
	</table>
	
	<script type="text/javascript">
	
		//전체 선택시 체크박스 선택 해제
		$("#allcheck").click(function(){
			var chk = $(this).is(":checked");
			console.log(chk);
			
			//전체 체크값을 글 앞의 체크에 일괄 전달
			$(".idx").prop("checked", chk);
		});
		
		//상품 클릭시 디테일로
		$("div.sangpum").click(function(){
			var shopnum = $(this).attr("shopnum");
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		});
	
		$("#btncartdel").click(function(){
			//체크한 개수
			var cnt = $(".idx:checked").length;
			//alert(cnt);
			if(cnt==0){
				alert("먼저 삭제할 상품을 선택해주세요");
				return;
			}
			else{
				
			}
		});
		
		function del(){
			
		}
	</script>
</body>
</html>