<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbpackage.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
</head>
<body background="../Images/bg84.jpeg">
<br><br><br>
<table align="center" border="1" >
<caption><b> User Details<br><br></br></b></caption>
<tr>
<th>User ID</th>
<th>Access type</th>
</tr> 
<%
String query=null;
int type=Integer.parseInt(request.getParameter("type"));
if(type==0)
	query="select userid,accesstype from login order by (accesstype,userid)";
else if(type==1)
	query="select userid,accesstype from login where accesstype in ('Accountant','AccountsManager') order by accesstype,userid";
else if(type==2)
	query="select userid,accesstype from login where accesstype in ('Establishment','Clerk') order by accesstype,userid ";
else
	query=null;
try
{
Database db= new Database();
ResultSet rs= db.executeDBQuery(query);
ResultSetMetaData rsmd=rs.getMetaData();
if(rs.next())
{
do
{
	if(!rs.getString(1).equals("administrator"))
	{
	%>	
		<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td></tr>
	<%
	}
}while(rs.next());
}
else
{
	out.println("<center>No users in the Database</center>");
}
}
catch(Exception e)
{
out.println("<center>DB Error!!!</center>"+e);
}
%>
</table>
</body>
</html>