<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dbpackage.*" %>
<%
String empid=request.getParameter("empid");
Database db=new Database();
ResultSet rs=db.executeDBQuery("select ename from employees where empid='"+empid+"'");
if(rs.next())
	out.println("<b>Employee Name</b>:  "+rs.getString(1));
else
	out.println("<b>Employee code dosent exits</b>");
%>