<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body background="../Images/bg86.jpeg">
<%
	String username=request.getParameter("userid");
	String opswd=request.getParameter("oldpswd");
	String npswd=request.getParameter("newpswd");
	Database db=new Database();
	try{
		ResultSet rs=db.executeDBQuery("select password from login where userid='"+username+"'");
		rs.next();
		if ((rs.getString(1)).equals(opswd))
		{
			try {
			String str="update login set password='"+npswd+"' where userid='"+username+"'";
			db.executeDBUpdate(str);
			db.closeConnections();
			out.println(" <h4 align='center'>Password Changed Successfully</h4>");
			}
			catch(Exception e)
			{
				out.println(" <h4 align='center'>unable to change the password </h4>");
				db.closeConnections();
			}
		}
		else
		{
			out.println("<h4 align='center'> Old Password doesn't match. Please validate yourself.</h4>");
			db.closeConnections();
		}	
	}
	catch(Exception e)
	{
		out.println(" <h4 align='center'>User ID doesn't exist. Please enter values correctly</h4>");
		db.closeConnections();
	}
%>
</body>
</html>