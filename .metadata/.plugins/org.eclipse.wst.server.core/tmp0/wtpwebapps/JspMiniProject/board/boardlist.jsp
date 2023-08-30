<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gugi&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
}
</style>

<script type="text/javascript">
	$(function(){
		//전체 선택 클릭시 체크값 얻어서 모든체크값 전달
		$(".alldelcheck").click(function(){
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체체크값을 글앞의 체크에 일괄 전달하기(prop)
	 		$(".delcheck").prop("checked",chk);
		});
		
		$("#btndel").click(function(){
			//체크된 길이
			var len=$(".delcheck:checked").length;
			//alert(len);
			
			if(len==0){
				alert("최소 1개 이상 체크해 주세요");
			}
			else{
				var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요");
				
				if(a){
					
				//체크된 곳의 value값 얻기(num)
				var n="";
				
				$(".delcheck:checked").each(function(idx){
					n+=$(this).val()+",";
				});
				
				//마지막 콤마 제거
				n=n.substring(0,n.length-1);		//1,2,3, -> 1,2,3 으로 마지막 콤마제거
				console.log(n);
				
				//삭제파일로 전송
				location.href="board/alldelete.jsp?nums="+n;
				}
			}
		}); 
	});
</script>
</head>
<%
SmartDao dao = new SmartDao();

int totalCount = dao.getTotalCount(); //전체 개수
int totalPage; //총 페이지 수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지
int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0, oracle은 1)
int perPage = 3; //한페이지당 보여질 글 개수
int perBlock = 5; //한 블럭당 보여질 페이지 개수
int currentPage; //현재페이지
int no; //각 페이지 당 출력할 시작번호

//현제페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환
if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("null"))
	currentPage = 1;
else
	//getParameter의 반환값이 String이라 int로 형변환
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지수 구하기
//총 글의 개수/한 페이지당 보여질 개수로 나눔	ex)7/5=2페이지
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭당 보여야할 시작페이지
//perBlock=5일경우는 현제페이지 1~5 시작:1 끝:5
//현재페이지 13		시작:11  끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1;

//한 블럭당 보이는 마지막페이지
//ex) 현제페이지 6페이지, perblock 5일경우 - endPage:10
endPage = startPage + perBlock - 1;

//총 페이지가 23일경우 마지막블럭은 25가 아니라 23이다
if (endPage > totalPage)
	endPage = totalPage;

//각 페이지에서 보여질 시작번호
//1페이지: 0,2페이지:5, 3페이지:10...0부터 시작 perPage 5일경우
startNum = (currentPage - 1) * perPage;

//각페이지당 출력할 시작번호 구하기
//ex) 총 글개수가 23이면 1페이지 23, 2페이지 18, 3페이지 13...
no = totalCount - (currentPage - 1) * perPage;

//페이지에서 보여질 글만 가져오기
List<SmartDto> list = dao.getPagingList(startNum, perPage);

//마지막 페이지 남은 글 지우면 빈페이지만 남는다 -> 해결: 이번페이지로 이동
if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
		location.href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage - 1%>;
	</script>
<%
}
%>
<body>
	<div>
		<br>
		<h5>
			<b>총<%=totalCount%>개의 게시글이 있습니다
			</b>
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
				<td align="center"><input type="checkbox" class="delcheck"
					value="<%=dto.getNum()%>"> <%=no--%></td>
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
			<tr>
				<td colspan="5"><input type="checkbox" class="alldelcheck">전체선택
					<span style="float: right;">
						<button type="button" class="btn btn-danger" id="btndel">삭제</button>
						<button type="button" class="btn btn-info"
							onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
				</span></td>
			</tr>
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