<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="dbpackage.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="../Images/bg87.jpeg">
<%
Database db=new Database();
String table="salary"+request.getParameter("fyear")+"_"+request.getParameter("lyear");
String month=request.getParameter("month");
String empid=null,query=null;
ResultSet rs=null;
try
{
	rs=db.executeDBQuery("select "+month+" from freezeacc where year='"+request.getParameter("fyear")+"'");
	if(rs.next())
	{
	  if(rs.getInt(1)==1)
	  {
		  out.println("<br><br><center><b>Accounts for the given month are freezed. You cannot delete the details.</b></center>");		  
	  }
	  else
	  {		  
		  if(request.getParameter("ewise")!=null)
		  {
		  empid=request.getParameter("empid");		  
		  query="delete from "+table+" where month='"+month+"' and empid='"+empid+"'";
		  }
		  else
		  {		  	
		  	query="delete from "+table+" where month='"+month+"'";
		  }
		  try
		  {
			  int n=db.executeDBUpdate(query);
			  if(n==0)
			  {
				  out.println("<br><br><center><b>Salary details for the given details not found in the database to delete.</b></center>");
			  }
			  else
			  {
				  out.println("<br><br><center><b>Salary details successfully deleted.</b></center>");
			  }
		  }
		  catch(Exception e)
		  {
			  out.println("<br><br><center><b>Unable to delete Salary details.</b></center>");
		  }	  
	  }
	}
	else
	{
		out.println("<br><br><center><b>Financial table not created for the given financial year</b></center>");
	}
}
catch(Exception e)
{
	out.println("<br><br><center><b>Financial year details not found in freezeaccounts.</b></center>");
}
finally
{
	out.println("<br><br><center><b><a href='../Accountant/DeleteCurSalDtlsPrompt.html' target='f3'>Back</a></b></center>");
}
%>
</body>
</html>