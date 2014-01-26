<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="dbpackage.*" %>
      <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Permanent Salary Details Update</title>
</head>
<body background='../Images/bg86.jpeg'>
<br><br><br><br><br>
<%
String empcode=request.getParameter("empid");
Database db=new Database();
String str="update psaldtls set ";
str+=" basic="+request.getParameter("basic")+",";
str+="splal="+request.getParameter("splalnce")+",";
str+="itax="+request.getParameter("itax")+",";
str+="pf="+request.getParameter("pf")+",";
str+="lic="+request.getParameter("lic")+",";
str+="gis="+request.getParameter("gis")+",";
str+="trpt="+request.getParameter("transport")+",";
str+="vehcl="+request.getParameter("vehicle")+",";
str+="abl="+request.getParameter("abl")+",";
str+="soc="+request.getParameter("soc")+"";
str+=" where empid='"+empcode+"'";
try
{
db.executeDBUpdate(str);
out.println("<center><b> Employee's Permanent Salary Details Successfully Updated<br><br>");
out.println("<a href='../AccountsManager/PSalDtlsModify.html'>Back</a></center></b>");
db.closeConnections();
}
catch(Exception e)
{
	out.println("<center><b>Unable to update Permanent Salary details of Employee .<br><a href='../AccountsManager/PSalDtlsModify.html'>Retry</a></b></center>");
	db.closeConnections();
}
%>
</body>
</html>