<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Limits</title>
</head>
<body background="../Images/bg86.jpeg">
<br><br><br>
<%
Database db=new Database();
int cls=Integer.parseInt(request.getParameter("cls"));
int els=Integer.parseInt(request.getParameter("els"));
int hpls=Integer.parseInt(request.getParameter("hpls"));
int scls=Integer.parseInt(request.getParameter("scls"));
int mls=Integer.parseInt(request.getParameter("mls"));
try
{
ResultSet rs=db.executeDBQuery("select * from leavelimits");
if(rs.next())
	db.executeDBUpdate("update leavelimits set cls='"+cls+"',els='"+els+"',hpls='"+hpls+"',scls='"+scls+"',mls='"+mls+"'");
else
	db.executeDBUpdate("insert into leavelimits values('"+cls+"','"+els+"','"+hpls+"','"+scls+"','"+mls+"')");
out.println("<center><b>Leave Limits Succesfully Updated.</b><br/>");
out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
db.closeResultSet();
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