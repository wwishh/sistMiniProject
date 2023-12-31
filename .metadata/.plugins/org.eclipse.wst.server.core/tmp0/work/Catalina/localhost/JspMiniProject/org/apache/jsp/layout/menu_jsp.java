/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-04 02:07:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("\r\n");

//절대경로잡기
String root = request.getContextPath();
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\r\n");
      out.write("	href=\"");
      out.print(root);
      out.write("/menu/css/font-awesome.css\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"\r\n");
      out.write("	href=\"");
      out.print(root);
      out.write("/menu/css/menu.css\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(root);
      out.write("/menu/js/jquery.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(root);
      out.write("/menu/js/function.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<!-- 경로에서 main을 거치는 이유는 header나 footer를 유지하기 위해서이다 -->\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("		<header>\r\n");
      out.write("			<div class=\"inner relative\">\r\n");
      out.write("				<a class=\"logo\" href=\"http://www.freshdesignweb.com\"></a> <a\r\n");
      out.write("					id=\"menu-toggle\" class=\"button dark\" href=\"#\"><i\r\n");
      out.write("					class=\"icon-reorder\"></i></a>\r\n");
      out.write("				<nav id=\"navigation\">\r\n");
      out.write("					<ul id=\"main-menu\">\r\n");
      out.write("						<li class=\"current-menu-item\"><a href=\"");
      out.print(root);
      out.write("/index.jsp\">Home</a></li>\r\n");
      out.write("						<li class=\"parent\"><a href=\"#\">about 회원</a>\r\n");
      out.write("							<ul class=\"sub-menu\">\r\n");
      out.write("								");

								if (loginok != "yes") {
								
      out.write("\r\n");
      out.write("								<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=login/loginmain.jsp\"><i\r\n");
      out.write("										class=\"icon-wrench\"></i> 로그인</a></li>\r\n");
      out.write("								");

								} else {
								
      out.write("\r\n");
      out.write("								<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=login/loginmain.jsp\"><i\r\n");
      out.write("										class=\"icon-wrench\"></i> 로그아웃</a></li>\r\n");
      out.write("								");

								}
								
      out.write("\r\n");
      out.write("								<li><a\r\n");
      out.write("									href=\"");
      out.print(root);
      out.write("/index.jsp?main=member/memberform.jsp\"><i\r\n");
      out.write("										class=\"icon-credit-card\"></i> 회원가입</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								");

								if (myid!=null && myid.equals("admin") && loginok != null) {
								
      out.write("\r\n");
      out.write("								<li><a\r\n");
      out.write("									href=\"");
      out.print(root);
      out.write("/index.jsp?main=member/memberlist.jsp\"><i\r\n");
      out.write("										class=\"icon-gift\"></i> 회원목록</a></li>\r\n");
      out.write("								");

								}
								
      out.write("\r\n");
      out.write("\r\n");
      out.write("								");

								if (loginok != null) {
								
      out.write("\r\n");
      out.write("								<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=member/myinfo.jsp\"><i\r\n");
      out.write("										class=\"icon-gift\"></i> 나의정보</a></li>\r\n");
      out.write("								");

								}
								
      out.write("\r\n");
      out.write("							</ul></li>\r\n");
      out.write("\r\n");
      out.write("						<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=guest/guestlist.jsp\">회원방명록</a></li>\r\n");
      out.write("\r\n");
      out.write("						<li class=\"parent\"><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=board/boardlist.jsp\">스마트게시판</a>\r\n");
      out.write("							");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("						<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=load/map.jsp\">찾아오시는 길</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<li class=\"parent\"><a href=\"#\">쇼핑몰</a>\r\n");
      out.write("							<ul class=\"sub-menu\">\r\n");
      out.write("								\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								");

								if (loginok != null && myid.equals("admin")) {
								
      out.write("\r\n");
      out.write("								<li><a\r\n");
      out.write("									href=\"");
      out.print(root);
      out.write("/index.jsp?main=shop/addform.jsp\"><i\r\n");
      out.write("										class=\"icon-gift\"></i> 상품등록</a></li>\r\n");
      out.write("								");

								}
								
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("								<li><a href=\"");
      out.print(root);
      out.write("/index.jsp?main=shop/shoplist.jsp\"><i\r\n");
      out.write("										class=\"icon-gift\"></i> 상품목록</a></li>\r\n");
      out.write("\r\n");
      out.write("							</ul></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</nav>\r\n");
      out.write("				<div class=\"clear\"></div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</header>\r\n");
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
