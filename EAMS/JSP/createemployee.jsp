<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dbpackage.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create new employee</title>
</head>
<body background="../Images/bg85.jpeg">
<%
String empid=request.getParameter("empid");
String post=request.getParameter("post");
String dept=request.getParameter("dept");
String designation=request.getParameter("designation");
String doj=request.getParameter("doj")+"-"+request.getParameter("moj")+"-"+request.getParameter("yoj");
String ename=request.getParameter("ename");
String sex=request.getParameter("sex");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String dob=request.getParameter("dob")+"-"+request.getParameter("mob")+"-"+request.getParameter("yob");
String bgp=request.getParameter("bgp");
String caste=request.getParameter("caste");
String religion=request.getParameter("religion");
String caddr=request.getParameter("caddr");
String paddr=request.getParameter("paddr");
String phno=request.getParameter("phno");
String cellno=request.getParameter("cellno");
String emailid=request.getParameter("emailid");
String photo=request.getParameter("photo");
String sbacno=request.getParameter("sbacno");
String pfno=request.getParameter("pfno");
String panno=request.getParameter("panno");
String paytype=request.getParameter("paytype");
String scale=request.getParameter("scale");
String basic=request.getParameter("basic");
String moi=request.getParameter("moi");
String spec=request.getParameter("spec");
String te=request.getParameter("te");
String ie=request.getParameter("ie");
String oe=request.getParameter("oe");
String re=request.getParameter("re");
String ve=request.getParameter("ve");

String rep="''";
String ch="'";
caddr=caddr.replaceAll(ch,rep);
paddr=paddr.replaceAll(ch,rep);
spec=spec.replaceAll(ch,rep);
caste=caste.replaceAll(ch,rep);
religion=religion.replaceAll(ch,rep);
Database db=null;
try{
	db=new Database();
	String query="insert into employees values("+
			"'"+empid +"',"+
			"'"+ename+"',"+
			"'"+fname+"',"+
			"'"+mname+"',"+
			"'"+dob+"',"+
			"'"+sex+"',"+
			"'"+bgp+"',"+
			"'"+caste+"',"+
			"'"+religion+"',"+
			"'"+paddr+"',"+
			"'"+caddr+"',"+
			"'"+phno+"',"+
			"'"+cellno+"',"+
			"'"+emailid+"',"+
			"'"+post+"',"+
			"'"+designation+"',"+
			"'"+dept+"',"+
			"'"+doj+"',"+
			"'"+sbacno+"',"+
			"'"+panno+"',"+
			"'"+pfno+"',"+
			"'"+paytype+"',"+
			"'"+scale+"',"+
			"'"+basic+"',"+
			"'"+moi+"',"+
			"'"+spec+"',"+
			"'"+te+"',"+
			"'"+re+"',"+
			"'"+ie+"',"+
			"'"+oe+"',"+
			"'"+ve+"',"+
			"'"+photo+"')";	
	db.setDBAutoCommit(false);
	System.out.println(query);
	db.executeDBUpdate(query);
	db.executeDBUpdate("insert into login values('"+empid+"','"+empid+"','Employee')");
	db.executeDBUpdate("insert into psaldtls values('"+empid+"',0,0,0,0,0,0,0,0,0,0)");
	db.executeDBUpdate("insert into leaves values('"+empid+"',0,0,0,0,0)");
	db.DBCommit();
	out.println("<br><br><br><center><b>Employee record succesfully created.</b></center>");
	out.close();
}
catch(SQLException e)
{
	db.DBRollback();
	out.println("<center>Unable to create employee record.The following error occured<br>"+e+"</center>");	
}
catch(Exception e)
{
	db.DBRollback();
	out.println("<center>unknown error!!!<br>"+e+"</center>");
}
finally{
	db.setDBAutoCommit(true);
	db.closeConnections();	
}
%>
</body>
</html>