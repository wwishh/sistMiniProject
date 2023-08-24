<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberDto"%>
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
<script>
	$(function() {

		//id중복체크
		$("#btncheck").click(function() {

			//id읽기
			var id = $("#id").val();
			//alert(id);

			$.ajax({
				type : "get",
				url : "member/idsearch.jsp",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(data) {
					//alert(data.count);
					if (data.count == 1) {
						//alert("이미 가입된 아이디 입니다\n다시 입력해주세요");
						$("span.idsuccess").text("fail");
						$("#id").val("");
					} else {
						//alert("사용 가능한 아이디 입니다");
						$("span.idsuccess").text("success");
					}
				}
			})
		});

		//선택 이메일 주소 넣기..혹은 직접입력
		$("#selemail").change(function() {
			var sel = $(this).val();

			if (sel == "-") {
				$("#email2").val("");
				$("#email2").focus();
			} else {
				$("#email2").val(sel);
			}

		});

	});

	
</script>
</head>

<%
//num
String num = request.getParameter("num");
//dao
MemberDao dao = new MemberDao();
//dto
MemberDto dto = dao.getMember(num);

//이메일 구분하기(@기준으로)_#1
/* int idx = dto.getEmail().indexOf("@");
String email1 = dto.getEmail().substring(0, idx);
String email2 = dto.getEmail().substring(idx + 1); */

//@을 구분자로 분리_#2
StringTokenizer st = new StringTokenizer(dto.getEmail(),"@");
String email1 = st.nextToken();
String email2 = st.nextToken();
%>

<body>
	<form action="member/updateproc.jsp" method="post"
		onsubmit="return check(this)">
		<input type="hidden" name="num" value="<%=num %>">
		<table class="table table-bordered" style="width: 500px;">
			<caption align="top">
				<b>회원정보수정</b>
			</caption>
			<tr>
				<th style="width: 100px; background-color: pink">아이디</th>
				<td><input type="text" name="id" id="id" class="form-group"
					readonly="readonly" style="width: 120px" value="<%=dto.getId()%>">

			</tr>



			<tr>
				<th style="width: 100px; background-color: pink">비밀번호</th>
				<td><input type="password" name="pass" placeholder="비밀번호"
					class="form-group" required="required" style="width: 120px">
				</td>
			</tr>

			<tr>
				<th style="width: 100px; background-color: pink">회원명</th>
				<td><input type="text" name="name" placeholder="이름"
					class="form-group" required="required" style="width: 120px" value="<%=dto.getName() %>">
				</td>
			</tr>

			<tr>
				<th style="width: 100px; background-color: pink">핸드폰</th>
				<td><input type="text" name="hp" placeholder="핸드폰번호"
					class="form-group" required="required" style="width: 200px" value="<%=dto.getHp()%>">
				</td>
			</tr>

			<tr>
				<th style="width: 100px; background-color: pink">주소</th>
				<td><input type="text" name="addr" placeholder="주소"
					class="form-group" required="required" style="width: 350px" value="<%=dto.getAddr()%>">
				</td>
			</tr>

			<tr>
				<th style="width: 100px; background-color: pink">이메일</th>
				<td><input type="text" name="email1" class="form-group"
					required="required" style="width: 120px" value="email1"> <b>@</b> <input
					type="text" name="email2" id="email2" required="required"
					style="width: 120px" value="<%=email2%>"> <select id="selemail">
						<option value="-">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="hanmail.net">다음</option>
						<option value="nate.com">네이트</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align='center'>
					<button type="submit" class="btn btn-outline-info"
						style="width: 100px">회원정보수정</button>
					<button type="reset" class="btn btn-outline-info"
						style="width: 100px">초기화</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
	function check(f) {
		if (f.pass.value != <%=dto.getPass()%>) {
			alert("비밀번호가 틀립니다");
			f.pass.value = "";

			return false; //action이 호출되지 않는다
		}
	}
	</script>
</body>
</html>