<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Leave Details</title>
</head>
<body background="../Images/bg85.jpeg">
<%
	Database d=null;
try{
		
	String str=request.getParameter("empcode");
	try{
		d=new Database();
		d.setDBAutoCommit(false);
		int count=d.executeDBUpdate("delete from leaves where empid='"+str+"'");
		d.DBCommit();
		d.setDBAutoCommit(true);
		d.closeConnections();
		if(count==0)
		{
			out.println("<br><br><br><center><b>Leave details of the employee doesn't exist to remove.</b></center>");			
		}
		else
		out.println("<br><br><br><center><b>Records Successfully Deleted</b></center>");
	}
	catch(SQLException e)
	{
		d.setDBAutoCommit(true);
		out.println("<br><br><br><center><b>unable to delete the details</b></center>");
		d.closeConnections();
	}
}
catch(Exception e)
{
}
%>
<center><br><input type='button' value='Back' onClick="javascript:history.go(-1)"></center>
</body>
</html>