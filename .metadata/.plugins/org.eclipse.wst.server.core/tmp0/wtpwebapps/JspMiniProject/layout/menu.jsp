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

<%
//절대경로잡기
String root = request.getContextPath();
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");
%>


<link rel="stylesheet" type="text/css"
	href="<%=root%>/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="<%=root%>/menu/css/menu.css">

<script type="text/javascript" src="<%=root%>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root%>/menu/js/function.js"></script>

<title>Insert title here</title>
</head>

<!-- 경로에서 main을 거치는 이유는 header나 footer를 유지하기 위해서이다 -->

<body>
	<%-- <a href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">Q & A</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root%>/">Shop</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>

	<div id="wrap">
		<header>
			<div class="inner relative">
				<a class="logo" href="http://www.freshdesignweb.com"></a> <a
					id="menu-toggle" class="button dark" href="#"><i
					class="icon-reorder"></i></a>
				<nav id="navigation">
					<ul id="main-menu">
						<li class="current-menu-item"><a href="<%=root%>/index.jsp">Home</a></li>
						<li class="parent"><a href="#">about 회원</a>
							<ul class="sub-menu">
								<%
								if (loginok != "yes") {
								%>
								<li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i
										class="icon-wrench"></i> 로그인</a></li>
								<%
								} else {
								%>
								<li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i
										class="icon-wrench"></i> 로그아웃</a></li>
								<%
								}
								%>
								<li><a
									href="<%=root%>/index.jsp?main=member/memberform.jsp"><i
										class="icon-credit-card"></i> 회원가입</a></li>


								<%
								if (myid!=null && myid.equals("admin") && loginok != null) {
								%>
								<li><a
									href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i
										class="icon-gift"></i> 회원목록</a></li>
								<%
								}
								%>

								<%
								if (loginok != null) {
								%>
								<li><a href="<%=root%>/index.jsp?main=member/myinfo.jsp"><i
										class="icon-gift"></i> 나의정보</a></li>
								<%
								}
								%>
							</ul></li>

						<li><a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">회원방명록</a></li>

						<li class="parent"><a href="#">고객의 소리</a>
							<ul class="sub-menu">
								<li><a href="<%=root%>/index.jsp?main=board/boardlist.jsp">회원게시판</a></li>
								<li><a href="#">스마트게시판</a></li>
							</ul></li>




						<li><a href="<%=root%>/index.jsp?main=load/map.jsp">찾아오시는 길</a></li>

					</ul>
				</nav>
				<div class="clear"></div>
			</div>
		</header>
	</div>
</body>
</html>