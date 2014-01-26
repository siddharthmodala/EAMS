<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbpackage.*" %>
     <%@ page import="java.sql.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Calendar"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Employee</title>
</head>
<body background="../images/bg83.jpeg">
<br></br><br></br>
<%
Database db=new Database();
String months[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
ResultSet rs=db.executeDBQuery("select * from Employees where empid='"+request.getParameter("empcode")+"'");
String str="insert into rememployees values(";
try{
	if(rs.next())
	{
		ResultSetMetaData rsmd=rs.getMetaData();
		for(int i=1;i<=rsmd.getColumnCount();i++)
		{
			if(rsmd.getColumnName(i).equals("DOJ"))
			{
				Calendar d = Calendar.getInstance();
				java.util.Date x = rs.getDate(i);
				d.setTime(x);
				str+="'"+d.get(Calendar.DATE)+"-"+months[d.get(Calendar.MONTH)]+"-"+(d.get(Calendar.YEAR))+"',";
			}
			else
			{
			str+="'"+rs.getString(i)+"',";
			}
		}
		str+="'"+request.getParameter("ddl")+"-"+request.getParameter("mml")+"-"+request.getParameter("yyl")+"')";
		db.addDBBatch(str);
		db.addDBBatch("delete from psaldtls where empid='"+request.getParameter("empcode")+"'");
		db.addDBBatch("delete from leaves where empid='"+request.getParameter("empcode")+"'");
		db.addDBBatch("delete from eduqualifications where empid='"+request.getParameter("empcode")+"'");
		db.addDBBatch("delete from certificates where empid='"+request.getParameter("empcode")+"'");
		db.addDBBatch("delete from employees where empid='"+request.getParameter("empcode")+"'");
		db.addDBBatch("delete from login where loginid='"+request.getParameter("empcode")+"'");
		db.setDBAutoCommit(false);
		db.executeDBBatch();
		db.DBCommit();
		out.println("<center><b>Employee successfully removed</b></center>");
	}
	else
	{
		out.println("<center><h4>Invalid Empcode</h4><br><a href='../Establishment/RemoveEmployee.html'>back</a></center>");
	}
}
catch(Exception e)
{
	out.println("unable to delete employee"+e);
	db.DBRollback();
}
finally{
	db.setDBAutoCommit(true);
	db.closeResultSet();	
}
%>
</body>
</html>