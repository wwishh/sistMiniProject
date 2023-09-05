<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String idx = request.getParameter("idx");
ShopDao dao = new ShopDao();
dao.deleteCart(idx);
%>