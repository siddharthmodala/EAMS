<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*" %>
<%@ page import="java.sql.*" %>   
<%@ page import="java.util.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Financial Year</title>
</head>
<body background="../Images/bg86.jpeg">
<%
String fyear=request.getParameter("fyear");
String lyear=request.getParameter("lyear");
String table="salary"+fyear+"_"+lyear;
Database db= new Database();
try
{
	ResultSet rs=db.executeDBQuery("select * from salyear");
	db.setDBAutoCommit(false);
	if(rs.next())
	{		
		int year=rs.getInt(1);		
		if(year<Integer.parseInt(fyear))
		{
			db.executeDBUpdate("update salyear set year="+fyear);
		}
		else
		{
			out.println("<br><br><center><b> No provision to create</b></center>");
			throw new Exception();
		}
	}
	else
	{
		db.executeDBUpdate("insert into salyear values ("+fyear+",2)");
	}
	db.executeDBQuery(" create table "+table+" ("+
			 "empid varchar2(20),"+
			 "ename varchar2(30),"+
			 "designation varchar2(60),"+
			 "month varchar2(10),"+
			 "basic number(8),"+
			 "dp number(8),"+
			 "mergebasic number(8),"+
			 "da number(8),"+
			 "hra number(8),"+
			 "cca number(8),"+
			 "splal number(8),"+
			 "arrs number(8),"+
			 "grssal number(10),"+
			 "itax number(8),"+
			 "pf number(8),"+
			 "ptax number(8),"+
			 "lic number(8),"+
			 "gis number(8),"+
			 "lop number(8),"+
			 "trpt number(8),"+
			 "vehcl number(8),"+
			 "abl number(8),"+
			 "soc number(8),"+
			 "others number(8),"+
			 "totdeduction number(10),"+
			 "netsal number(10),"+
			 "primary key (empid,month))");
	db.executeDBQuery("insert into freezeacc values("+fyear+",0,0,0,0,0,0,0,0,0,0,0,0)");
	db.DBCommit();
	out.println("<br><br><center><b> Financial Tables successfully created </b></center>");
}
catch(Exception e)
{
	out.println("<br><br><center><b> Table might already exist </b></center>");
	db.DBRollback();
}
finally
{
	db.setDBAutoCommit(true);
}
%>
</body>
</html>