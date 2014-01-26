<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,dbpackage.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Educational Qualification</title>
</head>
<body background="../Images/bg86.jpeg">
<% 
String empid=request.getParameter("empid");
String degree,univ,yop,cl,spec,percent,remark;
Database db=null;
try{
db=new Database();
db.setDBAutoCommit(false);
db.executeDBUpdate("delete from eduqualifications where empid='"+empid+"'");
for(int i=1;i>0;i++)
{
	degree=request.getParameter("select"+i);
	univ=request.getParameter("univ"+i);
	yop=request.getParameter("yop"+i);
	cl=request.getParameter("class"+i);
	spec=request.getParameter("spec"+i);
	percent=request.getParameter("percent"+i);
	remark=request.getParameter("remark"+i);
	if(degree==null)
		break;
	else
	{
		if(spec==null)
			spec="";
		if(remark==null)
			remark="";
		db.executeDBUpdate("insert into eduqualifications values('"+empid+"','"+degree+"','"+univ+"','"+yop+"','"+cl+"','"+percent+"','"+spec+"','"+remark+"')");
	}
}
db.DBCommit();
out.println("<br><br><center>Details succesfully updated<br><a href='../Establishment/EduQualification1.jsp'>back</a><center>");
}
catch(Exception e)
{
	out.println("<center>Updation not succesfull.please try again</center>");
	db.DBRollback();
}
finally{
	db.setDBAutoCommit(true);
	db.closeConnections();
}
%>
</body>
</html>