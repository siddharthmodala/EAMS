<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>certificate</title>
</head>
<body background="../Images/bg86.jpeg">
<% 
String empid=request.getParameter("empid");
String certi,status,remark;
Database db=null;
try{
db=new Database();
db.setDBAutoCommit(false);
db.executeDBUpdate("delete from certificates where empid='"+empid+"'");
for(int i=1;i>0;i++)
{
	certi=request.getParameter("select"+i);
	status=request.getParameter("status"+i);
	remark=request.getParameter("remark"+i);
	if(certi==null)
		break;
	else
	{
	
		if(remark==null)
			remark="";
		db.executeDBUpdate("insert into certificates values('"+empid+"','"+certi+"','"+status+"','"+remark+"')");
	}
}
db.DBCommit();
out.println("<br><br><center>Details succesfully updated<br><a href='../Establishment/Certificates1.jsp'>back</a><center>");
}
catch(Exception e)
{
	out.println("<center>Updation not succesfull.please try again</center>"+e);
	db.DBRollback();
}
finally{
	db.setDBAutoCommit(true);
	db.closeConnections();
}
%>
</body>
</html>