<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
span.day {
	float: right;
	font-size: 11pt;
	color: gray;
}

img.photo {
	border-radius: 20px;
}
</style>


<script>
$(function(){
	$(".delme").click(function(){
		
		var num = $(this).attr("num");
		var currentPage = $(this).attr("currentPage");
		//alert(num+","+currentPage);
		
		var yes = confirm("정말 삭제하시겠어요?");
		
		if(yes){
			location.href="guest/delete.jsp?num="+num+"&currentPage="+currentPage;
			alert("삭제됐어요");
		}else{
			alert("취소됐어요");
		}
		
	});
	
	$("span.likes").click(function(){
		var num = $(this).attr("num");
		//alert(num);
		var tag = $(this);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"guest/ajaxlikes.jsp",
			data:{"num":num},
			success:function(data){
				//alert(data.chu);
				tag.next().text(data.chu);
				
				//추천클릭시 하트 커지고 끝나면 다시 0px
				tag.next().next().animate({"font-size":"20px"}, 1000, function(){
					$(this).css("font-size","0px");
				});
			}
		})
	});
	
	//댓글부분은 무조건 안보이게 처리
	$("div.answer").hide();
	
	//댓글 클릭시
	$("span.answer").click(function(){
		
			//$(this).prev().toggle('slow');
			$(this).parent().find("div.answer").toggle('slow');

	});
	
	
	
	$("i.adel").click(function(){
		
		var a = confirm("삭제하려면 [확인]을 눌러주세요");
		
		if(a){
			
			var idx = $(this).attr("idx");
			//alert(idx);
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"guest/answerdelete.jsp",
				data:{"idx":idx},
				success:function(data){
					location.reload(); //새로고침
				}
			});
		}
		
		
	});
	
	$("i.aup").click(function(){
		
		var idx = $(this).attr("idx");
		

		$.ajax({
			type:"get",
			dataType:"html",
			url:"guest/answerupdate.jsp",
			data:{"idx":idx},
			success:function(data){
				location.reload();
			}
		});
	});
	
	
	
	
});
</script>

