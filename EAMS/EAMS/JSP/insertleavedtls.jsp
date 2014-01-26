<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Leave details</title>
</head>
<body background="../Images/bg85.jpeg">
<%
int cls=Integer.parseInt(request.getParameter("cls"));
int els=Integer.parseInt( request.getParameter("els"));
int hpls=Integer.parseInt(request.getParameter("hpls"));
int scls=Integer.parseInt(request.getParameter("scls"));
int mls=Integer.parseInt(request.getParameter("mls"));
Database d = new Database();
ResultSet rs=null;
int cnt=0;
try {		
	
	rs=d.executeDBQuery("select * from leavelimits");  
	if(rs.next())
	{
		if(rs.getInt(1)>0 && cls>rs.getInt(1))
		{cls=rs.getInt(1);cnt=1;}
		if(rs.getInt(2)>0 && els>rs.getInt(2))
			{els=rs.getInt(2);cnt=1;}
		if(rs.getInt(3)>0 && hpls>rs.getInt(3))
			{hpls=rs.getInt(3);cnt=1;}
		if(rs.getInt(4)>0 && scls>rs.getInt(4))
			{scls=rs.getInt(4);cnt=1;}
		if(rs.getInt(5)>0 && mls>rs.getInt(5))
			{mls=rs.getInt(5);cnt=1;}
	}
	else
		throw new Exception(" Leave Limits not inserted. Please contract Administator.<br> Leave details not inserted. ");
	try 
		{
			String query = "insert into leaves values('"+request.getParameter("empcode")+"',";
			query +=" "+cls+","+els+","+hpls+","+scls+","+mls+")";			
			d.executeDBUpdate(query);
			d.closeConnections();
			out.println("<br><br><br><center><b>Leave Details Inserted</b></center>");
			if(cnt==1)
				out.println("<br><br><center><b>Some leave details truncated</b></center>");
		} 
		catch (SQLException e)
		{
			d.closeConnections();
			out.println("<br><br><center><b>Error inserting details!!<br>Employee Code may not exist or Leave details already inserted.</b></center>");
			out.println("<center><br><input type='button' value='Back' onClick='javascript:history.go(-1);'></input></center>");
		}
	}
	catch (Exception e)
	{
		out.println("<br><br><center><b>"+e.getMessage()+"</b></center>");
		out.println("<center><br><input type='button' value='Back' onClick='javascript:history.go(-1);'></input></center>");
	}
%>
</body>
</html>