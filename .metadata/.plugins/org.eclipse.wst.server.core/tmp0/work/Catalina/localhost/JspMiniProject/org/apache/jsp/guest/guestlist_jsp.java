/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-08-25 06:48:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import data.dao.MemberDao;
import java.text.SimpleDateFormat;
import data.dto.GuestDto;
import java.util.List;
import data.dao.GuestDao;

public final class guestlist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("data.dto.GuestDto");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("data.dao.MemberDao");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("data.dao.GuestDao");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap\"\r\n");
      out.write("	rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\r\n");
      out.write("<style>\r\n");
      out.write("span.day {\r\n");
      out.write("	float: right;\r\n");
      out.write("	font-size: 11pt;\r\n");
      out.write("	color: gray;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("img.photo {\r\n");
      out.write("	border-radius: 20px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");

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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다  (해결책) 이전페이지로 간다
	if (list.size() == 0 && currentPage != 1) {
	
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("		location.href = \"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(currentPage - 1);
      out.write("\r\n");
      out.write("		\";\r\n");
      out.write("	</script>\r\n");
      out.write("	");

	}
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("	");

	if (loginok != null) {
	
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "addform.jsp", out, false);
      out.write("\r\n");
      out.write("	<hr align=\"left\" width=\"700\">\r\n");
      out.write("	");

	}
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div>\r\n");
      out.write("		<b>총 ");
      out.print(totalCount);
      out.write("개의 방명록 글이 있습니다\r\n");
      out.write("		</b>\r\n");
      out.write("\r\n");
      out.write("		");

		MemberDao mdao = new MemberDao();

		for (GuestDto dto : list) {
			//이름얻기
			String name = mdao.getName(dto.getMyid());
		
      out.write("\r\n");
      out.write("		<table class=\"table\" style=\"width: 600px\">\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><b><i class=\"bi bi-person-workspace\"></i>");
      out.print(name);
      out.write('(');
      out.print(dto.getMyid());
      out.write(")</b>\r\n");
      out.write("					");

					//로그인한 아이디
					String myid = (String) session.getAttribute("myid");

					//로그인한 아이디와 글쓴 아이디가 같을 경우에만 수정, 삭제
					if (loginok != null && dto.getMyid().equals(myid)) {
					
      out.write(" <a\r\n");
      out.write("					href=\"index.jsp?main=guest/updateform.jsp?num=");
      out.print(dto.getNum());
      out.write("&currentPage=");
      out.print(currentPage);
      out.write("\"\r\n");
      out.write("					style=\"color: green\"><i class=\"bi bi-pencil-square\"></i></a>\r\n");
      out.write("					<a href=\"guest/delete.jsp?num=");
      out.print(dto.getNum());
      out.write("&currentPage=");
      out.print(currentPage);
      out.write("\"\r\n");
      out.write("					style=\"color: red\"><i class=\"bi bi-trash3\"></i></a> \r\n");
      out.write("					\r\n");

 }
 
      out.write(" <span class=\"day\">");
      out.print(sdf.format(dto.getWriteday()));
      out.write("</span></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("\r\n");
      out.write("			<tr height=\"120\">\r\n");
      out.write("				<td>\r\n");
      out.write("					<!-- 이미지가 null이 아닌경우만 출력 --> ");

 if (dto.getPhotoname() != null) {
 
      out.write(" <a href=\"save/");
      out.print(dto.getPhotoname());
      out.write("\" target=\"_blank\"> <img\r\n");
      out.write("						src=\"save/");
      out.print(dto.getPhotoname());
      out.write("\" align=\"right\"\r\n");
      out.write("						style=\"width: 100px\" hspace=\"20\">\r\n");
      out.write("				</a> ");

 }
 
      out.write(' ');
      out.print(dto.getContent().replace("\n", "<br>"));
      out.write("\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("\r\n");
      out.write("			<!-- 댓글, 추천 -->\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><span class=\"answer\" style=\"cursor: pointer;\"\r\n");
      out.write("					num=");
      out.print(dto.getNum());
      out.write(">댓글0</span> <span class=\"likes\"\r\n");
      out.write("					style=\"margin-left: 20px; cursor: pointer;\" num=\"");
      out.print(dto.getNum());
      out.write("\">추천</span>\r\n");
      out.write("					<span class=\"chu\">");
      out.print(dto.getChu());
      out.write("</span></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("\r\n");
      out.write("		</table>\r\n");
      out.write("		");

		}
		
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<!-- 페이지번호 출력 -->\r\n");
      out.write("	<div>\r\n");
      out.write("		<ul class=\"pagination justify-content-center\">\r\n");
      out.write("\r\n");
      out.write("			");

			//이전
			if (startPage > 1) {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(startPage - perBlock);
      out.write("\"><<</a></li>\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(startPage);
      out.write("\"><<</a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("			");

			if (currentPage > 1) {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(currentPage - 1);
      out.write("\"><</a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(startPage);
      out.write("\"><</a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			");

			for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item active\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a></li>\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(pp);
      out.write('"');
      out.write('>');
      out.print(pp);
      out.write("</a></li>\r\n");
      out.write("			");

			}
			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			<!-- 다음버튼 -->\r\n");
      out.write("			");

			if (currentPage < totalPage) {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(currentPage + 1);
      out.write("\">></a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(endPage);
      out.write("\">></a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("			");

			if (totalPage > (endPage + 1)) {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(endPage + 1);
      out.write("\">>></a></li>\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<li class=\"page-item\"><a class=\"page-link\"\r\n");
      out.write("				href=\"index.jsp?main=guest/guestlist.jsp?currentPage=");
      out.print(endPage);
      out.write("\">>></a></li>\r\n");
      out.write("\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("		</ul>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