<title>Insert title here</title>
</head>
<body>
	<%
	//로그인 상태 확인 후 입력 폼 나타낼 것_회원만 보이게
	String loginok = (String) session.getAttribute("loginok");

	GuestDao dao = new GuestDao();

	int totalCount = dao.getTotalCount(); //전체 개수
	int totalPage; // 총 페이지 수
	int startPage; // 각 블럭에서 보여질 시작 페이지
	int endPage; // 각 블럭에서 보여질 끝 페이지
	int startNum; // db에서 가져올 글의 시작 번호(mysql은 첫글이 0, 오라클은 1)
	int perPage = 3; //각 페이지 글 개수
	int perBlock = 5; // 한 블럭 당 보여지는 페이지 개수
	int currentPage; // 현재 페이지

	//현재 페이지 읽기(단 null일 경우는 1페이지로 준다) 계산을 해야하므로 int로 형변환 해줌
	if (request.getParameter("currentPage") == null)
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

	//페이지에서 보여질 글만 가져오기
	List<GuestDto> list = dao.getList(startNum, perPage);

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다  (해결책) 이전페이지로 간다
	if (list.size() == 0 && currentPage != 1) {
	%>
	<script>
		location.href = "index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage - 1%>
		";
	</script>
	<%
	}
	%>

	<%
	if (loginok != null) {
	%>
	<jsp:include page="addform.jsp" />
	<hr align="left" width="700">
	<%
	}
	%>

	<div>
		<b>총 <%=totalCount%>개의 방명록 글이 있습니다
		</b>

		<%
		MemberDao mdao = new MemberDao();

		for (GuestDto dto : list) {
			//이름얻기
			String name = mdao.getName(dto.getMyid());
		%>
		<table class="table" style="width: 600px">
			<tr>
				<td><b><i class="bi bi-person-workspace"></i><%=name%>(<%=dto.getMyid()%>)</b>
					<%
					//로그인한 아이디
					String myid = (String) session.getAttribute("myid");

					//로그인한 아이디와 글쓴 아이디가 같을 경우에만 수정, 삭제
					if (loginok != null && dto.getMyid().equals(myid)) {
					%> <a
					href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"
					style="color: green"><i class="bi bi-pencil-square"></i></a>
					<a href="" num="<%=dto.getNum() %>" currentPage = "<%=currentPage %>"
					style="color: red" class="delme"><i class="bi bi-trash3"></i></a> 
					
<%
 }
 %> <span class="day"><%=sdf.format(dto.getWriteday())%></span></td>
			</tr>

			<tr height="120">
				<td>
					<!-- 이미지가 null이 아닌경우만 출력 --> <%
 if (dto.getPhotoname() != null) {
 %> <a href="save/<%=dto.getPhotoname()%>" target="_blank"> <img
						src="save/<%=dto.getPhotoname()%>" align="right"
						style="width: 100px" hspace="20">
				</a> <%
 }
 %> <%=dto.getContent().replace("\n", "<br>")%>
				</td>
			</tr>

			<!-- 댓글, 추천 -->
			<!-- 추천수 클릭시 추천숫자 옆에 하트 커졌다 사라지게 animate -->
			<tr>
				<td>
				
				<%
				//각 방명록에 달린 댓글 목록 가져오기
				AnswerDao adao = new AnswerDao();
				List<AnswerDto> alist = adao.getAllAnswers(dto.getNum());
				%>
				
				<div class="answer">
					<% if(loginok!=null){
						%>
						
						<div class="answerform">
							<form action="guest/answerinsert.jsp" method="post">
								<table class="table table-bordered" style="width:500px">
									<tr>
									<td>
										<textarea style="width:500px; height:80px" name="content" required="required"></textarea>
									</td>
									<td>
									<button type="submit" class="btn btn-info" style="width:80px; height:80px">등록</button>
									<!-- hidden값 3개 -->
									<input type="hidden" name="num" value="<%=dto.getNum()%>">
									<input type="hidden" name="myid" value="<%=myid%>">
									<input type="hidden" name="currentPage" value="<%=currentPage%>">
									</td>
									</tr>
								</table>
							</form>
						</div>
					<%}
					%>
					
					<div class="answerlist"> 
						<table class="table" style="width:480px">
							<%
								for(AnswerDto adto : alist){%>
									<tr>
									<!-- <td width="60">
									<i class="bi bi-person-circle"></i>
									</td> -->
									<td>
									<i class="bi bi-person-circle"></i>
									<%
									//작성자명
									String aname = mdao.getName(adto.getMyid());
									%>
									
									<b><%=aname %></b>
									&nbsp;
									<%
									//글쓴이와 댓글 쓴이가 같을 경우 [작성자]
									if(dto.getMyid().equals(adto.getMyid())){		
									%>
									<b><span style="color:red; border:1px solid red; border-radius:20px">작성자</span></b>
									<%} %>
									
									<span style="font-size:9pt;color:gray;margin-left:20px"><%=sdf.format(adto.getWriteday()) %></span>
									<br>
									<span><%=adto.getContent().replace("\n","<br>") %></span>
									<%
										//수정 삭제는 로그인 중이면서 로그인한 아이디와 같은 경우만 보이게
										if(loginok!=null&&adto.getMyid().equals(myid)){%>
										<i class="bi bi-trash3 adel" style="color: red; cursor: pointer; float:right; font-size:20px" idx=<%=adto.getIdx() %>></i>
										<i class="bi bi-pencil-square aup" data-bs-toggle="modal" data-bs-target="#myModal" style="color: green; cursor: pointer; float:right; font-size:20px" idx=<%=adto.getIdx() %>></i>
									<%}%>
									</td>
									</tr>
								<%}
							%>
						</table>
					</div>
				</div>
				
				<span class="answer" style="cursor: pointer;"
					num=<%=dto.getNum()%>>댓글<%=alist.size() %></span> <span class="likes"
					style="margin-left: 20px; cursor: pointer;" num="<%=dto.getNum()%>">추천</span>
					<span class="chu"><%=dto.getChu()%></span><i class="bi bi-suit-heart-fill" style="color:red; font-size:0px"></i>
					</td>
			</tr>

		</table>
		<%
		}
		%>
	</div>


	<!-- 페이지번호 출력 -->
	<div>
		<ul class="pagination justify-content-center">

			<%
			//이전
			if (startPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage - perBlock%>"><<</a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage%>"><<</a></li>

			<%
			}
			%>

			<%
			if (currentPage > 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage - 1%>"><</a></li>

			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage%>"><</a></li>

			<%
			}
			%>





			<%
			for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
			%>
			<li class="page-item active"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			}
			}
			%>



			<!-- 다음버튼 -->
			<%
			if (currentPage < totalPage) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=currentPage + 1%>">></a></li>

			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage%>">></a></li>

			<%
			}
			%>

			<%
			if (totalPage > (endPage + 1)) {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage + 1%>">>></a></li>
			<%
			} else {
			%>
			<li class="page-item"><a class="page-link"
				href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage%>">>></a></li>

			<%
			}
			%>
		</ul>
	</div>
	


<%
	
	
%>


<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h4 class="modal-title">내용을 입력해주세요</h4>
		<textarea style="width:400px; height:80px" name="content2" id="content2" required="required"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="button" class="btn btn-info" style="float: right;">수정하기</button>
      </div>

    </div>
  </div>
</div>




</body>
</html>