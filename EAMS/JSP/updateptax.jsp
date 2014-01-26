<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dbpackage.*" %>  
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Professional Tax Update</title>
</head>
<body background="../Images/bg86.jpeg">
<br><br>
<%
int x=1;
int i=1;
for(i=1;i<=8;i++)
{
	String col1="pt"+i+"1";
	String col2="pt"+i+"2";
	String col3="pt"+i+"3";
	String low=request.getParameter(col1);
	String high=request.getParameter(col2);
	String value=request.getParameter(col3);
	if(low.equals("") || high.equals("") || value.equals(""))
	{
		try{
		Database m=new Database();
		ResultSet rs=m.executeDBQuery("select * from ptaxscale where sqno='"+i+"'");
		if(rs.next())
			m.executeDBQuery("delete from ptaxscale where sqno='"+i+"'");
		m.closeResultSet();
		}
		catch(Exception e)
		{
			out.println("<center><b>DB ERROR!!!!</b><br/>");
			out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
			out.close();
			break;
		}
	}
	else
	{
		try{
			Database d=new Database();
			ResultSet rs=d.executeDBQuery("select * from ptaxscale where sqno='"+x+"'");
			
			if(rs.next())
				d.executeDBUpdate("update ptaxscale set lopt='"+low+"',hipt='"+high+"',ptax='"+value+"' where sqno='"+i+"'");
			else
				d.executeDBUpdate("insert into ptaxscale values('"+ x+"','"+low+"','"+high+"','"+value+"')");
			x++;
			d.closeConnections();
			}
			catch(Exception e)
			{
				out.println("<center><b>DB ERROR!!!!</b><br/>");
				out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
				out.close();
			break;
		}
	}
}
if(i==9)
{
	out.println("<center><b>Data Successfully Updated!!!</b><br/>");
	out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
}
%>
</body>
</html>