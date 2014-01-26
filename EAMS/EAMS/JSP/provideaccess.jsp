<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Give access</title>
</head>
<body>
<%
Database db = new Database();
String str="insert into Login values ('"+request.getParameter("empcode")+"','"+request.getParameter("password")+"','"+request.getParameter("access")+"')";
try
{
db.executeDBUpdate(str);
db.closeConnections();
out.println("<body background='../Images/bg85.jpeg'><br><br><br><br><br><br><h4><center> Access provided successfully</center></h4></body>");
}
catch(Exception e)
{
	out.println("<body background='../Images/bg85.jpeg'><br><br><br><br><br><br><h4><center> Unable to provide access to new user</center></h4></body>");
	db.closeConnections();
}
%>
</body>
</html>