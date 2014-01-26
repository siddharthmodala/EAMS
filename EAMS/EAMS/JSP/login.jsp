<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*"%>
   <%@ page import="java.io.*" %>
   <%@ page import="dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<% String username=null,password=null;
	username=request.getParameter("loginId");
	password=request.getParameter("password");
	if(username==null || username.equals(""))
	{
		response.sendRedirect("../ErrorLogin.html");
	}
	else
	{
		Database db=new Database();
	try{
		ResultSet rs=db.executeDBQuery("select password from login where userid='"+username+"'");
		if(rs.next())
		{
			String str=rs.getString(1);
			if (str.equals(password))
			{
				rs=db.executeDBQuery("select accesstype from Login where userid='"+username+"'");
				rs.next();
				String access=rs.getString(1);
				try
				{
				if(access.equals("AccountsManager"))
				   response.sendRedirect("../AccountsManager/AccountsManager.jsp");	
				else if(access.equals("Accountant"))
				   response.sendRedirect("../Accountant/Accountant.html");
				else if(access.equals("Clerk"))
					response.sendRedirect("../Clerk/Clerk.html");
				else if(access.equals("Establishment"))
					   response.sendRedirect("../Establishment/Establishment.html");
				else if(access.equals("Employee"))
					response.sendRedirect("../Employee/Employee.html");
				else if(access.equals("Administrator"))
					response.sendRedirect("../Administrator/Administrator.html");
				}
				catch(IOException e)
				{
				  out.println("Cannot locate homepage");
				}
			}
			else
			response.sendRedirect("../ErrorLogin.html");
		}
		else
		response.sendRedirect("../ErrorLogin.html");
	}
	catch(SQLException e)
	{
		out.println("Unable to connect to DataBase");
	}
	catch ( ClassNotFoundException e)
	{
		out.println("Oracle Driver not found");
	}
	catch(Exception e)
	{
		out.println("Oracle not initialized");
	}
finally{
			try{
				db.closeResultSet();
				}
				catch(Exception e)
				{
					out.println("Error closing Database Streams");
				}
	}
	}
	%>

</body>
</html>