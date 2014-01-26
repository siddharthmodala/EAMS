<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update limits</title>
</head>
<body background="../Images/bg86.jpeg">
<br><br>
<%
Database d=null;
try
{
d=new Database();
float dp=Float.parseFloat(request.getParameter("dp"));
float da=Float.parseFloat(request.getParameter("da"));
float hra=Float.parseFloat(request.getParameter("hra"));
ResultSet rs=d.executeDBQuery("select * from limitpercentages");
if(rs.next())
	d.executeDBUpdate("update limitpercentages set dp='"+dp+"',da='"+da+"',hra='"+hra+"'");
else
	d.executeDBUpdate("insert into limitpercentages values('"+dp+"','"+da+"','"+hra+"')");
out.println("<center><b>Percentage Limits Succesfully Updated!!</b><br/>");
out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
d.closeResultSet();
}
catch(Exception e)
{
	out.println("<center><b>DB ERROR<br></b>"+e);
	out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
	out.close();
}
%>
</body>
</html>