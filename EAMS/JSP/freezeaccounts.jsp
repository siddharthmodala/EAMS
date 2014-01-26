<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Freeze Accounts </title>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
<%
Database db=new Database();
String year=request.getParameter("year");
String opr=request.getParameter("opr");
String month=request.getParameter("month");
try
{
	if(month.equals("All") && opr.equals("1"))
		db.executeDBUpdate("update freezeacc set apr=1,may=1,jun=1,jul=1,aug=1,sep=1,oct=1,nov=1,dec=1,jan=1,feb=1,mar=1 where year='"+year+"'");
	else if(month.equals("All") && opr.equals("0"))
			db.executeDBUpdate("update freezeacc set apr=0,may=0,jun=0,jul=0,aug=0,sep=0,oct=0,nov=0,dec=0,jan=0,feb=0,mar=0 where year='"+year+"'");
	else
		db.executeDBUpdate("update freezeacc set "+month+"="+opr+" where year='"+year+"'");
	db.closeConnections();
	if(opr.equals("1"))
		out.println("<center><b>Accounts Locked Successfully</b></center><br>");
	else
		out.println("<center><b>Accounts Unlocked Successfully</b></center><br>");
}
catch(Exception e)
{
 out.println("<center><b>Unable to lock/unlock the months account</b></center><br>");	
}
%>
<center><a href="./lockaccounts.jsp" target="f3"><b>Back</b></a></center>
</body>
</html>