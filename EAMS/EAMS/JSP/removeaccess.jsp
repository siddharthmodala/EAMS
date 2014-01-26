<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="dbpackage.*" %>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Access</title>
</head>
<body background="../Images/bg86.jpeg">
<center>
<%
Database db=new Database();
int i=0,t=0;
String uid=request.getParameter("userid");
int type=Integer.parseInt(request.getParameter("type"));
if(uid.equals("administrator"))
{
	out.println("<center><br><br>Cannot Delete Administrator Account<br>");
	out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
}
else
{
String str="select userid,accesstype from Login where userid='"+uid+"'";
try
{
	ResultSet rs=db.executeDBQuery(str);
	if(rs.next())
	{
		if(rs.getString(2).equals("Accountant") || rs.getString(2).equals("AccountsManager"))			
			t=1;	
		else if(rs.getString(2).equals("Establishment") || rs.getString(2).equals("Clerk"))
			t=2;
		if(type==0)		
			    str="delete from login where userid='"+uid+"'";
		else if(type==t)
				str="delete from login where userid='"+uid+"'";
		else
			throw new Exception("<br>No privilege to remove the access of this employee<br>");
		
		     try {
		         db.executeDBUpdate(str);
		         db.closeResultSet();
		         out.println("<br><br><b>User removed Successfully</b><br>");
		         }
		         catch(SQLException e)
		         {
		        	 out.println("<br><br><b>Unable to Remove the User</b><br>");
		        	 db.closeResultSet();
		         }
		}
		else
		out.println("<center><br><br> User ID doesn't exist . Please enter correct User ID <br>" );
out.println("<a href='javascript:history.go(-1)'><b>back</b></a></center>");
	}
catch(Exception e)
{
	out.println("<br>Unable to get user details.<br>"+e.getMessage());
	db.closeResultSet();
}
}
%>
</center>
</body>
</html>