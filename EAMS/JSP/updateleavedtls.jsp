<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Leave Details</title>
</head>
<body background="../Images/bg85.jpeg">
<br><br>
<%
Database db=new Database();
Database db2=new Database();
ResultSet rs=null;
String empid=request.getParameter("empid");
int lvs=Integer.parseInt(request.getParameter("lvtp"));
int ltc=Integer.parseInt(request.getParameter("uls"));
String ult=request.getParameter("ult");
String ltype=request.getParameter("ltype");
int leaves=0,cnt=0;
try
{	
	if(ult.equals("add"))
	{
		leaves=lvs+ltc;
		rs=db2.executeDBQuery("select * from leavelimits");
		if(rs.next())
		{	
		if(ltype.equals("CLs"))
		{
			if(rs.getInt(1)>0)
			if(leaves>rs.getInt(1))
				{leaves=rs.getInt(1);cnt=1;}
		}	
		if(ltype.equals("ELs"))
		{
			if(rs.getInt(2)>0)				
			if(leaves>rs.getInt(2))
				{leaves=rs.getInt(2);cnt=1;}
		}
		if(ltype.equals("HPLs"))
		{
			if(rs.getInt(3)>0)
			if(leaves>rs.getInt(3))
				{leaves=rs.getInt(3);cnt=1;}
		}
		if(ltype.equals("SCLs"))
		{
			if(rs.getInt(4)>0)
			if(leaves>rs.getInt(4))
				{leaves=rs.getInt(4);cnt=1;}
		}
		if(ltype.equals("MLs"))
		{
			if(rs.getInt(5)>0)
			if(leaves>rs.getInt(5))
				{leaves=rs.getInt(5);cnt=1;}
		}		
		if(ltype.equals("MTLs"))
		{
			if(leaves>92)
				{leaves=92;cnt=1;}
		}
	}
		else
			throw new Exception(" Leave Limits not inserted. Please contract Administator.<br> Leave details not updated. ");
	}
	if(ult.equals("sub"))
	{
		leaves=lvs-ltc;
		if(leaves<0)
			{leaves=0;cnt=1;}
	}
	db.executeDBUpdate("update leaves set "+ltype+"='"+leaves+"' where empid='"+empid+"'");
	db.closeConnections();
	out.println("<center><b>Leave Details updated successfully.</b></center>");
	if(cnt==1)
	{
		out.println("<br><br><center><b>Leave details truncated.</b></center>");
	}
}
catch(Exception e)
{
	out.println("<center><b>"+e.getMessage()+"</b></center>");
}
%>
<br><br>
<center><input type="Button" value="Back" onclick="javascript:history.go(-2)"></input></center>
</body>
</html>