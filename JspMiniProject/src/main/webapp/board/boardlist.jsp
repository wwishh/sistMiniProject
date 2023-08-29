<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
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
a:link, a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color:gray;
}
</style>
</head>

<%
SmartDao dao = new SmartDao();

int totalCount = dao.getTotalCount(); //전체 개수
int totalPage; // 총 페이지 수
int startPage; // 각 블럭에서 보여질 시작 페이지
int endPage; // 각 블럭에서 보여질 끝 페이지
int startNum; // db에서 가져올 글의 시작 번호(mysql은 첫글이 0, 오라클은 1)
int perPage = 3; //각 페이지 글 개수
int perBlock = 5; // 한 블럭 당 보여지는 페이지 개수
int currentPage; // 현재 페이지
int no; //각 페이지 당 출력할 시작 번호


//현재 페이지 읽기(단 null일 경우는 1페이지로 준다) 계산을 해야하므로 int로 형변환 해줌
if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("null"))
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 수 구하기
//총 글의 개수 / 한 페이지 당 보여질 개수로 나눔
//나머지가 1이라도 있으면 무조건 1페이지 추가
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭 당 보여야할 시작 페이지
//perBlock = 5 일경우는 현재페이지 1~5 시작:1 끝:5
//현재페이지 13 시작:11 끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1;

endPage = startPage + perBlock - 1;

//총 페이지가 23일 경우 마지막 블럭 25가 아니라 23이다
if (endPage > totalPage)
	endPage = totalPage;

//각 페이지에서 보여질 시작 번호
//1페이지: 0, 2페이지:5, 3페이지:10
startNum = (currentPage - 1) * perPage;

//각 페이지 당 출력할 시작 번호 구하기
//총 글 개수가 23이면 1페이지 23, 2페이지는 18, 3페이지 13
no = totalCount - (currentPage - 1) * perPage;

//페이지에서 보여질 글만 가져오기
List<SmartDto> list = dao.getPagingList(startNum, perPage);
%>
<body>
	<div style="margin: 30px 30px; width: 800px;">
		<br><br>
		<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
		<h5>
			<b>총<%=totalCount%>개의 게시글이 있습니다</b>
		</h5>
		<table class="table table-bordered">
			<caption align="top">
				<b>스마트 게시판 목록</b>
			</caption>
			<tr class="table-light">
				<th width="60">번호</th>
				<th width="450">제목</th>
				<th width="130">작성자</th>
				<th width="160">작성일</th>
				<th width="60">조회</th>
			</tr>

			<%
			if (totalCount == 0) {
			%>
			<tr>
				<td colspan="5" align="center">
					<h6>등록된 게시글이 없습니다</h6>
				</td>
			</tr>
			<%
			} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			for (SmartDto dto : list) {
			%>
			<tr>
				<td align="center"><%=no--%></td>
				<td><a
					href="index.jsp?main=board/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"><%=dto.getSubject()%></a>
				</td>
				<td><%=dto.getWriter()%></td>
				<td align="center"><%=sdf.format(dto.getWriteday())%></td>
				<td align="center"><%=dto.getReadcount()%></td>
			</tr>

			<%
			}
			}
			%>

		</table>
	</div>


	<!-- 페이지번호 출력 -->
	<div>
		<ul class="pagination justify-content-center">

			<%
			//이전
			if (startPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage - perBlock%>"><<</a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage%>"><<</a></li>

			<%
			}
			%>

			<%
			if (currentPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage - 1%>"><</a></li>

			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage%>"><</a></li>

			<%
			}
			%>





			<%
			for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			}
			}
			%>



			<!-- 다음버튼 -->
			<%
			if (currentPage < totalPage) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage + 1%>">></a></li>

			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage%>">></a></li>

			<%
			}
			%>

			<%
			if (totalPage > (endPage + 1)) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage + 1%>">>></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage%>">>></a></li>

			<%
			}
			%>
		</ul>
	</div>
</body>
</html>